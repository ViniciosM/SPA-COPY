import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/dialog_alert.dart';
import 'package:spa/components/search_widget.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/pages/forms/scheduling_form.dart';
import 'package:spa/stores/scheduling_store.dart';
import 'package:spa/stores/supervisor_store.dart';

class TableScheduling extends StatelessWidget {
  const TableScheduling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_schedulingStore.error != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.error,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ocorreu um erro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      } else if (_schedulingStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_schedulingStore.schedulingList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum atendimento encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _schedulingStore.setSearch('');
                  _schedulingStore.setOrderBy('Todos os atendimentos');
                },
                icon: Icon(Icons.refresh_rounded)),
          ],
        );
      }
      return SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: themeData.colorScheme.onBackground,
              borderRadius:
                  const BorderRadius.all(Radius.circular(defaultRadius)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: SearchWidget(searchFor: 'paciente nos atendimentos'),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    child: Observer(builder: (_) {
                      return DropdownButton<String>(
                        isExpanded: false,
                        hint: Text(_schedulingStore.orderBy),
                        items: schedulingOrderBy.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (o) {
                          _schedulingStore.setOrderBy(o!);
                        },
                      );
                    }),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                child: DataTable(
                  headingTextStyle: themeData.textTheme.subtitle1,
                  dataTextStyle: themeData.textTheme.bodyText2,
                  horizontalMargin: 0,
                  columnSpacing: defaultPadding,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Data e horário",
                        style: themeData.textTheme.subtitle1,
                      ),
                    ),
                    DataColumn(
                      label: Text("Paciente",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("Estagiário",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("Comparecimento",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("Prontuário:",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("", style: themeData.textTheme.subtitle1),
                    ),
                  ],
                  rows: List.generate(
                    _schedulingStore.schedulingList.length,
                    (index) => schedulingDataRow(
                        _schedulingStore.schedulingList[index], context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}

DataRow schedulingDataRow(Scheduling scheduling, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  ThemeData themeData = Theme.of(context);
  SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
  var textStyle = themeData.textTheme.bodyText2;
  String formattedScreeningDate =
      '${scheduling.screeningDate!.day}/${scheduling.screeningDate!.month}/${scheduling.screeningDate!.year}';
  return DataRow(
    cells: [
      DataCell(Text(
        '$formattedScreeningDate às ${scheduling.screeningHour}',
        style: textStyle,
      )),
      DataCell(Text(scheduling.patient!, style: textStyle)),
      DataCell(Text(
        scheduling.trainee!,
        style: textStyle,
      )),

      if (scheduling.attendance == true)
        DataCell(Text("Compareceu", style: textStyle)),
      if (scheduling.attendance == false)
        DataCell(Text("Não compareceu", style: textStyle)),
      if (scheduling.openMedicalRecord == true)
        DataCell(Text("Aberto", style: textStyle)),
      if (scheduling.openMedicalRecord == false)
        DataCell(Text("Não aberto", style: textStyle)),

      // DataCell(

      //   Text('${scheduling.attendance}', style: textStyle)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                String dateFormatted =
                    '${scheduling.screeningDate!.day}/${scheduling.screeningDate!.month}/${scheduling.screeningDate!.year}';
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Informações do atendimento",
                                  style: themeData.textTheme.bodyText1),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                              height: height * 0.25,
                              child: Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Data e horário:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Estagiário:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Paciente:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Supervisor:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Comparecimento:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Prontuário:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                      ]),
                                  SizedBox(width: 16),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "$dateFormatted às ${scheduling.screeningHour}",
                                            style:
                                                themeData.textTheme.bodyText2),
                                        SizedBox(height: 16),
                                        Text(
                                          scheduling.trainee!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          scheduling.patient!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          scheduling.supervisor!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        if (scheduling.attendance == true)
                                          Text(
                                            "Compareceu",
                                            style:
                                                themeData.textTheme.bodyText2,
                                          ),
                                        if (scheduling.attendance == false)
                                          Text(
                                            "Não compareceu",
                                            style:
                                                themeData.textTheme.bodyText2,
                                          ),
                                        SizedBox(height: 16),
                                        if (scheduling.openMedicalRecord ==
                                            true)
                                          Text(
                                            "Aberto",
                                            style:
                                                themeData.textTheme.bodyText2,
                                          ),
                                        if (scheduling.openMedicalRecord ==
                                            false)
                                          Text(
                                            "Não aberto",
                                            style:
                                                themeData.textTheme.bodyText2,
                                          ),
                                      ])
                                ],
                              )),
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.info_outline,
                color: themeData.colorScheme.primary,
              )),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Observer(builder: (_) {
                        _schedulingStore.setScheduling(scheduling);

                        return AlertDialog(
                          content: SchedulingForm(
                            update: true,
                          ),
                        );
                      });
                    });
              },
              icon: Icon(
                Icons.edit_outlined,
                color: themeData.colorScheme.primaryVariant,
              )),
          IconButton(
              onPressed: () {
                showAlertDialog(
                    context, 'atendimento', scheduling.idScheduling!);
              },
              icon: Icon(Icons.delete_outline,
                  color: themeData.colorScheme.error)),
        ],
      )),
    ],
  );
}
