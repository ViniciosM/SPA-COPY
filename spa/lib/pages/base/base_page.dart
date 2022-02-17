import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:spa/controllers/menu_controller.dart';
import 'package:spa/pages/main/main_page.dart';
import 'package:spa/responsive.dart';
import 'package:spa/stores/page_store.dart';
import 'components/side_menu.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData();
    final PageStore _pageStore = GetIt.I<PageStore>();
    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(
        pageStore: _pageStore,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(pageStore: _pageStore),
              ),
            Observer(builder: (_) {
              return Expanded(flex: 5, child: MainPage(pageStore: _pageStore));
            }),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text('Sistema SPA 1.0 - FPO\nby Vinicios Melo 2021', style: TextStyle(fontSize: 8, color: Colors.black45)),
        ],),
      )
        );
  }
}
