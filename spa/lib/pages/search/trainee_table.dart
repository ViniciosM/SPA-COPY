import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/dialog_alert.dart';
import 'package:spa/components/search_widget.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/trainee.dart';
import 'package:spa/pages/forms/coordinator_form.dart';
import 'package:spa/pages/forms/trainee_form.dart';
import 'package:spa/responsive.dart';
import 'package:spa/stores/trainee_store.dart';

class TableTrainee extends StatelessWidget {
  const TableTrainee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_traineeStore.error != null) {
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
      } else if (_traineeStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_traineeStore.traineeList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum estagiário encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _traineeStore.setSearch('');
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
                    child: SearchWidget(searchFor: 'estagiários'),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: height * 0.05,
                      //width: width * 0.2,
                      child: DropdownButton<String>(
                        alignment: Alignment.center,
                        isExpanded: false,
                        hint: Text(_traineeStore.orderBy),
                        items: orderBy.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (o) {
                          _traineeStore.setOrderBy(o!);
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
                width: width,
                child: DataTable(
                  headingTextStyle: themeData.textTheme.subtitle1,
                  dataTextStyle: themeData.textTheme.bodyText2,
                  horizontalMargin: 0,
                  columnSpacing: defaultPadding,
                  columns: [
                    DataColumn(
                      label: Text("Matrícula",
                          style: themeData.textTheme.subtitle1),
                    ),
                    if (!Responsive.isMobile(context))
                      DataColumn(
                        label:
                            Text("Nome", style: themeData.textTheme.subtitle1),
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
                    _traineeStore.traineeList.length,
                    (index) => traineeDataRow(
                        _traineeStore.traineeList[index], context),
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

DataRow traineeDataRow(Trainee trainee, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  TraineeStore _traineeStore = GetIt.I<TraineeStore>();
  var textStyle = themeData.textTheme.bodyText2;
  double height = MediaQuery.of(context).size.height;
  return DataRow(
    cells: [
      DataCell(Text(
        trainee.registration!,
        style: textStyle,
      )),
      if (!Responsive.isMobile(context))
        DataCell(Text(
          trainee.name!,
          style: textStyle,
        )),
      DataCell(Text(trainee.email!, style: textStyle)),
      DataCell(Text(trainee.phone!, style: textStyle)),
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
                              Text("Informações do Estagiário",
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
                              height: height * 0.33,
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
                                          "Matrícula:",
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
                                        SizedBox(height: 16),
                                        Text(
                                          "Semestre:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Supervisor:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Coordenador:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Atende:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Área de estágio:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                      ]),
                                  SizedBox(width: 16),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(trainee.name!,
                                            style:
                                                themeData.textTheme.bodyText2),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.registration!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.email!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.phone!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.semester!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.supervisor!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.coordinator!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.role!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          trainee.traineeArea!,
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
                        _traineeStore.setTrainee(trainee);
                        return const AlertDialog(
                          content: TraineeForm(
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
                showAlertDialog(context, 'estagiário', trainee.idTrainee!);
              },
              icon: Icon(Icons.delete_outline,
                  color: themeData.colorScheme.error)),
        ],
      )),
    ],
  );
}
