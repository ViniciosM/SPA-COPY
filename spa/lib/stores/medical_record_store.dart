import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:spa/models/medical_record.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/repositories/medical_record_repository.dart';
import 'package:spa/repositories/scheduling_repository.dart';
import 'package:spa/stores/scheduling_store.dart';

part 'medical_record_store.g.dart';

class MedicalRecordStore = _MedicalRecordStoreBase with _$MedicalRecordStore;

abstract class _MedicalRecordStoreBase with Store {
  _MedicalRecordStoreBase() {
    autorun((_) async {
      loading = true;
      try {
        if (medicalRecord != null) {
          String timeScreeningDate = medicalRecord!.screeningHour!;
          String timeStartDate = medicalRecord!.startHour!;
          String timeEndDate = medicalRecord!.endHour!;

          //var screeningHourTransformed = TimeOfDay(hour: hour, minute: minute)
          TimeOfDay _timeScreeningDateFormatted = TimeOfDay(
              hour: int.parse(timeScreeningDate.split(":")[0]),
              minute: int.parse(timeScreeningDate.split(":")[1]));

          TimeOfDay _timeStartDateFormatted = TimeOfDay(
              hour: int.parse(timeStartDate.split(":")[0]),
              minute: int.parse(timeStartDate.split(":")[1]));

          TimeOfDay _timeEndDateFormatted = TimeOfDay(
              hour: int.parse(timeEndDate.split(":")[0]),
              minute: int.parse(timeEndDate.split(":")[1]));

          patient = medicalRecord!.patient;
          status = medicalRecord!.status!;
          demand = medicalRecord!.demand!;

          trainee = medicalRecord!.trainee;
          traineeStart = medicalRecord!.traineeStart;
          traineeEnd = medicalRecord!.traineeEnd;

          supervisor = medicalRecord!.supervisor;
          supervisorStart = medicalRecord!.supervisorStart;
          supervisorEnd = medicalRecord!.supervisorEnd;

          screeningDate = medicalRecord!.screeningDate!;
          dateStart = medicalRecord!.startDate!;
          dateEnd = medicalRecord!.endDate!;

          screeningHour = _timeScreeningDateFormatted;
          hourStart = _timeStartDateFormatted;
          hourEnd = _timeEndDateFormatted;
        }

        var newMedicalRecordList =
            await MedicalRecordRepository().read(search, orderBy);
        var newMedicalRecordStartPageList =
            await MedicalRecordRepository().readStartPage(orderBy2);
        updateMedicalRecordList(newMedicalRecordList);
        updateMedicalRecordStartPageList(newMedicalRecordStartPageList);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
    });
  }

  @observable
  MedicalRecord? medicalRecord;

  @observable
  String? demand = 'Selecione a demanda';

  @observable
  String? status = 'Selecione o status';

  @observable
  String? patient = 'Selecione o paciente';

  @observable
  DateTime screeningDate = DateTime.now();

  @observable
  TimeOfDay screeningHour = TimeOfDay.now();

  @observable
  String? idScheduling;

  ObservableList<MedicalRecord> medicalRecordList =
      ObservableList<MedicalRecord>();

  ObservableList<MedicalRecord> medicalRecordStartPageList =
      ObservableList<MedicalRecord>();

  @observable
  String? trainee = 'Selecione o estagiário';

  @observable
  String? supervisor = 'Selecione o supervisor';

  @observable
  DateTime dateStart = DateTime.now();

  @observable
  TimeOfDay hourStart = TimeOfDay.now();

  @observable
  String? traineeStart = 'Estagiário - Início';

  @observable
  String? supervisorStart = 'Supervisor - Início';

  @observable
  String filter = 'Todos os prontuários';

  @observable
  DateTime dateEnd = DateTime.now();

  @observable
  TimeOfDay hourEnd = TimeOfDay.now();

  @observable
  String? traineeEnd = 'Estagiário - Término';

  @observable
  String? supervisorEnd = 'Supervisor - Término';

  @observable
  bool loading = false;

  @observable
  bool close = false;

  @observable
  bool showSaveMessage = false;

  @observable
  bool showFailureMessage = false;

  @observable
  String? error;

  @observable
  List<String> listNameCoordinator = ['A definir'];

  @observable
  String search = '';

  @observable
  String orderBy = 'Ordenar por';

  @observable
  String orderBy2 = 'Ordenar por';

  @action
  void updateMedicalRecordStartPageList(List<MedicalRecord> upMedicalRecord) {
    if (medicalRecordStartPageList.isNotEmpty) {
      medicalRecordStartPageList.clear();
    }
    medicalRecordStartPageList.addAll(upMedicalRecord);
  }

  @action
  void setOrderBy2(String value) => orderBy2 = value;

  @action
  void updateMedicalRecordList(List<MedicalRecord> upMedicalRecord) {
    if (medicalRecordList.isNotEmpty) {
      medicalRecordList.clear();
    }
    medicalRecordList.addAll(upMedicalRecord);
  }

  @action
  void setSearch(String value) => search = value;

  @action
  void setOrderBy(String value) => orderBy = value;

  @action
  void setIdScheduling(String value) => idScheduling = value;

  @action
  void setMedicalRecord(MedicalRecord value) => medicalRecord = value;

  @action
  void setFilter(String value) => filter = value;

  @action
  void setDemand(String value) => demand = value;

  @action
  void setStatus(String value) => status = value;

  @action
  void setPatient(String value) => patient = value;

  @action
  void setScreeningDate(DateTime value) => screeningDate = value;

  @action
  void setTrainee(String value) => trainee = value;

  @action
  void setSupervisor(String value) => supervisor = value;

  @action
  void setDateStart(DateTime value) => dateStart = value;

  @action
  void setTraineeStart(String value) => traineeStart = value;

  @action
  void setSupervisorStart(String value) => supervisorStart = value;

  @action
  void setDateEnd(DateTime value) => dateEnd = value;

  @action
  void setTraineeEnd(String value) => traineeEnd = value;

  @action
  void setSupervisorEnd(String value) => supervisorEnd = value;

  @action
  void setScreeningHour(TimeOfDay value) => screeningHour = value;

  @action
  void setHourEnd(TimeOfDay value) => hourEnd = value;

  @action
  void setHourStart(TimeOfDay value) => hourStart = value;

  @action
  void setLoading() => loading = !loading;

  @action
  void setShowSaveMessage(bool value) => showSaveMessage = value;

  @action
  void setShowFailureMessage(bool value) => showFailureMessage = value;

  @computed
  String get formattedScreeningDate =>
      '${screeningDate.day}/${screeningDate.month}/${screeningDate.year}';

  @computed
  String get formattedScreeningHour =>
      '${screeningHour.hour.toString().padLeft(2, '0')} : ${screeningHour.minute.toString().padLeft(2, '0')}';

  @computed
  String get formattedStartDate =>
      '${dateStart.day}/${dateStart.month}/${dateStart.year}';
  @computed
  String get formattedStartHour =>
      '${hourStart.hour.toString().padLeft(2, '0')} : ${hourStart.minute.toString().padLeft(2, '0')}';

  @computed
  String get formattedEndDate =>
      '${dateEnd.day}/${dateEnd.month}/${dateEnd.year}';
  @computed
  String get formattedEndHour =>
      '${hourEnd.hour.toString().padLeft(2, '0')} : ${hourEnd.minute.toString().padLeft(2, '0')}';

  @action
  clearFields() {
    demand = 'Selecione a demanda';
    status = 'Selecione o status';
    patient = 'Selecione o paciente';
    trainee = 'Selecione o estagiário';
    supervisor = 'Selecione o supervisor';
    traineeStart = 'Estagiário - Início';
    traineeEnd = 'Estagiário - Término';
    supervisorStart = 'Supervisor - Início';
    supervisorEnd = 'Supervisor - Término';
    screeningDate = DateTime.now();
    dateStart = DateTime.now();
    dateEnd = DateTime.now();
    screeningHour = TimeOfDay.now();
    hourStart = TimeOfDay.now();
    hourEnd = TimeOfDay.now();
    idScheduling = '';
    medicalRecord = null;
  }

  @computed
  int get itemCount => medicalRecordList.length;

  @computed
  int get itemCount2 => medicalRecordStartPageList.length;

  @computed
  bool get showProgress2 => loading && medicalRecordStartPageList.isEmpty;

  @computed
  bool get showProgress => loading && medicalRecordList.isEmpty;

  @computed
  bool get validPatient => patient != null;
  String? get patientError =>
      patient == null || validPatient ? null : 'Paciente inválido';

  @computed
  bool get validDemand => demand != null;
  String? get demandError =>
      demand == null || validDemand ? null : 'Demanda inválida';

  @computed
  bool get validScreeningHour => screeningHour != null;
  String? get screeningHourError =>
      screeningHour == null || validScreeningHour ? null : 'Hora inválida';

  @computed
  bool get validStatus => status != null && status != 'Selecione o status';
  String? get statusError =>
      status == null || validStatus ? null : 'Status inválido';

  @computed
  bool get validTrainee => trainee != null;
  String? get traineeError =>
      trainee == null || validTrainee ? null : 'Estagiário inválido';

  @computed
  bool get validTraineeEnd =>
      traineeEnd != null &&
      traineeEnd != 'Selecione o estagiário do fim da triagem';
  String? get traineeEndError =>
      traineeEnd == null || validTraineeEnd ? null : 'Estagiário inválido';

  @computed
  bool get validTraineeStart =>
      traineeStart != null &&
      traineeStart != 'Selecione o estagiário do início da triagem';
  String? get traineeStartError =>
      traineeStart == null || validTraineeStart ? null : 'Estagiário inválido';

  @computed
  bool get validSupervisorStart =>
      supervisorStart != null &&
      supervisorStart != 'Selecione o supervisor do início da triagem';
  String? get supervisorStartError =>
      supervisorStart == null || validSupervisorStart
          ? null
          : 'Supervisor inválido';

  @computed
  bool get validSupervisorEnd => supervisorEnd != null;
  String? get supervisorEndError => supervisorEnd == null || validSupervisorEnd
      ? null
      : 'Supervisor inválido';

  @computed
  bool get validSupervisor => supervisor != null;
  String? get supervisorError =>
      supervisor == null || validSupervisor ? null : 'Supervisor inválido';

  @computed
  bool get validDateStart =>
      dateStart != DateTime.now() && dateStart.isBefore(DateTime.now());
  String? get dateStartError =>
      validDateStart ? null : 'Data do ínicio da triagem inválida';

  @computed
  bool get validDateEnd =>
      dateEnd != DateTime.now() && dateEnd.isBefore(DateTime.now());
  String? get dateEndError =>
      validDateEnd ? null : 'Data do fim da triagem inválida';

  @computed
  bool get validScreeningDate => screeningDate != DateTime.now();
  String? get screeningDateError =>
      validScreeningDate ? null : 'Data da triagem inválida';

  @computed
  bool get validForm =>
      validStatus &&
      validDemand &&
      validPatient &&
      validTrainee &&
      validSupervisor;

  @computed
  Function() get savePressed => validForm ? _create : _failedCreate;

  @computed
  Function() get updatePressed => _update;

  @action
  Future<void> getAllMedicalRecord() async {
    loading = true;
    if (medicalRecordList.isNotEmpty) {
      medicalRecordList.clear();
    }

    try {
      List<MedicalRecord> listMedicalRecord =
          await MedicalRecordRepository().read(search, orderBy);

      for (MedicalRecord md in listMedicalRecord) {
        medicalRecordList.add(md);
      }
    } catch (e) {
      Future.error(e);
    }
    loading = false;
  }

  @action
  Future<void> _create() async {
    loading = true;
    error = null;
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    SchedulingRepository schedulingRepository = SchedulingRepository();

    String formattedScreeningHour =
        '${screeningHour.hour}:${screeningHour.minute}';
    String formattedStartHour = '${hourEnd.hour}:${hourEnd.minute}';
    String formattedEndHour = '${hourStart.hour}:${hourStart.minute}';

    try {
      schedulingRepository.updateOpenMedicalRecord(idScheduling!);
      MedicalRecord mr = MedicalRecord(
        status: status,
        demand: demand,
        patient: patient,
        screeningDate: screeningDate,
        screeningHour: formattedScreeningHour,
        trainee: trainee,
        traineeStart: traineeStart,
        startDate: dateStart,
        startHour: formattedStartHour,
        supervisor: supervisor,
        supervisorStart: supervisorStart,
        endDate: dateEnd,
        endHour: formattedEndHour,
        supervisorEnd: supervisorEnd,
        traineeEnd: traineeEnd,
        idScheduling: idScheduling,
      );
      await MedicalRecordRepository().create(mr);
      medicalRecordList.add(mr);
      _schedulingStore.setSearch('');
      _schedulingStore.setOrderBy('Todos os atendimentos');
      clearFields();
    } catch (e) {
      error = e.toString();
    }
    close = true;
    loading = false;
  }

  @action
  Future<void> _update() async {
    loading = true;
    error = null;

    String formattedScreeningHour =
        '${screeningHour.hour}:${screeningHour.minute}';
    String formattedStartHour = '${hourEnd.hour}:${hourEnd.minute}';
    String formattedEndHour = '${hourStart.hour}:${hourStart.minute}';

    try {
      medicalRecord!.patient = patient!;
      medicalRecord!.status = status!;
      medicalRecord!.demand = demand!;

      medicalRecord!.trainee = trainee;
      medicalRecord!.traineeStart = traineeStart;
      medicalRecord!.traineeEnd = traineeEnd;

      medicalRecord!.supervisor = supervisor;
      medicalRecord!.supervisorStart = supervisorStart;
      medicalRecord!.supervisorEnd = supervisorEnd;

      medicalRecord!.screeningDate = screeningDate;
      medicalRecord!.startDate = dateStart;
      medicalRecord!.endDate = dateEnd;

      medicalRecord!.screeningHour = formattedScreeningHour;
      medicalRecord!.startHour = formattedStartHour;
      medicalRecord!.endHour = formattedEndHour;

      MedicalRecordRepository medicalRecordRepository =
          MedicalRecordRepository();

      await medicalRecordRepository.update(medicalRecord!);
      medicalRecordList.add(medicalRecord!);
      clearFields();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _failedCreate() async {
    showFailureMessage = true;
  }

  @action
  Future<void> delete(String id) async {
    loading = true;
    error = null;

    try {
      await MedicalRecordRepository().delete(id);
      medicalRecordList.removeWhere((element) => element.idMedicalRecord == id);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
