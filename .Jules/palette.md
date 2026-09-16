## 2025-02-12 - Accessibility for Icon-only Interactive Widgets
**Learning:** Icon-only gesture widgets (like `GestureDetector` containing only an `Icon`) lack native semantic meaning. Without explicitly wrapping them, screen readers fail to communicate their purpose to users.
**Action:** When creating icon-only interactive elements using raw gesture detectors, always wrap them with a `Semantics` widget providing an action-oriented label and a `Tooltip` for visual hover feedback.
