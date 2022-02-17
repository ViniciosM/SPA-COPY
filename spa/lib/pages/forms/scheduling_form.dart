import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/stores/patient_store.dart';
import 'package:spa/stores/scheduling_store.dart';
import 'package:spa/stores/supervisor_store.dart';
import 'package:spa/stores/trainee_store.dart';

class SchedulingForm extends StatelessWidget {
  const SchedulingForm({Key? key, this.update}) : super(key: key);
  final bool? update;
  @override
  Widget build(BuildContext context) {
    final SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    SupervisorStore _supervisorStore = GetIt.I<SupervisorStore>();
    PatientStore _patientStore = GetIt.I<PatientStore>();
    ThemeData themeData = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Data e horário da triagem',
                    style: themeData.textTheme.headline6,
                  ),
                  SizedBox(height: height * 0.05),
                  Observer(builder: (_) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: OutlinedButton(
                            onPressed: () => _openDatePicker(context),
                            child: Text(_schedulingStore.formattedDate)));
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () {
                          _openHourPicker(context);
                        },
                        child: _schedulingStore.screeningHour == TimeOfDay.now()
                            ? const Text('Horário')
                            : Text(_schedulingStore.formattedHour),
                      ),
                    );
                  }),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.9,
              height: MediaQuery.of(context).size.height / 1.8,
              padding: EdgeInsets.only(left: width * 0.05),
              child: Column(
                children: [
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(_schedulingStore.trainee),
                      items: _traineeStore.listNameTrainee.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (t) {
                        _schedulingStore.setTrainee(t!);
                      },
                    );
                  }),
                  SizedBox(height: height * 0.02),
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(_schedulingStore.patient),
                      items: _patientStore.listNamePatient.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (p) {
                        _schedulingStore.setPatient(p!);
                      },
                    );
                  }),
                  SizedBox(height: height * 0.02),
                  
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      //value: 'Supervisor',
                      hint: Text(_schedulingStore.supervisor),
                      items: _supervisorStore.listNameSupervisor
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (s) {
                        _schedulingStore.setSupervisor(s!);
                      },
                    );
                  }),
                  SizedBox(height: height * 0.1),
                  Observer(
                    builder: (_) {
                      if (update == false || update == null) {
                        return TextButton(
                          onPressed: _schedulingStore.validForm &&
                                  _schedulingStore.loading == false
                              ? _schedulingStore.savePressed
                              : null,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFF029F8C),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.height,
                            height: 50,
                            alignment: Alignment.center,
                            child: _schedulingStore.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Salvar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        );
                      } else {
                        return TextButton(
                          onPressed: _schedulingStore.validForm &&
                                  _schedulingStore.loading == false
                              ? _schedulingStore.updatePressed
                              : null,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFF029F8C),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.height,
                            height: 50,
                            alignment: Alignment.center,
                            child: _schedulingStore.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Atualizar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  if (update == true)
                    Observer(builder: (_) {
                      return TextButton(
                        onPressed: () {
                          _schedulingStore.clearFields();
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color(0xFF029F8C).withOpacity(0.8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.height,
                          height: 50,
                          alignment: Alignment.center,
                          child: _schedulingStore.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Fechar',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
ThemeData themeData = ThemeData();

DateTime selectDate = DateTime.now();

TimeOfDay selectHours = TimeOfDay.now();

_openDatePicker(BuildContext context) async {
  final DateTime? date = await showDatePicker(
      locale: const Locale('pt', 'BR'),
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030));

  if (date != null) {
    _schedulingStore.setScreeningDate(date);
  }
}

_openHourPicker(BuildContext context) async {
  final TimeOfDay? hours =
      await showTimePicker(context: context, initialTime: selectHours);

  if (hours != null) {
    _schedulingStore.setScreeningHour(hours);
  }
}
