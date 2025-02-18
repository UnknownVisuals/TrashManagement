import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/news/controllers/news_controller.dart';

class NewsOpen extends StatelessWidget {
  const NewsOpen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.find();
    controller.initializeWebViewController(url);

    return Scaffold(
      appBar: const REYAppBar(title: Text('Berita'), showBackArrow: true),
      body: Obx(() {
        if (controller.isWebViewLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: REYColors.primary),
          );
        } else {
          return WebViewWidget(controller: controller.webViewController!);
        }
      }),
    );
  }
}
