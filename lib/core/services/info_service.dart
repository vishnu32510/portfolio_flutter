import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  String appName = 'Unknown',
      packageName = 'Unknown',
      version = 'Unknown',
      buildNumber = 'Unknown',
      buildSignature = 'Unknown';
  String platform = "Unknown";

  Future getAppInfo() async {
    final info = await PackageInfo.fromPlatform();
    appName = info.appName;
    packageName = info.packageName;
    version = info.version;
    buildNumber = info.buildNumber;
    buildSignature = info.buildSignature;
  }
}
