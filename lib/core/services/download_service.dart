import 'package:portfolio_flutter/core/services/services.dart';

abstract class DownloadService extends Services {
  Future<void> downloadResume({required String url});
}

class WebDownloadService implements DownloadService {
  @override
  Future<void> downloadResume({required String url}) async {
    OpenLinkService().openUrl(link: url);
  }
}

class MobileDownloadService implements DownloadService {
  @override
  Future<void> downloadResume({required String url}) async {
    OpenLinkService().openUrl(link: url);
  }
}
