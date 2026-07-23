# Playwright responsive smoke check
#
# Usage (from repo root):
#   npm install --no-save playwright
#   npx playwright install chromium
#   node tool/responsive_check.js
#
# Results are written to tool/responsive-results/ (gitignored).
# Flutter Canvas limits DOM text assertions; see summary.json for
# checked vs notChecked fields.
