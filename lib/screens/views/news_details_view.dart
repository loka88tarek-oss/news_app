import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/enums/category_enum.dart';

import 'package:news_app/screens/network/network_services.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:news_app/screens/widgets/article_body.dart';
import 'package:news_app/screens/widgets/custome_error_widget.dart';
import 'package:news_app/screens/widgets/news_card_widget.dart';
import 'package:provider/provider.dart';

class NewsDetailsView extends StatefulWidget {
  const NewsDetailsView({super.key});

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainScreenProvider>(context, listen: false).getSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, MainScreenProvider provider, Widget? child) {
            if (provider.isSourcesLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.theme.colorScheme.secondary,
                ),
              );
            }
            if (provider.sourceErrorMEssage != null) {
              return Center(
                child: CustomeErrorWidget(
                  errorMessage: provider.sourceErrorMEssage!,
                  onRefresh: () {
                    Provider.of<MainScreenProvider>(
                      context,
                      listen: false,
                    ).getSources();
                  },
                ),
              );
            }
            if ((provider.sources ?? []).isNotEmpty) {
              return DefaultTabController(
                length: provider.sources!.length,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 15.h,
                    children: [
                      TabBar(
                        indicatorColor: context.theme.colorScheme.secondary,
                        unselectedLabelStyle: context.textTheme.labelSmall!
                            .copyWith(fontWeight: .bold),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerHeight: 0,
                        tabAlignment: .start,

                        labelStyle: context.textTheme.labelMedium!.copyWith(
                          fontWeight: .bold,
                        ),
                        tabs: provider.sources!
                            .map((e) => Tab(text: e.name ?? ''))
                            .toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: List.generate(
                            provider.sources!.length,
                            (index) => ArticleBody(
                              sourceId: provider.sources![index].id ?? '',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Text(
                "No data found!!!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: .w700,
                ),
              ),
            );
          },
    );
  }
}
