/**
 * Responsive smoke checks against live Hosting (or BASE env).
 * Flutter Canvas limits DOM text assertions — report HTTP vs visual separately.
 * Does not treat Canvas-unverifiable a11y as pass.
 */
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const BASE = process.env.BASE || 'https://sotong-smart-farm.web.app';
const RUNBOOKS_ONLY = process.env.RUNBOOKS_ONLY === '1';
const RUNBOOKS_REPEATS = Number(process.env.RUNBOOKS_REPEATS || '3');

const SIZES = [
  [360, 800],
  [390, 844],
  [412, 915],
  [768, 1024],
  [1024, 768],
  [1440, 900],
  [1920, 1080],
];

const PATHS = RUNBOOKS_ONLY
  ? ['/runbooks']
  : [
      '/',
      '/overview/what-is-smart-farm',
      '/sensors/temp-humidity',
      '/control/interlock',
      '/communication/modbus-rtu',
      '/ai/anomaly',
      '/tools',
      '/expert-tools',
      '/fmea',
      '/fat-sat',
      '/runbooks',
      '/code-examples',
      '/checklists',
      '/prompts',
      '/project/report',
    ];

const outDir = path.join('tool', 'responsive-results');
fs.mkdirSync(outDir, { recursive: true });

function isDesktop(w) {
  return w >= 1024;
}

async function waitForFlutter(page, timeoutMs = 20000) {
  const start = Date.now();
  while (Date.now() - start < timeoutMs) {
    const hasFlutter = await page.evaluate(() => {
      return !!(
        document.querySelector('flt-glass-pane') ||
        document.querySelector('flutter-view') ||
        document.querySelector('flt-scene-host') ||
        document.querySelector('canvas')
      );
    });
    if (hasFlutter) return true;
    await page.waitForTimeout(400);
  }
  return false;
}

async function checkOverflow(page) {
  return page.evaluate(() => {
    const doc = document.documentElement;
    const body = document.body;
    const overflowX =
      Math.max(doc.scrollWidth, body.scrollWidth) >
      Math.ceil(window.innerWidth) + 1;
    return {
      overflowX,
      scrollWidth: Math.max(doc.scrollWidth, body.scrollWidth),
      innerWidth: window.innerWidth,
    };
  });
}

async function checkOne(browser, w, h, p, attempt) {
  const page = await browser.newPage({ viewport: { width: w, height: h } });
  const pageErrors = [];
  page.on('pageerror', (err) => pageErrors.push(String(err)));
  const url = BASE + p;
  const item = {
    size: `${w}x${h}`,
    path: p,
    attempt,
    httpStatus: null,
    flutterRendered: false,
    overflowX: null,
    pageErrors: [],
    desktopSidebarExpected: isDesktop(w),
    screenshot: null,
    errors: [],
    checked: [],
    notChecked: [
      'DOM text content (Flutter Canvas)',
      'exact AppBar pixel height',
      'clipboard copy success toast text via DOM',
      'minimum touch target via Flutter semantics tree',
      'color contrast (Canvas)',
    ],
    diagnosis: null,
  };

  try {
    const resp = await page.goto(url, {
      waitUntil: 'domcontentloaded',
      timeout: 45000,
    });
    item.httpStatus = resp ? resp.status() : null;
    item.checked.push('HTTP status');

    item.flutterRendered = await waitForFlutter(page, p === '/runbooks' ? 25000 : 20000);
    item.checked.push('Flutter canvas/view presence (polled)');

    // Extra settle for heavy list pages — not networkidle-only.
    if (p === '/runbooks') {
      await page.waitForTimeout(1200);
      if (!item.flutterRendered) {
        item.flutterRendered = await waitForFlutter(page, 8000);
        item.diagnosis = item.flutterRendered
          ? 'late_render_after_extra_wait'
          : 'flutter_not_detected_within_timeout';
      }
    }

    const overflow = await checkOverflow(page);
    item.overflowX = overflow.overflowX;
    item.checked.push('document horizontal overflow heuristic');

    const shotName = `shot_${w}x${h}${p.replace(/\//g, '_') || '_home'}_a${attempt}.png`;
    const shotPath = path.join(outDir, shotName);
    await page.screenshot({ path: shotPath, fullPage: false });
    item.screenshot = shotPath;
    item.checked.push('viewport screenshot saved');
    item.pageErrors = pageErrors;
    if (pageErrors.length) {
      item.errors.push(`pageerror:${pageErrors.join('|')}`);
    }
  } catch (e) {
    item.errors.push(e.message);
    item.diagnosis = 'exception_during_nav_or_wait';
    try {
      const shotPath = path.join(
        outDir,
        `fail_${w}x${h}${p.replace(/\//g, '_')}_a${attempt}.png`,
      );
      await page.screenshot({ path: shotPath, fullPage: false });
      item.screenshot = shotPath;
    } catch (_) {
      /* ignore */
    }
  }

  await page.close();
  return item;
}

(async () => {
  const browser = await chromium.launch({ headless: true });
  const results = [];
  const repeats = RUNBOOKS_ONLY ? RUNBOOKS_REPEATS : 1;

  for (let attempt = 1; attempt <= repeats; attempt++) {
    for (const [w, h] of SIZES) {
      for (const p of PATHS) {
        results.push(await checkOne(browser, w, h, p, attempt));
      }
    }
  }

  await browser.close();

  const summary = {
    base: BASE,
    generatedAt: new Date().toISOString(),
    mode: RUNBOOKS_ONLY ? `runbooks_repeat_${repeats}` : 'full_paths',
    note:
      'Flutter Web uses Canvas; DOM text/menu/a11y assertions are limited. ' +
      'HTTP + render poll + overflow + pageerror + screenshots are primary evidence. ' +
      'Unverified Canvas a11y is NOT counted as pass.',
    totals: {
      cases: results.length,
      httpOk: results.filter((r) => r.httpStatus === 200).length,
      rendered: results.filter((r) => r.flutterRendered).length,
      overflowX: results.filter((r) => r.overflowX).length,
      pageErrors: results.filter((r) => (r.pageErrors || []).length).length,
      errors: results.filter((r) => r.errors.length).length,
    },
    results,
  };

  const jsonPath = path.join(
    outDir,
    RUNBOOKS_ONLY ? 'runbooks-repeat-summary.json' : 'summary.json',
  );
  fs.writeFileSync(jsonPath, JSON.stringify(summary, null, 2));
  console.log(JSON.stringify(summary.totals));
  console.log(`wrote ${jsonPath}`);
  if (
    summary.totals.errors > 0 ||
    summary.totals.httpOk !== summary.totals.cases ||
    summary.totals.overflowX > 0
  ) {
    process.exitCode = 1;
  }
})();
