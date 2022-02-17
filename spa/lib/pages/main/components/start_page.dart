import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/insight_box.dart';
import 'package:spa/constants/admin.dart';
import 'package:spa/pages/main/components/table_scheduling_desktop.dart';
import 'package:spa/pages/main/components/table_scheduling_mobile.dart';
import 'package:spa/pages/main/components/table_scheduling_tablet.dart';
import 'package:spa/responsive.dart';

import 'package:spa/stores/scheduling_store.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ScrollController scrollController = ScrollController();
    ThemeData themeData = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    return Column(
      children: [
        if (Responsive.isDesktop(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              InsightBox(title: 'Estagiários'),
              InsightBox(title: 'Pacientes'),
              InsightBox(title: 'Atendimentos'),
              InsightBox(title: 'Prontuários'),
            ],
          ),
        if (Responsive.isTablet(context))
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  InsightBoxTablet(title: 'Estagiários'),
                  InsightBoxTablet(title: 'Pacientes'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  InsightBoxTablet(title: 'Atendimentos'),
                  InsightBoxTablet(title: 'Prontuários'),
                ],
              ),
            ],
          ),
        if (Responsive.isMobile(context))
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              InsightBoxMobile(title: 'Estagiários'),
              InsightBoxMobile(title: 'Pacientes'),
              InsightBoxMobile(title: 'Atendimentos'),
              InsightBoxMobile(title: 'Prontuários'),
            ],
          ),
        SizedBox(
          height: height * 0.05,
        ),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: themeData.colorScheme.onBackground,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Atendimentos",
                style: Theme.of(context).textTheme.headline6,
              ),
              if (Responsive.isDesktop(context)) const TableSchedulingDesktop(),
              if (Responsive.isTablet(context)) const TableSchedulingTablet(),
              if (Responsive.isMobile(context)) const TableSchedulingMobile(),
            
            ],
          ),
        ),
      ],
    );
  }
}
