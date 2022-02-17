// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TraineeStore on _TraineeStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_TraineeStoreBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_TraineeStoreBase.showProgress'))
          .value;
  Computed<bool>? _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName,
              name: '_TraineeStoreBase.validName'))
          .value;
  Computed<bool>? _$validRegistrationComputed;

  @override
  bool get validRegistration => (_$validRegistrationComputed ??= Computed<bool>(
          () => super.validRegistration,
          name: '_TraineeStoreBase.validRegistration'))
      .value;
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_TraineeStoreBase.validEmail'))
          .value;
  Computed<bool>? _$validPhoneComputed;

  @override
  bool get validPhone =>
      (_$validPhoneComputed ??= Computed<bool>(() => super.validPhone,
              name: '_TraineeStoreBase.validPhone'))
          .value;
  Computed<bool>? _$validCoordinatorComputed;

  @override
  bool get validCoordinator => (_$validCoordinatorComputed ??= Computed<bool>(
          () => super.validCoordinator,
          name: '_TraineeStoreBase.validCoordinator'))
      .value;
  Computed<bool>? _$validSupervisorComputed;

  @override
  bool get validSupervisor =>
      (_$validSupervisorComputed ??= Computed<bool>(() => super.validSupervisor,
              name: '_TraineeStoreBase.validSupervisor'))
          .value;
  Computed<bool>? _$validTraineeAreaComputed;

  @override
  bool get validTraineeArea => (_$validTraineeAreaComputed ??= Computed<bool>(
          () => super.validTraineeArea,
          name: '_TraineeStoreBase.validTraineeArea'))
      .value;
  Computed<bool>? _$validRoleComputed;

  @override
  bool get validRole =>
      (_$validRoleComputed ??= Computed<bool>(() => super.validRole,
              name: '_TraineeStoreBase.validRole'))
          .value;
  Computed<bool>? _$validSemesterComputed;

  @override
  bool get validSemester =>
      (_$validSemesterComputed ??= Computed<bool>(() => super.validSemester,
              name: '_TraineeStoreBase.validSemester'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_TraineeStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_TraineeStoreBase.savePressed'))
      .value;
  Computed<dynamic Function()>? _$updatePressedComputed;

  @override
  dynamic Function() get updatePressed => (_$updatePressedComputed ??=
          Computed<dynamic Function()>(() => super.updatePressed,
              name: '_TraineeStoreBase.updatePressed'))
      .value;

  final _$nameControllerAtom = Atom(name: '_TraineeStoreBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$phoneControllerAtom = Atom(name: '_TraineeStoreBase.phoneController');

  @override
  TextEditingController get phoneController {
    _$phoneControllerAtom.reportRead();
    return super.phoneController;
  }

  @override
  set phoneController(TextEditingController value) {
    _$phoneControllerAtom.reportWrite(value, super.phoneController, () {
      super.phoneController = value;
    });
  }

  final _$emailControllerAtom = Atom(name: '_TraineeStoreBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$registrationControllerAtom =
      Atom(name: '_TraineeStoreBase.registrationController');

  @override
  TextEditingController get registrationController {
    _$registrationControllerAtom.reportRead();
    return super.registrationController;
  }

  @override
  set registrationController(TextEditingController value) {
    _$registrationControllerAtom
        .reportWrite(value, super.registrationController, () {
      super.registrationController = value;
    });
  }

  final _$traineeAtom = Atom(name: '_TraineeStoreBase.trainee');

  @override
  Trainee? get trainee {
    _$traineeAtom.reportRead();
    return super.trainee;
  }

  @override
  set trainee(Trainee? value) {
    _$traineeAtom.reportWrite(value, super.trainee, () {
      super.trainee = value;
    });
  }

  final _$nameAtom = Atom(name: '_TraineeStoreBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$registrationAtom = Atom(name: '_TraineeStoreBase.registration');

  @override
  String? get registration {
    _$registrationAtom.reportRead();
    return super.registration;
  }

  @override
  set registration(String? value) {
    _$registrationAtom.reportWrite(value, super.registration, () {
      super.registration = value;
    });
  }

  final _$emailAtom = Atom(name: '_TraineeStoreBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_TraineeStoreBase.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$semesterAtom = Atom(name: '_TraineeStoreBase.semester');

  @override
  String? get semester {
    _$semesterAtom.reportRead();
    return super.semester;
  }

  @override
  set semester(String? value) {
    _$semesterAtom.reportWrite(value, super.semester, () {
      super.semester = value;
    });
  }

  final _$coordinatorAtom = Atom(name: '_TraineeStoreBase.coordinator');

  @override
  String? get coordinator {
    _$coordinatorAtom.reportRead();
    return super.coordinator;
  }

  @override
  set coordinator(String? value) {
    _$coordinatorAtom.reportWrite(value, super.coordinator, () {
      super.coordinator = value;
    });
  }

  final _$supervisorAtom = Atom(name: '_TraineeStoreBase.supervisor');

  @override
  String? get supervisor {
    _$supervisorAtom.reportRead();
    return super.supervisor;
  }

  @override
  set supervisor(String? value) {
    _$supervisorAtom.reportWrite(value, super.supervisor, () {
      super.supervisor = value;
    });
  }

  final _$traineeAreaAtom = Atom(name: '_TraineeStoreBase.traineeArea');

  @override
  String? get traineeArea {
    _$traineeAreaAtom.reportRead();
    return super.traineeArea;
  }

  @override
  set traineeArea(String? value) {
    _$traineeAreaAtom.reportWrite(value, super.traineeArea, () {
      super.traineeArea = value;
    });
  }

  final _$roleAtom = Atom(name: '_TraineeStoreBase.role');

  @override
  String? get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(String? value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  final _$listNameTraineeAtom = Atom(name: '_TraineeStoreBase.listNameTrainee');

  @override
  List<String> get listNameTrainee {
    _$listNameTraineeAtom.reportRead();
    return super.listNameTrainee;
  }

  @override
  set listNameTrainee(List<String> value) {
    _$listNameTraineeAtom.reportWrite(value, super.listNameTrainee, () {
      super.listNameTrainee = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TraineeStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_TraineeStoreBase.error');

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

  final _$cleaningAtom = Atom(name: '_TraineeStoreBase.cleaning');

  @override
  bool get cleaning {
    _$cleaningAtom.reportRead();
    return super.cleaning;
  }

  @override
  set cleaning(bool value) {
    _$cleaningAtom.reportWrite(value, super.cleaning, () {
      super.cleaning = value;
    });
  }

  final _$searchAtom = Atom(name: '_TraineeStoreBase.search');

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

  final _$orderByAtom = Atom(name: '_TraineeStoreBase.orderBy');

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

  final _$_createAsyncAction = AsyncAction('_TraineeStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_updateAsyncAction = AsyncAction('_TraineeStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$_failedCreateAsyncAction =
      AsyncAction('_TraineeStoreBase._failedCreate');

  @override
  Future<void> _failedCreate() {
    return _$_failedCreateAsyncAction.run(() => super._failedCreate());
  }

  final _$getAllTraineeAsyncAction =
      AsyncAction('_TraineeStoreBase.getAllTrainee');

  @override
  Future<void> getAllTrainee() {
    return _$getAllTraineeAsyncAction.run(() => super.getAllTrainee());
  }

  final _$getAllNameTraineeAsyncAction =
      AsyncAction('_TraineeStoreBase.getAllNameTrainee');

  @override
  Future<void> getAllNameTrainee() {
    return _$getAllNameTraineeAsyncAction.run(() => super.getAllNameTrainee());
  }

  final _$deleteAsyncAction = AsyncAction('_TraineeStoreBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$_TraineeStoreBaseActionController =
      ActionController(name: '_TraineeStoreBase');

  @override
  void updateTraineeList(List<Trainee> upTrainee) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.updateTraineeList');
    try {
      return super.updateTraineeList(upTrainee);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNameTraineeList(List<Trainee> upTrainee) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.updateNameTraineeList');
    try {
      return super.updateNameTraineeList(upTrainee);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTrainee(Trainee value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setTrainee');
    try {
      return super.setTrainee(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegistration(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setRegistration');
    try {
      return super.setRegistration(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCoordinator(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setCoordinator');
    try {
      return super.setCoordinator(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSupervisor(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setSupervisor');
    try {
      return super.setSupervisor(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTraineeArea(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setTraineeArea');
    try {
      return super.setTraineeArea(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRole(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setRole');
    try {
      return super.setRole(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSemester(String value) {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setSemester');
    try {
      return super.setSemester(value);
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_TraineeStoreBaseActionController.startAction(
        name: '_TraineeStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_TraineeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
phoneController: ${phoneController},
emailController: ${emailController},
registrationController: ${registrationController},
trainee: ${trainee},
name: ${name},
registration: ${registration},
email: ${email},
phone: ${phone},
semester: ${semester},
coordinator: ${coordinator},
supervisor: ${supervisor},
traineeArea: ${traineeArea},
role: ${role},
listNameTrainee: ${listNameTrainee},
loading: ${loading},
error: ${error},
cleaning: ${cleaning},
search: ${search},
orderBy: ${orderBy},
itemCount: ${itemCount},
showProgress: ${showProgress},
validName: ${validName},
validRegistration: ${validRegistration},
validEmail: ${validEmail},
validPhone: ${validPhone},
validCoordinator: ${validCoordinator},
validSupervisor: ${validSupervisor},
validTraineeArea: ${validTraineeArea},
validRole: ${validRole},
validSemester: ${validSemester},
validForm: ${validForm},
savePressed: ${savePressed},
updatePressed: ${updatePressed}
    ''';
  }
}
