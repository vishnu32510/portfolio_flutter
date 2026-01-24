import 'package:portfolio_flutter/core/services/services.dart';
import 'package:web/web.dart' as web;

abstract class DownloadService extends Services {
  Future<void> downloadResume({required String url});
}

class WebDownloadService implements DownloadService {
  @override
  Future<void> downloadResume({required String url}) async {
    web.window.open(url, "Resume");
  }
}

class MobileDownloadService implements DownloadService {
  @override
  Future<void> downloadResume({required String url}) async {
    OpenLinkService().openUrl(link: url);
  }
}
