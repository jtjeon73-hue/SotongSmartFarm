/**
 * Responsive smoke checks against live Hosting.
 * Flutter Canvas limits DOM text assertions — report HTTP vs visual separately.
 */
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const BASE = process.env.BASE || 'https://sotong-smart-farm.web.app';
const SIZES = [
  [360, 800],
  [390, 844],
  [412, 915],
  [768, 1024],
  [1024, 768],
  [1440, 900],
  [1920, 1080],
];
const PATHS = [
  '/',
  '/overview/what-is-smart-farm',
  '/sensors/temp-humidity',
  '/control/interlock',
  '/communication/modbus-rtu',
  '/ai/anomaly',
  '/tools',
  '/checklists',
  '/prompts',
  '/project/report',
  '/fmea',
  '/fat-sat',
  '/runbooks',
  '/expert-tools',
  '/expert/architecture',
];

const outDir = path.join('tool', 'responsive-results');
fs.mkdirSync(outDir, { recursive: true });

function isDesktop(w) {
  return w >= 1024;
}

async function waitForFlutter(page) {
  await page.waitForLoadState('domcontentloaded');
  // Flutter web paints into canvas/flt-glass-pane
  await page.waitForTimeout(2500);
  const hasFlutter = await page.evaluate(() => {
    return !!(
      document.querySelector('flt-glass-pane') ||
      document.querySelector('flutter-view') ||
      document.querySelector('canvas')
    );
  });
  return hasFlutter;
}

async function checkOverflow(page) {
  return page.evaluate(() => {
    const doc = document.documentElement;
    const body = document.body;
    const overflowX =
      Math.max(doc.scrollWidth, body.scrollWidth) > Math.ceil(window.innerWidth) + 1;
    const scrollY = Math.max(doc.scrollHeight, body.scrollHeight) > window.innerHeight;
    return {
      overflowX,
      hasVerticalScrollPotential: scrollY,
      scrollWidth: Math.max(doc.scrollWidth, body.scrollWidth),
      innerWidth: window.innerWidth,
    };
  });
}

async function measureHeader(page) {
  return page.evaluate(() => {
    const candidates = [
      ...document.querySelectorAll('header, flt-glass-pane, flutter-view, body'),
    ];
    // For Flutter, approximate from top fixed region via screenshot metrics is hard;
    // report body client metrics instead.
    return {
      clientHeight: document.documentElement.clientHeight,
      note: 'Flutter Canvas — DOM header height not reliably measurable',
    };
  });
}

(async () => {
  const browser = await chromium.launch({ headless: true });
  const results = [];

  for (const [w, h] of SIZES) {
    for (const p of PATHS) {
      const page = await browser.newPage({ viewport: { width: w, height: h } });
      const url = BASE + p;
      const item = {
        size: `${w}x${h}`,
        path: p,
        httpStatus: null,
        flutterRendered: false,
        overflowX: null,
        desktopSidebarExpected: isDesktop(w),
        menuOpenAttempted: false,
        menuClosedAfterSelect: null,
        screenshot: null,
        errors: [],
        checked: [],
        notChecked: [
          'DOM text content (Flutter Canvas)',
          'exact AppBar pixel height',
          'clipboard copy success toast text via DOM',
          'minimum touch target via Flutter semantics tree',
        ],
      };

      try {
        const resp = await page.goto(url, {
          waitUntil: 'domcontentloaded',
          timeout: 45000,
        });
        item.httpStatus = resp ? resp.status() : null;
        item.checked.push('HTTP status');
        item.flutterRendered = await waitForFlutter(page);
        item.checked.push('Flutter canvas/view presence');

        const overflow = await checkOverflow(page);
        item.overflowX = overflow.overflowX;
        item.checked.push('document horizontal overflow heuristic');

        item.headerMeta = await measureHeader(page);
        item.checked.push('viewport client metrics');

        const shotName = `shot_${w}x${h}${p.replace(/\//g, '_') || '_home'}.png`;
        const shotPath = path.join(outDir, shotName);
        await page.screenshot({ path: shotPath, fullPage: false });
        item.screenshot = shotPath;
        item.checked.push('viewport screenshot saved');

        if (!isDesktop(w) && p === '/') {
          item.menuOpenAttempted = true;
          await page.mouse.click(24, 28);
          await page.waitForTimeout(800);
          item.checked.push('mobile top-left tap (hamburger region heuristic)');
          await page.mouse.click(Math.min(120, w - 20), Math.min(220, h - 20));
          await page.waitForTimeout(800);
          item.menuClosedAfterSelect = 'inconclusive_canvas';
          item.notChecked.push('menu auto-close verified via DOM');
        }      } catch (e) {
        item.errors.push(e.message);
      }

      results.push(item);
      await page.close();
    }
  }

  await browser.close();

  const summary = {
    base: BASE,
    generatedAt: new Date().toISOString(),
    note:
      'Flutter Web uses Canvas; DOM text/menu assertions are limited. HTTP + render + overflow heuristics + screenshots are primary evidence.',
    totals: {
      cases: results.length,
      httpOk: results.filter((r) => r.httpStatus === 200).length,
      rendered: results.filter((r) => r.flutterRendered).length,
      overflowX: results.filter((r) => r.overflowX).length,
      errors: results.filter((r) => r.errors.length).length,
    },
    results,
  };

  const jsonPath = path.join(outDir, 'summary.json');
  fs.writeFileSync(jsonPath, JSON.stringify(summary, null, 2));
  console.log(JSON.stringify(summary.totals));
  console.log(`wrote ${jsonPath}`);
  if (summary.totals.errors > 0 || summary.totals.httpOk !== summary.totals.cases) {
    process.exitCode = 1;
  }
})();
