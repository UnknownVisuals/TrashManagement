import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/features/news/screens/widgets/news_card.dart';
import 'package:trash_management/features/personalization/screens/profile/profile.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/features/news/controllers/news_controller.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    super.key,
    required this.userId,
    required this.username,
    required this.email,
    required this.desaId,
    required this.poin,
  });

  final String userId, username, email, desaId;
  final int poin;

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.put(NewsController());

    return Scaffold(
      appBar: REYAppBar(
        title: Text(
          'Berita',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(
              ProfileScreen(
                username: username,
                email: email,
                desaId: desaId,
              ),
            ),
            child: Image.asset(REYImages.user, width: 40, height: 40),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.newsList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: REYColors.primary),
          );
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                controller.hasMore.value) {
              controller.fetchNews();
            }
            return false;
          },
          child: ListView.builder(
            itemCount:
                controller.newsList.length + (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == controller.newsList.length) {
                return const Center(
                  child: CircularProgressIndicator(color: REYColors.primary),
                );
              }
              var item = controller.newsList[index];
              return NewsCard(
                imageUrl: item.urlToImage,
                title: item.title,
                source: item.sourceName,
                date: item.publishedAt,
                url: item.url,
              );
            },
          ),
        );
      }),
    );
  }
}
