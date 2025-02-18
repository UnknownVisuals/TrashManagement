import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/news/models/news_model.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;
  var hasMore = true.obs;
  var page = 1;
  final int pageSize = 5;

  WebViewController? webViewController;
  var isWebViewLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    REYHttpHelper.setBaseUrl('https://newsapi.org/v2');
    fetchNews();
  }

  void fetchNews() async {
    if (!hasMore.value) return;

    try {
      isLoading(true);
      final response = await REYHttpHelper.get(
        'everything?q=sampah%20OR%20lingkungan&language=id&page=$page&pageSize=$pageSize&apiKey=${dotenv.env['NEWS_API_KEY']}',
      );
      var fetchedNews = (response['articles'] as List)
          .map((data) => NewsModel.fromJson(data))
          .toList();
      if (fetchedNews.length < pageSize) {
        hasMore(false);
      }
      newsList.addAll(fetchedNews);
      page++;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching news: $e');
      }
    } finally {
      isLoading(false);
    }
  }

  void initializeWebViewController(String url) async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
    isWebViewLoading(false);
  }
}
