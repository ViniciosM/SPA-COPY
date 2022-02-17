import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/stores/medical_record_store.dart';
import 'package:spa/stores/patient_store.dart';
import 'package:spa/stores/scheduling_store.dart';
import 'package:spa/stores/trainee_store.dart';

class InsightBox extends StatelessWidget {
  const InsightBox({Key? key, this.title, this.size}) : super(key: key);
  final String? title;
  final String? size;
  @override
  Widget build(
    BuildContext context,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PatientStore _patientStore = GetIt.I<PatientStore>();
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
    ThemeData themeData = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Container(
            height: height * 0.15,
            width: width * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(defaultPadding), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 4, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Observer(builder: (_) {
              if (title == 'Estagiários') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                    ),
                    Text(
                      '${_traineeStore.itemCount}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Pacientes') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline),
                    Text(
                      '${_patientStore.patientList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Atendimentos') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.calendarClockOutline),
                    Text(
                      '${_schedulingStore.schedulingList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Prontuários') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.calendarTextOutline),
                    Text(
                      '${_medicalRecordStore.medicalRecordList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.block_outlined),
                    Text(
                      '0',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '-----',
                      style: themeData.textTheme.subtitle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              }
            })));
  }
}

class InsightBoxTablet extends StatelessWidget {
  const InsightBoxTablet({Key? key, this.title}) : super(key: key);
  final String? title;
  
  @override
  Widget build(
    BuildContext context,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PatientStore _patientStore = GetIt.I<PatientStore>();
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
    ThemeData themeData = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Container(
            height: height * 0.15,
            width: width * 0.40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(defaultPadding), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 4, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Observer(builder: (_) {
              if (title == 'Estagiários') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                    ),
                    Text(
                      '${_traineeStore.itemCount}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Pacientes') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline),
                    Text(
                      '${_patientStore.patientList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Atendimentos') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.calendarClockOutline),
                    Text(
                      '${_schedulingStore.schedulingList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Prontuários') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.calendarTextOutline),
                    Text(
                      '${_medicalRecordStore.medicalRecordList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.block_outlined),
                    Text(
                      '0',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '-----',
                      style: themeData.textTheme.subtitle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              }
            })));
  }
}


class InsightBoxMobile extends StatelessWidget {
  const InsightBoxMobile({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(
    BuildContext context,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PatientStore _patientStore = GetIt.I<PatientStore>();
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
    ThemeData themeData = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Container(
            height: height * 0.15,
            width: width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(defaultPadding), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Observer(builder: (_) {
              if (title == 'Estagiários') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                    ),
                    Text(
                      '${_traineeStore.itemCount}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Pacientes') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline),
                    Text(
                      '${_patientStore.patientList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Atendimentos') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.calendarClockOutline),
                    Text(
                      '${_schedulingStore.schedulingList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else if (title == 'Prontuários') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.calendarTextOutline),
                    Text(
                      '${_medicalRecordStore.medicalRecordList.length}',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      title ?? '-----',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.block_outlined),
                    Text(
                      '0',
                      style: themeData.textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '-----',
                      style: themeData.textTheme.subtitle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                          thickness: 2, color: themeData.colorScheme.primary),
                    ),
                  ],
                );
              }
            })));
  }
}
