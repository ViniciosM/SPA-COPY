import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/stores/page_store.dart';

import '../../../responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key, required this.pageStore}) : super(key: key);
  final PageStore pageStore;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData();
    return Drawer(
      child: ListView(
        //shrinkWrap: true,
        children: [
          DrawerHeader(
            child: Image.asset("assets/icons/spa_logo.png"),
          ),
          DrawerListTile(
            title: "Início",
            svgSrc: "assets/icons/home_32x.svg",
            press: () {
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? null
                  : Navigator.of(context).pop();
              //index = 1;
              pageStore.setIndex(0);
              pageStore.setCurrentIndex(0);
              pageStore.setPageName(0);
            },
          ),
          DrawerListTile(
            title: "Pesquisa",
            svgSrc: "assets/icons/search_32x.svg",
            press: () {
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? null
                  : Navigator.of(context).pop();
              //index = 1;
              pageStore.setIndex(1);
              pageStore.setCurrentIndex(1);
              pageStore.setPageName(1);

              //_pageStore.setCurrentPage(1);
            },
          ),
          DrawerListTile(
            title: "Cadastro",
            svgSrc: "assets/icons/create_32x.svg",
            press: () {
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? null
                  : Navigator.of(context).pop();
              //index = 2;
              pageStore.setIndex(2);
              pageStore.setCurrentIndex(2);
              pageStore.setPageName(2);
              //_pageStore.setCurrentPage(2);
            },
          ),
          DrawerListTile(
            title: "Prontuário",
            svgSrc: "assets/icons/medical_record_32x.svg",
            press: () {
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? null
                  : Navigator.of(context).pop();
              //index = 2;
              pageStore.setIndex(3);
              pageStore.setCurrentIndex(3);
              pageStore.setPageName(3);
              //_pageStore.setCurrentPage(2);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  ThemeData themeData = ThemeData();
  PageStore pageStore = GetIt.I<PageStore>();
  DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: pageStore.index == pageStore.currentIndex ?  Colors.transparent : themeData.primaryColor.withOpacity(0.1),
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        //color: themeData.primaryColor,
        height: 16,
      ),
      title: Text(title, style: themeData.textTheme.subtitle2),
    );
  }
}
