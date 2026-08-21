export 'web_gtag_stub.dart'
    if (dart.library.html) 'web_gtag_web.dart'
    if (dart.library.js) 'web_gtag_web.dart';
