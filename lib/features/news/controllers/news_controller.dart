import 'package:get/get.dart';
import 'package:trash_management/features/news/models/news_model.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());
  final RxList<NewsModel> newsList = <NewsModel>[].obs;

  Rx<bool> isLoading = false.obs;
  Rx<bool> hasMore = false.obs;

  int page = 1;
  final int pageSize = 5;

  WebViewController? webViewController;
  Rx<bool> isWebViewLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  void getNews() async {
    if (isLoading.value) return;
    isLoading.value = true;

    REYHttpHelper.setBaseUrl('https://newsapi.org/v2');

    try {
      final newsResponse = await httpHelper.getRequest(
          "everything?q=sampah&language=id&page=$page&pageSize=$pageSize&apiKey=${dotenv.env['NEWS_API_KEY']}");

      if (newsResponse.statusCode == 200 &&
          newsResponse.body['articles'] != null) {
        List<NewsModel> fetchedNews = (newsResponse.body['articles'] as List)
            .map((data) => NewsModel.fromJson(data))
            .toList();

        if (fetchedNews.length < pageSize) {
          hasMore.value = false;
        } else {
          hasMore.value = true;
        }

        newsList.addAll(fetchedNews);
        page++;
      } else {
        REYLoaders.errorSnackBar(
          title: "Gagal memuat berita",
          message: "Error ${newsResponse.statusCode}: ${newsResponse.body}",
        );
      }
    } catch (e) {
      REYLoaders.errorSnackBar(
        title: "Gagal memuat berita",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
      REYHttpHelper.setBaseUrl('https://api.sobatsampah.id/api');
    }
  }

  void initializeWebViewController(String url) async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
    isWebViewLoading(false);
  }
}
