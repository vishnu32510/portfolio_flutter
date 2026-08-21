// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:js_interop';

@JS('gtag')
external void _jsGtag(JSString command, JSString action, [JSObject? params]);

void callWebGtag(String eventName, Map<String, dynamic>? parameters) {
  try {
    if (parameters != null) {
      final jsMap = parameters.jsify() as JSObject?;
      _jsGtag('event'.toJS, eventName.toJS, jsMap);
    } else {
      _jsGtag('event'.toJS, eventName.toJS);
    }
  } catch (_) {}
}
