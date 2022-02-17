import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spa/pages/forms/coordinator_form.dart';
import 'package:spa/pages/forms/patient_form.dart';
import 'package:spa/pages/forms/scheduling_form.dart';
import 'package:spa/pages/forms/supervisor_form.dart';
import 'package:spa/pages/forms/trainee_form.dart';

class TabsForms extends StatefulWidget {
  const TabsForms({Key? key}) : super(key: key);

  @override
  _TabsFormsState createState() => _TabsFormsState();
}

class _TabsFormsState extends State<TabsForms> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(MdiIcons.chevronLeft),
        ),
        title: Text("Novo Cadastro", style: themeData.textTheme.headline6),
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      "Agendamento",
                      style: themeData.textTheme.subtitle1,
                    )),
                    Tab(
                        child: Text(
                      "Paciente",
                      style: themeData.textTheme.subtitle1,
                    )),
                    Tab(
                        child: Text(
                      "Estagiário",
                      style: themeData.textTheme.subtitle1,
                    )),
                    Tab(
                        child: Text(
                      "Coordenador",
                      style: themeData.textTheme.subtitle1,
                    )),
                    Tab(
                        child: Text(
                      "Supervisor",
                      style: themeData.textTheme.subtitle1,
                    )),
                  ],
                )
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(
            children: [
              SchedulingForm(),
              PatientForm(),
              TraineeForm(),
              CoordinatorForm(),
              SupervisorForm(),
            ],
          ),
        ),
      ),
    );
  }

}
