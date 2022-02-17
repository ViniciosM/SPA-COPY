import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/dialog_alert.dart';
import 'package:spa/components/search_widget.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/supervisor.dart';
import 'package:spa/pages/forms/supervisor_form.dart';
import 'package:spa/stores/supervisor_store.dart';

class TableSupervisor extends StatelessWidget {
  const TableSupervisor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SupervisorStore _supervisorStore = GetIt.I<SupervisorStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_supervisorStore.error != null) {
        return Padding(
          padding: const EdgeInsets.all(defaultPadding),
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
      } else if (_supervisorStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_supervisorStore.supervisorList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum supervisor encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _supervisorStore.setSearch('');
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
                  Observer(builder: (_) {
                    return SizedBox(
                      width: width * 0.4,
                      child: SearchWidget(searchFor: 'supervisores'),
                    );
                  }),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: height * 0.05,
                      child: DropdownButton<String>(
                        isExpanded: false,
                        hint: Text(_supervisorStore.orderBy),
                        items: orderBy.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (o) {
                          _supervisorStore.setOrderBy(o!);
                        },
                      ),
                    );
                  }),
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
                        "CRP",
                        style: themeData.textTheme.subtitle1,
                      ),
                    ),
                    DataColumn(
                      label: Text("Supervisor",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label:
                          Text("Email", style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("Telefone",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("", style: themeData.textTheme.subtitle1),
                    ),
                  ],
                  rows: List.generate(
                    _supervisorStore.supervisorList.length,
                    (index) => schedulingDataRow(
                        _supervisorStore.supervisorList[index], context),
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

DataRow schedulingDataRow(Supervisor supervisor, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  var textStyle = themeData.textTheme.bodyText2;
  double height = MediaQuery.of(context).size.height;
  SupervisorStore _supervisorStore = GetIt.I<SupervisorStore>();
  return DataRow(
    cells: [
      DataCell(Text(
        supervisor.crpSupervisor!,
        style: textStyle,
      )),
      DataCell(Text(
        supervisor.name!,
        style: textStyle,
      )),
      DataCell(Text(supervisor.email!, style: textStyle)),
      DataCell(Text(supervisor.phone!, style: textStyle)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Informações do Supervisor",
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
                              height: height * 0.20,
                              child: Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nome:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "CRP:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Email:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Telefone:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                      ]),
                                  SizedBox(width: 16),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(supervisor.name!,
                                            style:
                                                themeData.textTheme.bodyText2),
                                        SizedBox(height: 16),
                                        Text(
                                          supervisor.crpSupervisor!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          supervisor.email!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          supervisor.phone!,
                                          style: themeData.textTheme.bodyText2,
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
                        _supervisorStore.setSupervisor(supervisor);
                        return AlertDialog(
                          content: SupervisorForm(
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
                  context,
                  'supervisor',
                  supervisor.idSupervisor!,
                );
              },
              icon: Icon(Icons.delete_outline,
                  color: themeData.colorScheme.error)),
        ],
      )),
    ],
  );
}
