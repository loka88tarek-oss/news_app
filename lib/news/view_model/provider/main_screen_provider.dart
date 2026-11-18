import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/news/model/data_models/article_response_model/article.dart';

import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/network/network_service.dart';


class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading = false;
  String? sourceErrorMEssage;

    List<Article>? article;
  bool isArticleLoading = false;
  String? articleErrorMEssage;
  void changeCategory(CategoryEnum? category) {
    categoryEnum = category;
    notifyListeners();
  }

  Future<void> getSources() async {
    isSourcesLoading = true;
    notifyListeners();
    if (categoryEnum != null) {
      (ErrorModel?, List<Sources>?) response = await NetworkServices.getSource(
        categoryEnum!.name,
      );
      if (response.$1!=null) {
          sourceErrorMEssage=response.$1!.message;
      }else if(response.$2!=null) {
        log("-------->${response.$2!.length}");
        sources = response.$2;
      }
      notifyListeners();
    }
    isSourcesLoading = false;
    notifyListeners();
  }

    Future<void> getArticle(String sourceId) async {
    isArticleLoading = true;
    notifyListeners();
    if (categoryEnum != null) {
      (ErrorModel?, List<Article>?) response = await NetworkServices.getArticle(
        sourceId,

      );
      if (response.$1!=null) {
          articleErrorMEssage=response.$1!.message;
      }else if(response.$2!=null) {
        log("-------->${response.$2!.length}");
        article = response.$2;
      }
      notifyListeners();
    }
    isArticleLoading = false;
    notifyListeners();
  }
}
