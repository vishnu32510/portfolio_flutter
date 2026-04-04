/// Helpers for resolving favicon image URLs from arbitrary websites.
class FaviconUtils {
  FaviconUtils._();

  /// Public favicon image URL for [websiteUrl] via the Google favicon service (no API key).
  ///
  /// Uses gstatic directly (same asset as `google.com/s2/favicons` after redirect)
  /// so Flutter web does not depend on following that 301 when decoding.
  static String? urlForWebsite(String websiteUrl) {
    try {
      final uri = Uri.parse(websiteUrl.trim());
      if (!uri.hasScheme || uri.host.isEmpty) return null;
      var host = uri.host.toLowerCase();
      if (host.startsWith('www.')) host = host.substring(4);
      final origin = Uri.encodeComponent('http://$host');
      return 'https://t3.gstatic.com/faviconV2'
          '?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL'
          '&url=$origin&size=128';
    } catch (_) {
      return null;
    }
  }
}
