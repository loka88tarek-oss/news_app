import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/network/network_services.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading=false;
  void changeCategory(CategoryEnum? category){
    categoryEnum=category;
    notifyListeners();
  }
 getSources()async{
  isSourcesLoading=true;
  notifyListeners();
  if (categoryEnum!=null) {
     List<Sources>? response= await NetworkServices.getSource(categoryEnum!.name);
     sources=response;
     notifyListeners();
  }
  isSourcesLoading=false;
  notifyListeners();
 }
}