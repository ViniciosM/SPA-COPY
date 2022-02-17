// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PatientStore on _PatientStoreBase, Store {
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_PatientStoreBase.showProgress'))
          .value;
  Computed<bool>? _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName,
              name: '_PatientStoreBase.validName'))
          .value;
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_PatientStoreBase.validEmail'))
          .value;
  Computed<bool>? _$validPhoneComputed;

  @override
  bool get validPhone =>
      (_$validPhoneComputed ??= Computed<bool>(() => super.validPhone,
              name: '_PatientStoreBase.validPhone'))
          .value;
  Computed<bool>? _$validBirthDateComputed;

  @override
  bool get validBirthDate =>
      (_$validBirthDateComputed ??= Computed<bool>(() => super.validBirthDate,
              name: '_PatientStoreBase.validBirthDate'))
          .value;
  Computed<bool>? _$validAddressComputed;

  @override
  bool get validAddress =>
      (_$validAddressComputed ??= Computed<bool>(() => super.validAddress,
              name: '_PatientStoreBase.validAddress'))
          .value;
  Computed<bool>? _$validNaturalnessComputed;

  @override
  bool get validNaturalness => (_$validNaturalnessComputed ??= Computed<bool>(
          () => super.validNaturalness,
          name: '_PatientStoreBase.validNaturalness'))
      .value;
  Computed<bool>? _$validMaritalStatusComputed;

  @override
  bool get validMaritalStatus => (_$validMaritalStatusComputed ??=
          Computed<bool>(() => super.validMaritalStatus,
              name: '_PatientStoreBase.validMaritalStatus'))
      .value;
  Computed<bool>? _$validHowDidYouFindOutComputed;

  @override
  bool get validHowDidYouFindOut => (_$validHowDidYouFindOutComputed ??=
          Computed<bool>(() => super.validHowDidYouFindOut,
              name: '_PatientStoreBase.validHowDidYouFindOut'))
      .value;
  Computed<bool>? _$validEducationLevelComputed;

  @override
  bool get validEducationLevel => (_$validEducationLevelComputed ??=
          Computed<bool>(() => super.validEducationLevel,
              name: '_PatientStoreBase.validEducationLevel'))
      .value;
  Computed<bool>? _$validNameResponsibleComputed;

  @override
  bool get validNameResponsible => (_$validNameResponsibleComputed ??=
          Computed<bool>(() => super.validNameResponsible,
              name: '_PatientStoreBase.validNameResponsible'))
      .value;
  Computed<bool>? _$validPhoneResponsibleComputed;

  @override
  bool get validPhoneResponsible => (_$validPhoneResponsibleComputed ??=
          Computed<bool>(() => super.validPhoneResponsible,
              name: '_PatientStoreBase.validPhoneResponsible'))
      .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_PatientStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_PatientStoreBase.savePressed'))
      .value;
  Computed<dynamic Function()>? _$updatePressedComputed;

  @override
  dynamic Function() get updatePressed => (_$updatePressedComputed ??=
          Computed<dynamic Function()>(() => super.updatePressed,
              name: '_PatientStoreBase.updatePressed'))
      .value;

  final _$nameControllerAtom = Atom(name: '_PatientStoreBase.nameController');

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

  final _$emailControllerAtom = Atom(name: '_PatientStoreBase.emailController');

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

  final _$phoneControllerAtom = Atom(name: '_PatientStoreBase.phoneController');

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

  final _$phone2ControllerAtom =
      Atom(name: '_PatientStoreBase.phone2Controller');

  @override
  TextEditingController get phone2Controller {
    _$phone2ControllerAtom.reportRead();
    return super.phone2Controller;
  }

  @override
  set phone2Controller(TextEditingController value) {
    _$phone2ControllerAtom.reportWrite(value, super.phone2Controller, () {
      super.phone2Controller = value;
    });
  }

  final _$naturalnessControllerAtom =
      Atom(name: '_PatientStoreBase.naturalnessController');

  @override
  TextEditingController get naturalnessController {
    _$naturalnessControllerAtom.reportRead();
    return super.naturalnessController;
  }

  @override
  set naturalnessController(TextEditingController value) {
    _$naturalnessControllerAtom.reportWrite(value, super.naturalnessController,
        () {
      super.naturalnessController = value;
    });
  }

  final _$birthDateControllerAtom =
      Atom(name: '_PatientStoreBase.birthDateController');

  @override
  TextEditingController get birthDateController {
    _$birthDateControllerAtom.reportRead();
    return super.birthDateController;
  }

  @override
  set birthDateController(TextEditingController value) {
    _$birthDateControllerAtom.reportWrite(value, super.birthDateController, () {
      super.birthDateController = value;
    });
  }

  final _$nameResponsibleControllerAtom =
      Atom(name: '_PatientStoreBase.nameResponsibleController');

  @override
  TextEditingController get nameResponsibleController {
    _$nameResponsibleControllerAtom.reportRead();
    return super.nameResponsibleController;
  }

  @override
  set nameResponsibleController(TextEditingController value) {
    _$nameResponsibleControllerAtom
        .reportWrite(value, super.nameResponsibleController, () {
      super.nameResponsibleController = value;
    });
  }

  final _$addressControllerAtom =
      Atom(name: '_PatientStoreBase.addressController');

  @override
  TextEditingController get addressController {
    _$addressControllerAtom.reportRead();
    return super.addressController;
  }

  @override
  set addressController(TextEditingController value) {
    _$addressControllerAtom.reportWrite(value, super.addressController, () {
      super.addressController = value;
    });
  }

  final _$phoneResponsibleControllerAtom =
      Atom(name: '_PatientStoreBase.phoneResponsibleController');

  @override
  TextEditingController get phoneResponsibleController {
    _$phoneResponsibleControllerAtom.reportRead();
    return super.phoneResponsibleController;
  }

  @override
  set phoneResponsibleController(TextEditingController value) {
    _$phoneResponsibleControllerAtom
        .reportWrite(value, super.phoneResponsibleController, () {
      super.phoneResponsibleController = value;
    });
  }

  final _$patientAtom = Atom(name: '_PatientStoreBase.patient');

  @override
  Patient? get patient {
    _$patientAtom.reportRead();
    return super.patient;
  }

  @override
  set patient(Patient? value) {
    _$patientAtom.reportWrite(value, super.patient, () {
      super.patient = value;
    });
  }

  final _$nameAtom = Atom(name: '_PatientStoreBase.name');

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

  final _$emailAtom = Atom(name: '_PatientStoreBase.email');

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

  final _$phoneAtom = Atom(name: '_PatientStoreBase.phone');

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

  final _$phone2Atom = Atom(name: '_PatientStoreBase.phone2');

  @override
  String? get phone2 {
    _$phone2Atom.reportRead();
    return super.phone2;
  }

  @override
  set phone2(String? value) {
    _$phone2Atom.reportWrite(value, super.phone2, () {
      super.phone2 = value;
    });
  }

  final _$birthDateAtom = Atom(name: '_PatientStoreBase.birthDate');

  @override
  String? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(String? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$addressAtom = Atom(name: '_PatientStoreBase.address');

  @override
  Address? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$summaryAddressAtom = Atom(name: '_PatientStoreBase.summaryAddress');

  @override
  String? get summaryAddress {
    _$summaryAddressAtom.reportRead();
    return super.summaryAddress;
  }

  @override
  set summaryAddress(String? value) {
    _$summaryAddressAtom.reportWrite(value, super.summaryAddress, () {
      super.summaryAddress = value;
    });
  }

  final _$naturalnessAtom = Atom(name: '_PatientStoreBase.naturalness');

  @override
  String? get naturalness {
    _$naturalnessAtom.reportRead();
    return super.naturalness;
  }

  @override
  set naturalness(String? value) {
    _$naturalnessAtom.reportWrite(value, super.naturalness, () {
      super.naturalness = value;
    });
  }

  final _$maritalStatusAtom = Atom(name: '_PatientStoreBase.maritalStatus');

  @override
  String? get maritalStatus {
    _$maritalStatusAtom.reportRead();
    return super.maritalStatus;
  }

  @override
  set maritalStatus(String? value) {
    _$maritalStatusAtom.reportWrite(value, super.maritalStatus, () {
      super.maritalStatus = value;
    });
  }

  final _$educationLevelAtom = Atom(name: '_PatientStoreBase.educationLevel');

  @override
  String? get educationLevel {
    _$educationLevelAtom.reportRead();
    return super.educationLevel;
  }

  @override
  set educationLevel(String? value) {
    _$educationLevelAtom.reportWrite(value, super.educationLevel, () {
      super.educationLevel = value;
    });
  }

  final _$howDidYouFindOutAtom =
      Atom(name: '_PatientStoreBase.howDidYouFindOut');

  @override
  String? get howDidYouFindOut {
    _$howDidYouFindOutAtom.reportRead();
    return super.howDidYouFindOut;
  }

  @override
  set howDidYouFindOut(String? value) {
    _$howDidYouFindOutAtom.reportWrite(value, super.howDidYouFindOut, () {
      super.howDidYouFindOut = value;
    });
  }

  final _$nameResponsibleAtom = Atom(name: '_PatientStoreBase.nameResponsible');

  @override
  String? get nameResponsible {
    _$nameResponsibleAtom.reportRead();
    return super.nameResponsible;
  }

  @override
  set nameResponsible(String? value) {
    _$nameResponsibleAtom.reportWrite(value, super.nameResponsible, () {
      super.nameResponsible = value;
    });
  }

  final _$phoneResponsibleAtom =
      Atom(name: '_PatientStoreBase.phoneResponsible');

  @override
  String? get phoneResponsible {
    _$phoneResponsibleAtom.reportRead();
    return super.phoneResponsible;
  }

  @override
  set phoneResponsible(String? value) {
    _$phoneResponsibleAtom.reportWrite(value, super.phoneResponsible, () {
      super.phoneResponsible = value;
    });
  }

  final _$addressFormattedAtom =
      Atom(name: '_PatientStoreBase.addressFormatted');

  @override
  String get addressFormatted {
    _$addressFormattedAtom.reportRead();
    return super.addressFormatted;
  }

  @override
  set addressFormatted(String value) {
    _$addressFormattedAtom.reportWrite(value, super.addressFormatted, () {
      super.addressFormatted = value;
    });
  }

  final _$searchAtom = Atom(name: '_PatientStoreBase.search');

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

  final _$orderByAtom = Atom(name: '_PatientStoreBase.orderBy');

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

  final _$listNamePatientAtom = Atom(name: '_PatientStoreBase.listNamePatient');

  @override
  List<String> get listNamePatient {
    _$listNamePatientAtom.reportRead();
    return super.listNamePatient;
  }

  @override
  set listNamePatient(List<String> value) {
    _$listNamePatientAtom.reportWrite(value, super.listNamePatient, () {
      super.listNamePatient = value;
    });
  }

  final _$loadingAtom = Atom(name: '_PatientStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_PatientStoreBase.error');

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

  final _$_createAsyncAction = AsyncAction('_PatientStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_updateAsyncAction = AsyncAction('_PatientStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$_failedCreateAsyncAction =
      AsyncAction('_PatientStoreBase._failedCreate');

  @override
  Future<void> _failedCreate() {
    return _$_failedCreateAsyncAction.run(() => super._failedCreate());
  }

  final _$deleteAsyncAction = AsyncAction('_PatientStoreBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$getAllPatientAsyncAction =
      AsyncAction('_PatientStoreBase.getAllPatient');

  @override
  Future<void> getAllPatient() {
    return _$getAllPatientAsyncAction.run(() => super.getAllPatient());
  }

  final _$getAllNamePatientAsyncAction =
      AsyncAction('_PatientStoreBase.getAllNamePatient');

  @override
  Future<void> getAllNamePatient() {
    return _$getAllNamePatientAsyncAction.run(() => super.getAllNamePatient());
  }

  final _$_PatientStoreBaseActionController =
      ActionController(name: '_PatientStoreBase');

  @override
  void updatePatientList(List<Patient> upPatient) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.updatePatientList');
    try {
      return super.updatePatientList(upPatient);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNamePatientList(List<Patient> upPatient) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.updateNamePatientList');
    try {
      return super.updateNamePatientList(upPatient);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPatient(Patient value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setPatient');
    try {
      return super.setPatient(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone2(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setPhone2');
    try {
      return super.setPhone2(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNaturalness(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setNaturalness');
    try {
      return super.setNaturalness(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaritalStatus(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setMaritalStatus');
    try {
      return super.setMaritalStatus(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(Address value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSummaryAddress(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setSummaryAddress');
    try {
      return super.setSummaryAddress(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEducationLevel(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setEducationLevel');
    try {
      return super.setEducationLevel(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHowDidYouFindOut(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setHowDidYouFindOut');
    try {
      return super.setHowDidYouFindOut(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameResponsible(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setNameResponsible');
    try {
      return super.setNameResponsible(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneResponsible(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setPhoneResponsible');
    try {
      return super.setPhoneResponsible(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddressFormatted(String value) {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.setAddressFormatted');
    try {
      return super.setAddressFormatted(value);
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_PatientStoreBaseActionController.startAction(
        name: '_PatientStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_PatientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
emailController: ${emailController},
phoneController: ${phoneController},
phone2Controller: ${phone2Controller},
naturalnessController: ${naturalnessController},
birthDateController: ${birthDateController},
nameResponsibleController: ${nameResponsibleController},
addressController: ${addressController},
phoneResponsibleController: ${phoneResponsibleController},
patient: ${patient},
name: ${name},
email: ${email},
phone: ${phone},
phone2: ${phone2},
birthDate: ${birthDate},
address: ${address},
summaryAddress: ${summaryAddress},
naturalness: ${naturalness},
maritalStatus: ${maritalStatus},
educationLevel: ${educationLevel},
howDidYouFindOut: ${howDidYouFindOut},
nameResponsible: ${nameResponsible},
phoneResponsible: ${phoneResponsible},
addressFormatted: ${addressFormatted},
search: ${search},
orderBy: ${orderBy},
listNamePatient: ${listNamePatient},
loading: ${loading},
error: ${error},
showProgress: ${showProgress},
validName: ${validName},
validEmail: ${validEmail},
validPhone: ${validPhone},
validBirthDate: ${validBirthDate},
validAddress: ${validAddress},
validNaturalness: ${validNaturalness},
validMaritalStatus: ${validMaritalStatus},
validHowDidYouFindOut: ${validHowDidYouFindOut},
validEducationLevel: ${validEducationLevel},
validNameResponsible: ${validNameResponsible},
validPhoneResponsible: ${validPhoneResponsible},
validForm: ${validForm},
savePressed: ${savePressed},
updatePressed: ${updatePressed}
    ''';
  }
}
