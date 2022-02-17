import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/dialog_alert.dart';
import 'package:spa/components/search_widget.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/coordinator.dart';
import 'package:spa/pages/forms/coordinator_form.dart';
import 'package:spa/stores/coordinator_store.dart';

class TableCoordinator extends StatelessWidget {
  const TableCoordinator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    CoordinatorStore _coordinatorStore = GetIt.I<CoordinatorStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_coordinatorStore.error != null) {
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
      } else if (_coordinatorStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_coordinatorStore.coordinatorList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum coordenador encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _coordinatorStore.setSearch('');
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
                      child: SearchWidget(searchFor: 'coordenadores'),
                    );
                  }),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: height * 0.05,
                      child: DropdownButton<String>(
                        isExpanded: false,
                        hint: Text(_coordinatorStore.orderBy),
                        items: orderBy.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (o) {
                          _coordinatorStore.setOrderBy(o!);
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
                      label: Text("Coordenador",
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
                    _coordinatorStore.coordinatorList.length,
                    (index) => coordinatorDataRow(
                        _coordinatorStore.coordinatorList[index], context),
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

DataRow coordinatorDataRow(Coordinator coordinator, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  CoordinatorStore _coordinatorStore = GetIt.I<CoordinatorStore>();
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var textStyle = themeData.textTheme.bodyText2;
  return DataRow(
    cells: [
      DataCell(Text(
        coordinator.crpCoordinator!,
        style: textStyle,
      )),
      DataCell(Text(
        coordinator.name!,
        style: textStyle,
      )),
      DataCell(Text(coordinator.email!, style: textStyle)),
      DataCell(Text(coordinator.phone!, style: textStyle)),
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
                              Text("Informações do Coordenador",
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
                                        Text(coordinator.name!,
                                            style:
                                                themeData.textTheme.bodyText2),
                                        SizedBox(height: 16),
                                        Text(
                                          coordinator.crpCoordinator!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          coordinator.email!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          coordinator.phone!,
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
                        _coordinatorStore.setCoordinator(coordinator);

                        return AlertDialog(
                          content: CoordinatorForm(
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
                    context, 'coordenador', coordinator.idCoordinator!);
              },
              icon: Icon(Icons.delete_outline,
                  color: themeData.colorScheme.error)),
        ],
      )),
    ],
  );
}
