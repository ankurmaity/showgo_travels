import 'package:url_launcher/url_launcher.dart';

class Utils{
  static Future<void> launchWebUrl(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }
}