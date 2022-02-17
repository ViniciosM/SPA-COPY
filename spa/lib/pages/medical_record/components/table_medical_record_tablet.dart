import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/dialog_alert.dart';
import 'package:spa/components/search_widget.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/medical_record.dart';
import 'package:spa/pages/forms/medical_record_form.dart';
import 'package:spa/stores/medical_record_store.dart';

class TableMedicalRecordTablet extends StatelessWidget {
  const TableMedicalRecordTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_medicalRecordStore.error != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: themeData.colorScheme.error,
                size: 100,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ocorreu um erro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeData.colorScheme.error,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      } else if (_medicalRecordStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_medicalRecordStore.medicalRecordList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum prontuário encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _medicalRecordStore.setSearch('');
                  _medicalRecordStore.setOrderBy('Todos os protuários');
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
                  const BorderRadius.all(Radius.circular(defaultRadius))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: SearchWidget(searchFor: 'paciente nos prontuários'),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    child: Observer(builder: (_) {
                      return DropdownButton<String>(
                        isExpanded: false,
                        hint: Text(_medicalRecordStore.orderBy),
                        items: medicalRecordOrderBy.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (o) {
                          _medicalRecordStore.setOrderBy(o!);
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
                      label:
                          Text("Triagem", style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text(
                        "Paciente",
                        style: themeData.textTheme.subtitle1,
                      ),
                    ),
                    DataColumn(
                      label: Text("Estagiário",
                          style: themeData.textTheme.subtitle1),
                    ),
                   
                    DataColumn(
                      label: Text("", style: themeData.textTheme.subtitle1),
                    ),
                  ],
                  rows: List.generate(
                    _medicalRecordStore.medicalRecordList.length,
                    (index) => medicalRecordDataRow(
                        _medicalRecordStore.medicalRecordList[index], context),
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

DataRow medicalRecordDataRow(
    MedicalRecord medicalRecord, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
  var textStyle = themeData.textTheme.bodyText2;
  double height = MediaQuery.of(context).size.height;
  String formattedScreeningDate =
      '${medicalRecord.screeningDate!.day}/${medicalRecord.screeningDate!.month}/${medicalRecord.screeningDate!.year}';
  String formattedStartDate =
      '${medicalRecord.startDate!.day}/${medicalRecord.startDate!.month}/${medicalRecord.startDate!.year}';
  String formattedEndDate =
      '${medicalRecord.endDate!.day}/${medicalRecord.endDate!.month}/${medicalRecord.endDate!.year}';
  return DataRow(
    cells: [
      DataCell(Text('$formattedScreeningDate - ${medicalRecord.screeningHour}',
          style: textStyle)),
      DataCell(Text(
        medicalRecord.patient!,
        style: textStyle,
      )),
      DataCell(Text(
        medicalRecord.trainee!,
        style: textStyle,
      )),
    
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
                              Text("Informações do Prontuário",
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
                              height: height * 0.45,
                              child: Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Paciente:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Estagiário:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Supervisor:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Data e hora triagem:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Status",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Demanda:",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Estagiário(Início):",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Supervisor(Início):",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Data e hora(Início)",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Estagiário(Término):",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Supervisor(Término):",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Data e hora(Término):",
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                      ]),
                                  SizedBox(width: 16),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(medicalRecord.patient!,
                                            style:
                                                themeData.textTheme.bodyText2),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.trainee!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.supervisor!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '$formattedScreeningDate - ${medicalRecord.screeningHour}',
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.status!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.demand!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.traineeStart!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.supervisorStart!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '$formattedStartDate - ${medicalRecord.startHour}',
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.traineeEnd!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          medicalRecord.supervisorEnd!,
                                          style: themeData.textTheme.bodyText2,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '$formattedEndDate - ${medicalRecord.endHour}',
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
                showAlertDialog(
                    context, 'prontuário', medicalRecord.idMedicalRecord!);
              },
              icon: Icon(Icons.delete_outline,
                  color: themeData.colorScheme.error)),
        ],
      )),
    ],
  );
}
