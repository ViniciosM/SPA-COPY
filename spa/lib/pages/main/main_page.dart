import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/admin.dart';
import 'package:spa/pages/create/create.dart';
import 'package:spa/pages/forms/tabs_forms.dart';
import 'package:spa/pages/main/components/start_page.dart';
import 'package:spa/pages/medical_record/medical_record.dart';
import 'package:spa/pages/search/search.dart';

import 'package:spa/stores/page_store.dart';
import 'package:spa/stores/user_manager_store.dart';

import 'components/header.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.pageStore}) : super(key: key);
  final PageStore pageStore;

  @override
  Widget build(BuildContext context) {
    UserManagerStore _userManagerStore = GetIt.I<UserManagerStore>();
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Observer(builder: (_) {
                    return Column(
                      children: [
                        Observer(builder: (_) {
                          if (pageStore.index == 0) {
                            return StartPage();
                          }
                          if (pageStore.index == 1) {
                            return SearchPage();
                          } else if (pageStore.index == 2) {
                            return CreatePage();
                          } else if (pageStore.index == 3) {
                            return MedicalRecordPage();
                          }
                          return Container();
                        }),
                        /*
                          const SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context))
                            const SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context)) const Calendar(),
                          */
                      ],
                    );
                  }),
                ),
                /*
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  Observer(
                    builder: (_) {
                      if (pageStore.index == 0) {
                        return const Expanded(
                          flex: 2,
                          child: Calendar(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  */
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<Widget> goToCreateForms(BuildContext context) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TabsForms()));
  }
}
