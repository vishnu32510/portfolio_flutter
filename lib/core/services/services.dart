import 'package:url_launcher/url_launcher.dart';

abstract class Services {}

class OpenLinkService extends Services {
  void openUrl({required String link}) async {
    if (!await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch $link');
    }
  }
}
