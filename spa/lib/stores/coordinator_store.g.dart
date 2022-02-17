// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoordinatorStore on _CoordinatorStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_CoordinatorStoreBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_CoordinatorStoreBase.showProgress'))
          .value;
  Computed<bool>? _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName,
              name: '_CoordinatorStoreBase.validName'))
          .value;
  Computed<bool>? _$validCrpComputed;

  @override
  bool get validCrp =>
      (_$validCrpComputed ??= Computed<bool>(() => super.validCrp,
              name: '_CoordinatorStoreBase.validCrp'))
          .value;
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_CoordinatorStoreBase.validEmail'))
          .value;
  Computed<bool>? _$validPhoneComputed;

  @override
  bool get validPhone =>
      (_$validPhoneComputed ??= Computed<bool>(() => super.validPhone,
              name: '_CoordinatorStoreBase.validPhone'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_CoordinatorStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_CoordinatorStoreBase.savePressed'))
      .value;
  Computed<dynamic Function()>? _$updatePressedComputed;

  @override
  dynamic Function() get updatePressed => (_$updatePressedComputed ??=
          Computed<dynamic Function()>(() => super.updatePressed,
              name: '_CoordinatorStoreBase.updatePressed'))
      .value;

  final _$changeAtom = Atom(name: '_CoordinatorStoreBase.change');

  @override
  bool get change {
    _$changeAtom.reportRead();
    return super.change;
  }

  @override
  set change(bool value) {
    _$changeAtom.reportWrite(value, super.change, () {
      super.change = value;
    });
  }

  final _$coordinatorAtom = Atom(name: '_CoordinatorStoreBase.coordinator');

  @override
  Coordinator? get coordinator {
    _$coordinatorAtom.reportRead();
    return super.coordinator;
  }

  @override
  set coordinator(Coordinator? value) {
    _$coordinatorAtom.reportWrite(value, super.coordinator, () {
      super.coordinator = value;
    });
  }

  final _$nameControllerAtom =
      Atom(name: '_CoordinatorStoreBase.nameController');

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
      Atom(name: '_CoordinatorStoreBase.phoneController');

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
      Atom(name: '_CoordinatorStoreBase.emailController');

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

  final _$crpControllerAtom = Atom(name: '_CoordinatorStoreBase.crpController');

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

  final _$nameAtom = Atom(name: '_CoordinatorStoreBase.name');

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

  final _$crpAtom = Atom(name: '_CoordinatorStoreBase.crp');

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

  final _$emailAtom = Atom(name: '_CoordinatorStoreBase.email');

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

  final _$phoneAtom = Atom(name: '_CoordinatorStoreBase.phone');

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

  final _$loadingAtom = Atom(name: '_CoordinatorStoreBase.loading');

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

  final _$showSaveMessageAtom =
      Atom(name: '_CoordinatorStoreBase.showSaveMessage');

  @override
  bool get showSaveMessage {
    _$showSaveMessageAtom.reportRead();
    return super.showSaveMessage;
  }

  @override
  set showSaveMessage(bool value) {
    _$showSaveMessageAtom.reportWrite(value, super.showSaveMessage, () {
      super.showSaveMessage = value;
    });
  }

  final _$showFailureMessageAtom =
      Atom(name: '_CoordinatorStoreBase.showFailureMessage');

  @override
  bool get showFailureMessage {
    _$showFailureMessageAtom.reportRead();
    return super.showFailureMessage;
  }

  @override
  set showFailureMessage(bool value) {
    _$showFailureMessageAtom.reportWrite(value, super.showFailureMessage, () {
      super.showFailureMessage = value;
    });
  }

  final _$errorAtom = Atom(name: '_CoordinatorStoreBase.error');

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

  final _$searchAtom = Atom(name: '_CoordinatorStoreBase.search');

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

  final _$updateAtom = Atom(name: '_CoordinatorStoreBase.update');

  @override
  bool get update {
    _$updateAtom.reportRead();
    return super.update;
  }

  @override
  set update(bool value) {
    _$updateAtom.reportWrite(value, super.update, () {
      super.update = value;
    });
  }

  final _$orderByAtom = Atom(name: '_CoordinatorStoreBase.orderBy');

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

  final _$listNameCoordinatorAtom =
      Atom(name: '_CoordinatorStoreBase.listNameCoordinator');

  @override
  List<String> get listNameCoordinator {
    _$listNameCoordinatorAtom.reportRead();
    return super.listNameCoordinator;
  }

  @override
  set listNameCoordinator(List<String> value) {
    _$listNameCoordinatorAtom.reportWrite(value, super.listNameCoordinator, () {
      super.listNameCoordinator = value;
    });
  }

  final _$_createAsyncAction = AsyncAction('_CoordinatorStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_updateAsyncAction = AsyncAction('_CoordinatorStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$deleteAsyncAction = AsyncAction('_CoordinatorStoreBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$_failedCreateAsyncAction =
      AsyncAction('_CoordinatorStoreBase._failedCreate');

  @override
  Future<void> _failedCreate() {
    return _$_failedCreateAsyncAction.run(() => super._failedCreate());
  }

  final _$getAllCoordinatorAsyncAction =
      AsyncAction('_CoordinatorStoreBase.getAllCoordinator');

  @override
  Future<void> getAllCoordinator(String s) {
    return _$getAllCoordinatorAsyncAction.run(() => super.getAllCoordinator(s));
  }

  final _$getAllNameCoordinatorAsyncAction =
      AsyncAction('_CoordinatorStoreBase.getAllNameCoordinator');

  @override
  Future<void> getAllNameCoordinator() {
    return _$getAllNameCoordinatorAsyncAction
        .run(() => super.getAllNameCoordinator());
  }

  final _$_CoordinatorStoreBaseActionController =
      ActionController(name: '_CoordinatorStoreBase');

  @override
  void updateCoordinatorList(List<Coordinator> upCoordinator) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.updateCoordinatorList');
    try {
      return super.updateCoordinatorList(upCoordinator);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNameCoordinatorList(List<Coordinator> upCoordinator) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.updateNameCoordinatorList');
    try {
      return super.updateNameCoordinatorList(upCoordinator);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy(String value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCoordinator(Coordinator value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setCoordinator');
    try {
      return super.setCoordinator(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editForm() {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.editForm');
    try {
      return super.editForm();
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCrp(String value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setCrp');
    try {
      return super.setCrp(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowSaveMessage(bool value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setShowSaveMessage');
    try {
      return super.setShowSaveMessage(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowFailureMessage(bool value) {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.setShowFailureMessage');
    try {
      return super.setShowFailureMessage(value);
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_CoordinatorStoreBaseActionController.startAction(
        name: '_CoordinatorStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_CoordinatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
change: ${change},
coordinator: ${coordinator},
nameController: ${nameController},
phoneController: ${phoneController},
emailController: ${emailController},
crpController: ${crpController},
name: ${name},
crp: ${crp},
email: ${email},
phone: ${phone},
loading: ${loading},
showSaveMessage: ${showSaveMessage},
showFailureMessage: ${showFailureMessage},
error: ${error},
search: ${search},
update: ${update},
orderBy: ${orderBy},
listNameCoordinator: ${listNameCoordinator},
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
