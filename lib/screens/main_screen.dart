import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:news_app/screens/views/home_view.dart';
import 'package:news_app/screens/views/news_details_view.dart';
import 'package:news_app/screens/widgets/category_card_widget.dart';
import 'package:news_app/screens/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (BuildContext context, provider, _) {
          return Scaffold(
            drawer: DrawerWidget(),
            appBar: AppBar(
              title: Text("Home"), //TODO LOCALIZATION
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
              ],
            ),
            body: provider.categoryEnum == null
                ? HomeView()
                : NewsDetailsView(),
          );
        },
      ),
    );
  }
}
