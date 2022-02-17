import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/responsive.dart';
import 'package:spa/stores/medical_record_store.dart';
import 'package:spa/stores/patient_store.dart';
import 'package:spa/stores/supervisor_store.dart';
import 'package:spa/stores/trainee_store.dart';

class MedicalRecordForm extends StatelessWidget {
  const MedicalRecordForm({Key? key, this.scheduling, this.update})
      : super(key: key);
  final Scheduling? scheduling;
  final bool? update;
  @override
  Widget build(BuildContext context) {
    MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
    PatientStore _patientStore = GetIt.I<PatientStore>();
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    SupervisorStore _supervisorStore = GetIt.I<SupervisorStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ThemeData themeData = ThemeData();
    DateTime selectDate = DateTime.now();
    TimeOfDay selectHours = TimeOfDay.now();

    _openDatePicker(BuildContext context, int verification) async {
      final DateTime? date = await showDatePicker(
          locale: const Locale('pt', 'BR'),
          context: context,
          initialDate: selectDate,
          firstDate: DateTime(2015),
          lastDate: DateTime(2030));

      if (date != null) {
        if (verification == 1) _medicalRecordStore.setScreeningDate(date);
        if (verification == 2) _medicalRecordStore.setDateStart(date);
        if (verification == 3) _medicalRecordStore.setDateEnd(date);
      }
    }

    _openHourPicker(BuildContext context, int verification) async {
      final TimeOfDay? hours =
          await showTimePicker(context: context, initialTime: selectHours);

      if (hours != null) {
        if (verification == 1) _medicalRecordStore.setScreeningHour(hours);
        if (verification == 2) _medicalRecordStore.setHourStart(hours);
        if (verification == 3) _medicalRecordStore.setHourEnd(hours);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Wrap(
        children: [
          SizedBox(
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.25,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      if (scheduling != null) {
                        _medicalRecordStore.setPatient(scheduling!.patient!);
                      }
                      return DropdownButton<String>(
                        isExpanded: false,
                        hint: scheduling != null
                            ? Text(scheduling!.patient!)
                            : Text(''),
                        items: emptyList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (p) {
                          _medicalRecordStore.setPatient(p!);
                        },
                      );
                    }),
                    SizedBox(height: height * 0.05),
                    Text(
                      'Data e horário da triagem',
                      style: themeData.textTheme.headline6,
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Observer(builder: (_) {
                          return SizedBox(
                            width: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width * 0.33
                                : MediaQuery.of(context).size.width * 0.09,
                            height: 35,
                            child: OutlinedButton(
                                onPressed: () =>
                                    _medicalRecordStore.loading == false
                                        ? _openDatePicker(context, 1)
                                        : null,
                                child: _medicalRecordStore.screeningDate ==
                                        DateTime.now()
                                    ? Text('Data')
                                    : Text(_medicalRecordStore
                                        .formattedScreeningDate)),
                          );
                        }),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Observer(builder: (_) {
                          return SizedBox(
                            width: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width * 0.33
                                : MediaQuery.of(context).size.width * 0.09,
                            height: 35,
                            child: OutlinedButton(
                              onPressed: () =>
                                  _medicalRecordStore.loading == false
                                      ? _openHourPicker(context, 1)
                                      : null,
                              child: _medicalRecordStore.screeningHour ==
                                      TimeOfDay.now()
                                  ? Text('Horário')
                                  : Text(_medicalRecordStore
                                      .formattedScreeningHour),
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    Observer(builder: (_) {
                      return DropdownButton<String>(
                        isExpanded: false,
                        hint: Text('${_medicalRecordStore.trainee}'),
                        items:
                            _traineeStore.listNameTrainee.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (t) {
                          _medicalRecordStore.setTrainee(t!);
                        },
                      );
                    }),
                    SizedBox(height: height * 0.05),
                    Observer(builder: (_) {
                      return DropdownButton<String>(
                        isExpanded: false,
                        hint: Text('${_medicalRecordStore.supervisor}'),
                        items: _supervisorStore.listNameSupervisor
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (s) {
                          _medicalRecordStore.setSupervisor(s!);
                        },
                      );
                    }),
                  ])),
          SizedBox(width: width * 0.01),
          SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.22,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: false,
                  hint: Text(_medicalRecordStore.demand!),
                  items: demand.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (d) {
                    _medicalRecordStore.setDemand(d!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Text(
                'Início do atendimento',
                style: themeData.textTheme.headline6,
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(builder: (_) {
                    return SizedBox(
                      width: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.width * 0.33
                          : MediaQuery.of(context).size.width * 0.09,
                      height: 35,
                      child: OutlinedButton(
                          onPressed: () => _medicalRecordStore.loading == false
                              ? _openDatePicker(context, 2)
                              : null,
                          child: _medicalRecordStore.dateStart == DateTime.now()
                              ? const Text('Data')
                              : Text(_medicalRecordStore.formattedStartDate)),
                    );
                  }),
                  SizedBox(width: width * 0.01),
                  Observer(builder: (_) {
                    return SizedBox(
                      width: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.width * 0.33
                          : MediaQuery.of(context).size.width * 0.09,
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () => _medicalRecordStore.loading == false
                            ? _openHourPicker(context, 2)
                            : null,
                        child: _medicalRecordStore.hourStart == TimeOfDay.now()
                            ? Text('Horário')
                            : Text(_medicalRecordStore.formattedStartHour),
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: false,
                  hint: Text('${_medicalRecordStore.traineeStart}'),
                  items: _traineeStore.listNameTrainee.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (t) {
                    _medicalRecordStore.setTraineeStart(t!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: false,
                  hint: Text('${_medicalRecordStore.supervisorStart}'),
                  items:
                      _supervisorStore.listNameSupervisor.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (s) {
                    _medicalRecordStore.setSupervisorStart(s!);
                  },
                );
              }),
            ]),
          ),
          SizedBox(height: height * 0.05),
          Container(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.22,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: false,
                  hint: Text(_medicalRecordStore.status!),
                  items: status.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (s) {
                    _medicalRecordStore.setStatus(s!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Text(
                'Término do atendimento',
                style: themeData.textTheme.headline6,
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(builder: (_) {
                    return SizedBox(
                      width: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.width * 0.33
                          : MediaQuery.of(context).size.width * 0.09,
                      height: 35,
                      child: OutlinedButton(
                          onPressed: () => _openDatePicker(context, 3),
                          child: Text(_medicalRecordStore.formattedEndDate)),
                    );
                  }),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      width: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.width * 0.33
                          : MediaQuery.of(context).size.width * 0.09,
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () => _medicalRecordStore.loading == false
                            ? _openHourPicker(context, 3)
                            : null,
                        child: _medicalRecordStore.hourEnd == TimeOfDay.now()
                            ? Text('Horário')
                            : Text(_medicalRecordStore.formattedEndHour),
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: false,
                  hint: Text('${_medicalRecordStore.traineeEnd}'),
                  items: _traineeStore.listNameTrainee.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (t) {
                    _medicalRecordStore.setTraineeEnd(t!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: false,
                  hint: Text('${_medicalRecordStore.supervisorEnd}'),
                  items:
                      _supervisorStore.listNameSupervisor.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (s) {
                    _medicalRecordStore.setSupervisorEnd(s!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(
                builder: (_) {
                  if (update == false || update == null) {
                    return TextButton(
                        onPressed: _medicalRecordStore.loading == false &&
                                _medicalRecordStore.validForm
                            ? _medicalRecordStore.savePressed
                            : null,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF029F8C),
                        ),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: _medicalRecordStore.loading == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : const Text(
                                  'Salvar',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ));
                  } else {
                    return TextButton(
                        onPressed: _medicalRecordStore.loading == false
                            ? _medicalRecordStore.updatePressed
                            : null,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF029F8C),
                        ),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: _medicalRecordStore.loading == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : const Text(
                                  'Atualizar',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ));
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
                      _medicalRecordStore.clearFields();
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF029F8C).withOpacity(0.8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      height: 50,
                      alignment: Alignment.center,
                      child: _patientStore.loading
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
            ]),
          ),
        ],
      ),
    );
  }
}
