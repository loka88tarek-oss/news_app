import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/models/article_response_model/article.dart';

import 'package:news_app/screens/network/network_services.dart';
import 'package:news_app/screens/widgets/custome_error_widget.dart';
import 'package:news_app/screens/widgets/news_card_widget.dart';

class ArticleBody extends StatefulWidget {
  final String sourceId;
  const ArticleBody({super.key, required this.sourceId});

  @override
  State<ArticleBody> createState() => _ArticleBodyState();
}

class _ArticleBodyState extends State<ArticleBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkServices.getArticle(widget.sourceId),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: context.theme.colorScheme.secondary,
            ),
          );
        }

        (ErrorModel?, List<Article>?) response = asyncSnapshot.data!;
        if (response.$1 != null) {
          return CustomeErrorWidget(
            errorMessage: response.$1!.message,
            onRefresh: () {
              setState(() {});
            },
          );
        }

        List<Article>? article = response.$2 ?? [];
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
