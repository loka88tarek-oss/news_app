import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/app_consts.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/models/article_response_model/article.dart';
import 'package:news_app/models/article_response_model/article_response_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/network/endpoints.dart';

class NetworkServices {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConsts.baseUrl,
      queryParameters: {"apiKey": AppConsts.apiKey},
    ),
  );
  static Future<(ErrorModel?, List<Sources>?)> getSource(
    String category,
  ) async {
    try {
      Response response = await dio.get(
        Endpoints.sourceEndPoint,
        queryParameters: {"category": category},
      );
      log(
        "Api------->${AppConsts.baseUrl}  +  ${Endpoints.sourceEndPoint}\n-----Method:GET-----\nQueryParameters:{category:$category, apiKey:${AppConsts.apiKey}}\n",
      );
      if (response.data != null &&
          response.statusCode == 200 &&
          response.data['status'].toString().toLowerCase() == 'ok') {
        log("Suceess");
        SourceModel sourceModel = SourceModel.fromJson(response.data);
        return (null, sourceModel.sources);
      } else {
        return (RequestError(errorMessage: response.data?['message']), null);
      }
    } on Exception catch (e) {
      ErrorModel errorModel = ErrorModel.errorHandler(e);

      return (errorModel, null);
    }
  }

  static Future<(ErrorModel?, List<Article>?)> getArticle(
    String sourceId,
  ) async {
    try {
      Response response = await dio.get(
        Endpoints.articleEndPoint,
        queryParameters: {"sources": sourceId},
      );
      log(
        "Api------->${AppConsts.baseUrl}  +  ${Endpoints.articleEndPoint}\n-----Method:GET-----\nQueryParameters:{sources:$sourceId, apiKey:${AppConsts.apiKey}}\n",
      );
      if (response.data != null &&
          response.statusCode == 200 &&
          response.data['status'].toString().toLowerCase() == 'ok') {
        ArticleResponseModel articleResponseModel =
            ArticleResponseModel.fromJson(response.data);
        return (null, articleResponseModel.articles);
      } else {
        return (RequestError(errorMessage: response.data?['message']), null);
      }
    } on Exception catch (e) {
      ErrorModel errorModel = ErrorModel.errorHandler(e);

      return (errorModel, null);
    }
  }
}
