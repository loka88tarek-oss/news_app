import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/app_consts.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/network/endpoints.dart';

class NetworkServices {
 static Future <List<Sources>?> getSource(String category)async{
    Dio dio=Dio(BaseOptions(baseUrl: AppConsts.baseUrl,queryParameters: {"apiKey":AppConsts.apiKey})) ;
    Response response=await dio.get(Endpoints.sourceEndPoint,queryParameters: 
    {
      "category":category
    }
    );
    if (response.data!=null&&response.statusCode==200&&response.data['status'].toString().toLowerCase()=='ok') {
         SourceModel sourceModel=SourceModel.fromJson(response.data);
         return sourceModel.sources;
    }

  }
  getArticle(){

  }
}