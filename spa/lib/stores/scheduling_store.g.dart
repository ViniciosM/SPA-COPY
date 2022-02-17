// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchedulingStore on _SchedulingStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_SchedulingStoreBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_SchedulingStoreBase.showProgress'))
          .value;
  Computed<String>? _$formattedDateComputed;

  @override
  String get formattedDate =>
      (_$formattedDateComputed ??= Computed<String>(() => super.formattedDate,
              name: '_SchedulingStoreBase.formattedDate'))
          .value;
  Computed<String>? _$formattedHourComputed;

  @override
  String get formattedHour =>
      (_$formattedHourComputed ??= Computed<String>(() => super.formattedHour,
              name: '_SchedulingStoreBase.formattedHour'))
          .value;
  Computed<bool>? _$validSupervisorComputed;

  @override
  bool get validSupervisor =>
      (_$validSupervisorComputed ??= Computed<bool>(() => super.validSupervisor,
              name: '_SchedulingStoreBase.validSupervisor'))
          .value;
  Computed<bool>? _$validTraineeComputed;

  @override
  bool get validTrainee =>
      (_$validTraineeComputed ??= Computed<bool>(() => super.validTrainee,
              name: '_SchedulingStoreBase.validTrainee'))
          .value;
  Computed<bool>? _$validPatientComputed;

  @override
  bool get validPatient =>
      (_$validPatientComputed ??= Computed<bool>(() => super.validPatient,
              name: '_SchedulingStoreBase.validPatient'))
          .value;
  Computed<bool>? _$validScreeningDateComputed;

  @override
  bool get validScreeningDate => (_$validScreeningDateComputed ??=
          Computed<bool>(() => super.validScreeningDate,
              name: '_SchedulingStoreBase.validScreeningDate'))
      .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_SchedulingStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_SchedulingStoreBase.savePressed'))
      .value;
  Computed<dynamic Function()>? _$updatePressedComputed;

  @override
  dynamic Function() get updatePressed => (_$updatePressedComputed ??=
          Computed<dynamic Function()>(() => super.updatePressed,
              name: '_SchedulingStoreBase.updatePressed'))
      .value;

  final _$streamControllerAtom =
      Atom(name: '_SchedulingStoreBase.streamController');

  @override
  StreamController<List<ParseObject>> get streamController {
    _$streamControllerAtom.reportRead();
    return super.streamController;
  }

  @override
  set streamController(StreamController<List<ParseObject>> value) {
    _$streamControllerAtom.reportWrite(value, super.streamController, () {
      super.streamController = value;
    });
  }

  final _$schedulingAtom = Atom(name: '_SchedulingStoreBase.scheduling');

  @override
  Scheduling? get scheduling {
    _$schedulingAtom.reportRead();
    return super.scheduling;
  }

  @override
  set scheduling(Scheduling? value) {
    _$schedulingAtom.reportWrite(value, super.scheduling, () {
      super.scheduling = value;
    });
  }

  final _$screeningDateAtom = Atom(name: '_SchedulingStoreBase.screeningDate');

  @override
  DateTime get screeningDate {
    _$screeningDateAtom.reportRead();
    return super.screeningDate;
  }

  @override
  set screeningDate(DateTime value) {
    _$screeningDateAtom.reportWrite(value, super.screeningDate, () {
      super.screeningDate = value;
    });
  }

  final _$screeningHourAtom = Atom(name: '_SchedulingStoreBase.screeningHour');

  @override
  TimeOfDay get screeningHour {
    _$screeningHourAtom.reportRead();
    return super.screeningHour;
  }

  @override
  set screeningHour(TimeOfDay value) {
    _$screeningHourAtom.reportWrite(value, super.screeningHour, () {
      super.screeningHour = value;
    });
  }

  final _$supervisorAtom = Atom(name: '_SchedulingStoreBase.supervisor');

  @override
  String get supervisor {
    _$supervisorAtom.reportRead();
    return super.supervisor;
  }

  @override
  set supervisor(String value) {
    _$supervisorAtom.reportWrite(value, super.supervisor, () {
      super.supervisor = value;
    });
  }

  final _$traineeAtom = Atom(name: '_SchedulingStoreBase.trainee');

  @override
  String get trainee {
    _$traineeAtom.reportRead();
    return super.trainee;
  }

  @override
  set trainee(String value) {
    _$traineeAtom.reportWrite(value, super.trainee, () {
      super.trainee = value;
    });
  }

  final _$patientAtom = Atom(name: '_SchedulingStoreBase.patient');

  @override
  String get patient {
    _$patientAtom.reportRead();
    return super.patient;
  }

  @override
  set patient(String value) {
    _$patientAtom.reportWrite(value, super.patient, () {
      super.patient = value;
    });
  }

  final _$defaultValueSupervisorAtom =
      Atom(name: '_SchedulingStoreBase.defaultValueSupervisor');

  @override
  String get defaultValueSupervisor {
    _$defaultValueSupervisorAtom.reportRead();
    return super.defaultValueSupervisor;
  }

  @override
  set defaultValueSupervisor(String value) {
    _$defaultValueSupervisorAtom
        .reportWrite(value, super.defaultValueSupervisor, () {
      super.defaultValueSupervisor = value;
    });
  }

  final _$defaultValueTraineeAtom =
      Atom(name: '_SchedulingStoreBase.defaultValueTrainee');

  @override
  String get defaultValueTrainee {
    _$defaultValueTraineeAtom.reportRead();
    return super.defaultValueTrainee;
  }

  @override
  set defaultValueTrainee(String value) {
    _$defaultValueTraineeAtom.reportWrite(value, super.defaultValueTrainee, () {
      super.defaultValueTrainee = value;
    });
  }

  final _$defaultValuePatientAtom =
      Atom(name: '_SchedulingStoreBase.defaultValuePatient');

  @override
  String get defaultValuePatient {
    _$defaultValuePatientAtom.reportRead();
    return super.defaultValuePatient;
  }

  @override
  set defaultValuePatient(String value) {
    _$defaultValuePatientAtom.reportWrite(value, super.defaultValuePatient, () {
      super.defaultValuePatient = value;
    });
  }

  final _$attendanceAtom = Atom(name: '_SchedulingStoreBase.attendance');

  @override
  bool? get attendance {
    _$attendanceAtom.reportRead();
    return super.attendance;
  }

  @override
  set attendance(bool? value) {
    _$attendanceAtom.reportWrite(value, super.attendance, () {
      super.attendance = value;
    });
  }

  final _$listSchedulingAtom =
      Atom(name: '_SchedulingStoreBase.listScheduling');

  @override
  List<Scheduling>? get listScheduling {
    _$listSchedulingAtom.reportRead();
    return super.listScheduling;
  }

  @override
  set listScheduling(List<Scheduling>? value) {
    _$listSchedulingAtom.reportWrite(value, super.listScheduling, () {
      super.listScheduling = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SchedulingStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_SchedulingStoreBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$searchAtom = Atom(name: '_SchedulingStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$search2Atom = Atom(name: '_SchedulingStoreBase.search2');

  @override
  String get search2 {
    _$search2Atom.reportRead();
    return super.search2;
  }

  @override
  set search2(String value) {
    _$search2Atom.reportWrite(value, super.search2, () {
      super.search2 = value;
    });
  }

  final _$orderByAtom = Atom(name: '_SchedulingStoreBase.orderBy');

  @override
  String get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(String value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  final _$orderBy2Atom = Atom(name: '_SchedulingStoreBase.orderBy2');

  @override
  String get orderBy2 {
    _$orderBy2Atom.reportRead();
    return super.orderBy2;
  }

  @override
  set orderBy2(String value) {
    _$orderBy2Atom.reportWrite(value, super.orderBy2, () {
      super.orderBy2 = value;
    });
  }

  final _$_updateAsyncAction = AsyncAction('_SchedulingStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$getSchedulingsAsyncAction =
      AsyncAction('_SchedulingStoreBase.getSchedulings');

  @override
  Future<void> getSchedulings() {
    return _$getSchedulingsAsyncAction.run(() => super.getSchedulings());
  }

  final _$_createAsyncAction = AsyncAction('_SchedulingStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_failedCreateAsyncAction =
      AsyncAction('_SchedulingStoreBase._failedCreate');

  @override
  Future<void> _failedCreate() {
    return _$_failedCreateAsyncAction.run(() => super._failedCreate());
  }

  final _$deleteAsyncAction = AsyncAction('_SchedulingStoreBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$updateAttendanceAsyncAction =
      AsyncAction('_SchedulingStoreBase.updateAttendance');

  @override
  Future<void> updateAttendance(String action, Scheduling scheduling) {
    return _$updateAttendanceAsyncAction
        .run(() => super.updateAttendance(action, scheduling));
  }

  final _$_SchedulingStoreBaseActionController =
      ActionController(name: '_SchedulingStoreBase');

  @override
  void updateSchedulingList(List<Scheduling> upScheduling) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.updateSchedulingList');
    try {
      return super.updateSchedulingList(upScheduling);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSchedulingAttendedList(
      List<Scheduling> upSchedulingOpenMedicalRecord) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.updateSchedulingAttendedList');
    try {
      return super.updateSchedulingAttendedList(upSchedulingOpenMedicalRecord);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScheduling(Scheduling value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setScheduling');
    try {
      return super.setScheduling(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch2(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setSearch2');
    try {
      return super.setSearch2(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy2(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setOrderBy2');
    try {
      return super.setOrderBy2(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTrainee(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setTrainee');
    try {
      return super.setTrainee(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSupervisor(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setSupervisor');
    try {
      return super.setSupervisor(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPatient(String value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setPatient');
    try {
      return super.setPatient(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAttendance(bool value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setAttendance');
    try {
      return super.setAttendance(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreeningHour(TimeOfDay value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setScreeningHour');
    try {
      return super.setScreeningHour(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreeningDate(DateTime value) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setScreeningDate');
    try {
      return super.setScreeningDate(value);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewSchedulings(List<Scheduling> newSchedulings) {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.addNewSchedulings');
    try {
      return super.addNewSchedulings(newSchedulings);
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_SchedulingStoreBaseActionController.startAction(
        name: '_SchedulingStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_SchedulingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
streamController: ${streamController},
scheduling: ${scheduling},
screeningDate: ${screeningDate},
screeningHour: ${screeningHour},
supervisor: ${supervisor},
trainee: ${trainee},
patient: ${patient},
defaultValueSupervisor: ${defaultValueSupervisor},
defaultValueTrainee: ${defaultValueTrainee},
defaultValuePatient: ${defaultValuePatient},
attendance: ${attendance},
listScheduling: ${listScheduling},
loading: ${loading},
error: ${error},
search: ${search},
search2: ${search2},
orderBy: ${orderBy},
orderBy2: ${orderBy2},
itemCount: ${itemCount},
showProgress: ${showProgress},
formattedDate: ${formattedDate},
formattedHour: ${formattedHour},
validSupervisor: ${validSupervisor},
validTrainee: ${validTrainee},
validPatient: ${validPatient},
validScreeningDate: ${validScreeningDate},
validForm: ${validForm},
savePressed: ${savePressed},
updatePressed: ${updatePressed}
    ''';
  }
}
