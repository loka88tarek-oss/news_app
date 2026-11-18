import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/network/network_services.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading = false;
  String? sourceErrorMEssage;
  void changeCategory(CategoryEnum? category) {
    categoryEnum = category;
    notifyListeners();
  }

  getSources() async {
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
}
