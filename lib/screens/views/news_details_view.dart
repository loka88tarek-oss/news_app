import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/widgets/news_card_widget.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 15.h,
          children: [
            TabBar(
              indicatorColor: context.theme.colorScheme.secondary,
              unselectedLabelStyle: context.textTheme.labelSmall!.copyWith(
                fontWeight: .bold,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,

              labelStyle: context.textTheme.labelMedium!.copyWith(
                fontWeight: .bold,
              ),
              tabs: [
                Tab(text: "XX1"),
                Tab(text: "XX2"),
                Tab(text: "XX3"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabView([]),
                  _buildTabView([
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                  ]),
                  _buildTabView([
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                    NewsModel(
                      id: "id",
                      authorizedAt: "authorizedAt",
                      authorizedBy: "authorizedBy",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTcB3pLJoaEYOcCrJzG3JtkHnMInt4MPXK6925lbVc0Q&s=10",
                      title: "title",
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTabView(List<NewsModel> list) {
    return ListView.separated(
      itemBuilder: (context, index) => NewsCardWidget(
        newsModel: NewsModel(
          id: list[index].id,
          authorizedAt: list[index].authorizedAt,
          authorizedBy: list[index].authorizedBy,
          image: list[index].image,
          title: list[index].title,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
      itemCount: list.length,
    );
  }
}
