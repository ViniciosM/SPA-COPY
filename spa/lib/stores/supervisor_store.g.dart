// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervisor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SupervisorStore on _SupervisorStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_SupervisorStoreBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_SupervisorStoreBase.showProgress'))
          .value;
  Computed<bool>? _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName,
              name: '_SupervisorStoreBase.validName'))
          .value;
  Computed<bool>? _$validCrpComputed;

  @override
  bool get validCrp =>
      (_$validCrpComputed ??= Computed<bool>(() => super.validCrp,
              name: '_SupervisorStoreBase.validCrp'))
          .value;
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_SupervisorStoreBase.validEmail'))
          .value;
  Computed<bool>? _$validPhoneComputed;

  @override
  bool get validPhone =>
      (_$validPhoneComputed ??= Computed<bool>(() => super.validPhone,
              name: '_SupervisorStoreBase.validPhone'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_SupervisorStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_SupervisorStoreBase.savePressed'))
      .value;
  Computed<dynamic Function()>? _$updatePressedComputed;

  @override
  dynamic Function() get updatePressed => (_$updatePressedComputed ??=
          Computed<dynamic Function()>(() => super.updatePressed,
              name: '_SupervisorStoreBase.updatePressed'))
      .value;

  final _$nameControllerAtom =
      Atom(name: '_SupervisorStoreBase.nameController');

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

  final _$phoneControllerAtom =
      Atom(name: '_SupervisorStoreBase.phoneController');

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

  final _$emailControllerAtom =
      Atom(name: '_SupervisorStoreBase.emailController');

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

  final _$crpControllerAtom = Atom(name: '_SupervisorStoreBase.crpController');

  @override
  TextEditingController get crpController {
    _$crpControllerAtom.reportRead();
    return super.crpController;
  }

  @override
  set crpController(TextEditingController value) {
    _$crpControllerAtom.reportWrite(value, super.crpController, () {
      super.crpController = value;
    });
  }

  final _$supervisorAtom = Atom(name: '_SupervisorStoreBase.supervisor');

  @override
  Supervisor? get supervisor {
    _$supervisorAtom.reportRead();
    return super.supervisor;
  }

  @override
  set supervisor(Supervisor? value) {
    _$supervisorAtom.reportWrite(value, super.supervisor, () {
      super.supervisor = value;
    });
  }

  final _$idSupervisorAtom = Atom(name: '_SupervisorStoreBase.idSupervisor');

  @override
  String? get idSupervisor {
    _$idSupervisorAtom.reportRead();
    return super.idSupervisor;
  }

  @override
  set idSupervisor(String? value) {
    _$idSupervisorAtom.reportWrite(value, super.idSupervisor, () {
      super.idSupervisor = value;
    });
  }

  final _$nameAtom = Atom(name: '_SupervisorStoreBase.name');

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

  final _$crpAtom = Atom(name: '_SupervisorStoreBase.crp');

  @override
  String? get crp {
    _$crpAtom.reportRead();
    return super.crp;
  }

  @override
  set crp(String? value) {
    _$crpAtom.reportWrite(value, super.crp, () {
      super.crp = value;
    });
  }

  final _$emailAtom = Atom(name: '_SupervisorStoreBase.email');

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

  final _$phoneAtom = Atom(name: '_SupervisorStoreBase.phone');

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

  final _$listNameSupervisorAtom =
      Atom(name: '_SupervisorStoreBase.listNameSupervisor');

  @override
  List<String> get listNameSupervisor {
    _$listNameSupervisorAtom.reportRead();
    return super.listNameSupervisor;
  }

  @override
  set listNameSupervisor(List<String> value) {
    _$listNameSupervisorAtom.reportWrite(value, super.listNameSupervisor, () {
      super.listNameSupervisor = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SupervisorStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_SupervisorStoreBase.error');

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

  final _$searchAtom = Atom(name: '_SupervisorStoreBase.search');

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

  final _$orderByAtom = Atom(name: '_SupervisorStoreBase.orderBy');

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

  final _$_createAsyncAction = AsyncAction('_SupervisorStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_failCreateAsyncAction =
      AsyncAction('_SupervisorStoreBase._failCreate');

  @override
  Future<void> _failCreate() {
    return _$_failCreateAsyncAction.run(() => super._failCreate());
  }

  final _$getAllSupervisorAsyncAction =
      AsyncAction('_SupervisorStoreBase.getAllSupervisor');

  @override
  Future<void> getAllSupervisor() {
    return _$getAllSupervisorAsyncAction.run(() => super.getAllSupervisor());
  }

  final _$getAllNameSupervisorAsyncAction =
      AsyncAction('_SupervisorStoreBase.getAllNameSupervisor');

  @override
  Future<void> getAllNameSupervisor() {
    return _$getAllNameSupervisorAsyncAction
        .run(() => super.getAllNameSupervisor());
  }

  final _$_updateAsyncAction = AsyncAction('_SupervisorStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$deleteAsyncAction = AsyncAction('_SupervisorStoreBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$_SupervisorStoreBaseActionController =
      ActionController(name: '_SupervisorStoreBase');

  @override
  void updateSupervisorList(List<Supervisor> upSupervisor) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.updateSupervisorList');
    try {
      return super.updateSupervisorList(upSupervisor);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNameSupervisorList(List<Supervisor> upSupervisor) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.updateNameSupervisorList');
    try {
      return super.updateNameSupervisorList(upSupervisor);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdSupervisor(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setIdSupervisor');
    try {
      return super.setIdSupervisor(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCrp(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setCrp');
    try {
      return super.setCrp(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSupervisor(Supervisor value) {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.setSupervisor');
    try {
      return super.setSupervisor(value);
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_SupervisorStoreBaseActionController.startAction(
        name: '_SupervisorStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_SupervisorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
phoneController: ${phoneController},
emailController: ${emailController},
crpController: ${crpController},
supervisor: ${supervisor},
idSupervisor: ${idSupervisor},
name: ${name},
crp: ${crp},
email: ${email},
phone: ${phone},
listNameSupervisor: ${listNameSupervisor},
loading: ${loading},
error: ${error},
search: ${search},
orderBy: ${orderBy},
itemCount: ${itemCount},
showProgress: ${showProgress},
validName: ${validName},
validCrp: ${validCrp},
validEmail: ${validEmail},
validPhone: ${validPhone},
validForm: ${validForm},
savePressed: ${savePressed},
updatePressed: ${updatePressed}
    ''';
  }
}
