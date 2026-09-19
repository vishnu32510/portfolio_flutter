## 2024-05-19 - Added Tooltips to Interactive Image Logos
**Learning:** Icon-only interactive elements lacking textual context (like brand logos that open a website when clicked) can confuse users about what action will occur, reducing confidence in navigation. Adding tooltips displaying the destination (e.g. "Visit example.com") greatly enhances accessibility and clarity.
**Action:** When creating image or icon-based interactive elements, always ensure there is a `Tooltip` (or `Semantics` label) conveying the expected action or destination.
## 2026-09-17 - Wrap InkWell interactions with Semantics
**Learning:** Interactive widgets like `InkWell` do not implicitly communicate their purpose to assistive technologies when they rely solely on non-text elements or generic containers.
**Action:** Always wrap interactive `InkWell` widgets with `Semantics(button: true, label: 'Descriptive Action', child: ...)`.

## 2026-09-17 - [Add Semantics to custom interactive elements]
**Learning:** Custom interactive elements like GestureDetector or InkWell in Flutter need an explicit Semantics wrapper with button: true and a label for screen readers to correctly identify and announce them as actionable buttons.
**Action:** When creating custom interactive elements (e.g. for resume download or social links), always wrap them in a Semantics widget with appropriate properties to ensure accessibility.
## 2026-09-19 - Contact Form Clarity Fix
**Learning:** Labels that imply in-app processing ('Submit') cause confusion when the actual action opens an external app (like an email client via mailto).
**Action:** Use precise verbs that match the outcome, such as 'Send via Email', and ensure feedback messages accurately reflect the technical behavior (e.g., 'Opening email client...' instead of 'Redirecting to Gmail!').
## 2026-09-19 - Add Semantics to GestureDetector
**Learning:** Custom interactive elements (like `GestureDetector`) often lack inherent accessibility properties, making them invisible or confusing to screen reader users. Adding a `Semantics` widget with `button: true` and a descriptive `label` ensures these elements are properly announced as actionable buttons by assistive technologies.
**Action:** Always wrap custom interactive elements (e.g., `GestureDetector`, `InkWell`) with a `Semantics` widget that provides a clear `label` and sets `button: true` when they function as buttons.
