import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/models/article_response_model/article.dart';

import 'package:news_app/screens/network/network_services.dart';
import 'package:news_app/screens/widgets/news_card_widget.dart';

class ArticleBody extends StatelessWidget {
  final String sourceId;
  const ArticleBody({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkServices.getArticle(sourceId),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: context.theme.colorScheme.secondary,));
        }

        if (asyncSnapshot.hasError) {
          return Center(
            child: Text(e.toString(), style: TextStyle(color: Colors.red)),
          );
        }
        List<Article>? article = asyncSnapshot.data ?? [];
        return ListView.separated(
          padding: EdgeInsets.all(5.r),
          itemBuilder: (context, index) =>
              NewsCardWidget(article: article[index]),

          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemCount: article.length,
        );
      },
    );
  }
}
