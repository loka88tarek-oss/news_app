

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/news/model/data_models/article_response_model/article.dart';

import 'package:news_app/news/view/widgets/custome_error_widget.dart';
import 'package:news_app/news/view/widgets/news_card_widget.dart';
import 'package:news_app/news/view_model/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';


class ArticleBody extends StatefulWidget {
  final String sourceId;
  const ArticleBody({super.key, required this.sourceId});

  @override
  State<ArticleBody> createState() => _ArticleBodyState();
}

class _ArticleBodyState extends State<ArticleBody> {
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainScreenProvider>(context, listen: false).getArticle(widget.sourceId);
    });
  }
  @override
  Widget build(BuildContext context) {

  MainScreenProvider provider=        context.watch<MainScreenProvider>();
        if (provider.isArticleLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: context.theme.colorScheme.secondary,
            ),
          );
        }

        if (provider.articleErrorMEssage != null) {
          return CustomeErrorWidget(
            errorMessage: provider.articleErrorMEssage!,
            onRefresh: () {
              setState(() {});
            },
          );
        }

        List<Article>? article = provider.article?? [];
        return ListView.separated(
          padding: EdgeInsets.all(5.r),
          itemBuilder: (context, index) =>
              NewsCardWidget(article: article[index]),

          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemCount: article.length,
        );
      
  }

}
