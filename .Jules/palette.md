## 2024-05-19 - Added Tooltips to Interactive Image Logos
**Learning:** Icon-only interactive elements lacking textual context (like brand logos that open a website when clicked) can confuse users about what action will occur, reducing confidence in navigation. Adding tooltips displaying the destination (e.g. "Visit example.com") greatly enhances accessibility and clarity.
**Action:** When creating image or icon-based interactive elements, always ensure there is a `Tooltip` (or `Semantics` label) conveying the expected action or destination.
## 2026-09-17 - Wrap InkWell interactions with Semantics
**Learning:** Interactive widgets like `InkWell` do not implicitly communicate their purpose to assistive technologies when they rely solely on non-text elements or generic containers.
**Action:** Always wrap interactive `InkWell` widgets with `Semantics(button: true, label: 'Descriptive Action', child: ...)`.
