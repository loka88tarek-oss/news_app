import 'article.dart';

class ArticleResponseModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticleResponseModel({this.status, this.totalResults, this.articles});

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return ArticleResponseModel(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'articles': articles?.map((e) => e.toJson()).toList(),
  };
}
