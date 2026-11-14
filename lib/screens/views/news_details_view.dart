import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/network/network_services.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
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
              return Center(child: CircularProgressIndicator());
            }
            if ((provider.sources ?? []).isNotEmpty) {
              return DefaultTabController(
                length: provider.sources!.length,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                            (index) => _buildTabView([]),
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
