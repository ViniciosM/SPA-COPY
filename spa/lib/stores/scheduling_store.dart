import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/repositories/scheduling_repository.dart';

part 'scheduling_store.g.dart';

class SchedulingStore = _SchedulingStoreBase with _$SchedulingStore;

abstract class _SchedulingStoreBase with Store {
  _SchedulingStoreBase() {
    autorun((_) async {
      loading = true;

      if (scheduling != null) {
        String timeS = scheduling!.screeningHour!;

        //var screeningHourTransformed = TimeOfDay(hour: hour, minute: minute)
        TimeOfDay _timeFormatted = TimeOfDay(
            hour: int.parse(timeS.split(":")[0]),
            minute: int.parse(timeS.split(":")[1]));
        screeningHour = _timeFormatted;
        screeningDate = scheduling!.screeningDate!;
        patient = scheduling!.patient!;
        supervisor = scheduling!.supervisor!;
        trainee = scheduling!.trainee!;
      }

      try {
        var newSchedulingList =
            await SchedulingRepository().read(search, orderBy);
        updateSchedulingList(newSchedulingList);
        //var newSchedulingsToOpenMedicalRecord = await SchedulingRepository().readSchedulingsToOpen(search2, orderBy2);

        //updateSchedulingAttendedList(newSchedulingsToOpenMedicalRecord);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
    });
  }

  @observable
  StreamController<List<ParseObject>> streamController = StreamController();

  ObservableList<Scheduling> schedulingList = ObservableList<Scheduling>();

  ObservableList<Scheduling> schedulingsToOpenMedicalRecord =
      ObservableList<Scheduling>();

  @observable
  Scheduling? scheduling;

  @observable
  DateTime screeningDate = DateTime.now();

  @observable
  TimeOfDay screeningHour = TimeOfDay.now();

  @observable
  String supervisor = 'Selecione o supervisor';

  @observable
  String trainee = 'Selecione o estagiário';

  @observable
  String patient = 'Selecione o paciente';

  @observable
  String defaultValueSupervisor = 'Selecione o supevisor';

  @observable
  String defaultValueTrainee = 'Selecione o estagiário';

  @observable
  String defaultValuePatient = 'Selecione o paciente';

  @observable
  bool? attendance;

  @observable
  List<Scheduling>? listScheduling;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  String search = '';

  @observable
  String search2 = '';

  @observable
  String orderBy = 'Ordenar por';

  @observable
  String orderBy2 = 'Ordenar por';

  @computed
  int get itemCount => schedulingList.length;

  @computed
  bool get showProgress => loading && schedulingList.isEmpty;

  @computed
  String get formattedDate =>
      '${screeningDate.day}/${screeningDate.month}/${screeningDate.year}';

  @computed
  String get formattedHour =>
      '${screeningHour.hour.toString().padLeft(2, '0')} : ${screeningHour.minute.toString().padLeft(2, '0')}';

  @action
  void updateSchedulingList(List<Scheduling> upScheduling) {
    if (schedulingList.isNotEmpty) {
      schedulingList.clear();
    }
    schedulingList.addAll(upScheduling);
  }

  @action
  Future<void> _update() async {
    loading = true;
    error = null;
    String formattedScreeningHour =
        '${screeningHour.hour}:${screeningHour.minute}';
    try {
      scheduling!.screeningDate = screeningDate;
      scheduling!.screeningHour = formattedScreeningHour;
      scheduling!.patient = patient;
      scheduling!.trainee = trainee;
      scheduling!.supervisor = supervisor;

      SchedulingRepository schedulingRepository = SchedulingRepository();
      await schedulingRepository.update(scheduling!);
      scheduling = null;
      clearFields();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  void updateSchedulingAttendedList(
      List<Scheduling> upSchedulingOpenMedicalRecord) {
    if (schedulingsToOpenMedicalRecord.isNotEmpty) {
      schedulingsToOpenMedicalRecord.clear();
    }
    schedulingsToOpenMedicalRecord.addAll(upSchedulingOpenMedicalRecord);
  }

  @action
  void setScheduling(Scheduling value) => scheduling = value;

  @action
  void setSearch2(String value) => search2 = value;

  @action
  void setOrderBy2(String value) => orderBy2 = value;

  @action
  void setSearch(String value) => search = value;

  @action
  void setOrderBy(String value) => orderBy = value;

  @action
  void setTrainee(String value) => trainee = value;

  @action
  void setSupervisor(String value) => supervisor = value;

  @action
  void setPatient(String value) => patient = value;

  @action
  void setAttendance(bool value) => attendance = value;

  @action
  void setScreeningHour(TimeOfDay value) => screeningHour = value;

  @action
  void setScreeningDate(DateTime value) => screeningDate = value;

  @action
  void setLoading() => loading = !loading;

  @computed
  bool get validSupervisor => supervisor != defaultValueSupervisor;
  String? get supervisorError =>
      supervisor != defaultValueSupervisor || validSupervisor
          ? null
          : 'Supervisor inválido';

  @computed
  bool get validTrainee => trainee != defaultValueTrainee;
  String? get traineeError => trainee != defaultValueTrainee || validTrainee
      ? null
      : 'Estagiário inválido';

  @computed
  bool get validPatient => patient != defaultValuePatient;
  String? get patientError => supervisor != defaultValuePatient || validPatient
      ? null
      : 'Paciente inválido';

  @computed
  bool get validScreeningDate => screeningDate.isAfter(DateTime.now());
  String? get screeningDateError =>
      screeningDate.isBefore(DateTime.now()) || validScreeningDate
          ? null
          : 'Data da triagem inválida';

  @computed
  bool get validForm => validSupervisor && validTrainee && validScreeningDate;

  @computed
  Function() get savePressed => validForm ? _create : _failedCreate;

  @computed
  Function() get updatePressed => _update;

  @action
  void addNewSchedulings(List<Scheduling> newSchedulings) {
    schedulingList.addAll(newSchedulings);
  }

  @action
  Future<void> getSchedulings() async {
    SchedulingRepository sr = SchedulingRepository();
    try {
      schedulingList.addAll(await sr.getSchedulings());
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  clearFields() {
    screeningDate = DateTime.now();
    screeningHour = TimeOfDay.now();
    supervisor = 'Selecione o supervisor';
    trainee = 'Selecione o estagiário';
    patient = 'Selecione o paciente';
    scheduling = null;
  }

  @action
  Future<void> _create() async {
    loading = true;
    error = null;

    String formattedScreeningHour =
        '${screeningHour.hour}:${screeningHour.minute}';

    try {
      if (validForm) {
        Scheduling s = Scheduling(
            screeningDate: screeningDate,
            screeningHour: formattedScreeningHour,
            supervisor: supervisor,
            trainee: trainee,
            patient: patient);
        await SchedulingRepository().create(s);
        schedulingList.add(s);
        clearFields();
        //showSaveMessage = true;
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _failedCreate() async {
    loading = true;
    loading = false;
    //showFailureMessage = true;
  }

  @action
  Future<void> delete(String id) async {
    loading = true;
    error = null;

    try {
      await SchedulingRepository().delete(id);
      schedulingList.removeWhere((element) => element.idScheduling == id);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> updateAttendance(String action, Scheduling scheduling) async {
    loading = true;
    SchedulingRepository sr = SchedulingRepository();
    Scheduling updatedScheduling;
    try {
      if (action == 'confirmar') {
        await sr.updateAttendance(scheduling, true);
      } else {
        await sr.updateAttendance(scheduling, false);
      }
      //schedulingList.add(updatedScheduling);
      search = '';
      orderBy = 'Todos os atendimentos';
    } catch (e) {
      Future.error(e);
    }
    loading = false;
  }
}
