import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:spa/constants/admin.dart';
import 'package:spa/controllers/menu_controller.dart';
import 'package:spa/responsive.dart';
import 'package:spa/stores/page_store.dart';
import 'package:spa/stores/user_manager_store.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    UserManagerStore _userManagerStore = GetIt.I<UserManagerStore>();
    return Observer(builder: (_) {
      if (!_userManagerStore.isLoggedIn) {
        return Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: context.read<MenuController>().controlMenu,
              ),
            if (!Responsive.isMobile(context))
              Observer(
                builder: (_) {
                  return Text(
                    _pageStore.pageName,
                    style: Theme.of(context).textTheme.headline6,
                  );
                },
              ),
            if (!Responsive.isMobile(context))
              Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            //const Expanded(child: SearchField()),
            const ProfileCard()
          ],
        );
      } else {
        return Container();
      }
    });
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          const Icon(Icons.tag_faces_outlined),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Observer(
                builder: (_) {
                  return Text('SPA', style: themeData.textTheme.bodyText1,);
                },
              ),
            ),
          const Icon(Icons.check),
        ],
      ),
    );
  }
}

PageStore _pageStore = GetIt.I<PageStore>();

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Pesquisar",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
