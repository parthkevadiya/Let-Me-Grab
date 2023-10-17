import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letmegrab/api/service_locator.dart';
import 'package:letmegrab/api/services/home_service.dart';
import 'package:letmegrab/model/news_model.dart';

class HomeController extends GetxController {
  RxBool load = false.obs;
  final homeService = getIt.get<HomeService>();
  Rx<NewsModel> newsModel = NewsModel().obs;
  RxList<ArticleModel> articles = <ArticleModel>[].obs;
  RxList<ArticleModel> searchList = <ArticleModel>[].obs;
  TextEditingController search = TextEditingController();
  getNews() async {
    try {
      load.value = true;
      final resp = await homeService.getNews();
      if (resp != null) {
        newsModel.value = resp;
        articles.value = newsModel.value.articles ?? [];
        load.value = false;
      }
    } catch (e) {
      load.value = false;
    }
  }

  searchingByTitle() {
    searchList.clear();
    if (search.text.isEmpty) {
      articles.value = newsModel.value.articles ?? [];
    } else {
      if (articles.isNotEmpty) {
        for (var e in articles) {
          if (e.title!.toLowerCase().contains(search.text.toLowerCase())) {
            searchList.add(e);
          }
        }
      }
    }
  }
}
