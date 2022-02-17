// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressStore on _AddressStoreBase, Store {
  Computed<bool>? _$validStreetComputed;

  @override
  bool get validStreet =>
      (_$validStreetComputed ??= Computed<bool>(() => super.validStreet,
              name: '_AddressStoreBase.validStreet'))
          .value;
  Computed<bool>? _$validNumberComputed;

  @override
  bool get validNumber =>
      (_$validNumberComputed ??= Computed<bool>(() => super.validNumber,
              name: '_AddressStoreBase.validNumber'))
          .value;
  Computed<bool>? _$validDistrictComputed;

  @override
  bool get validDistrict =>
      (_$validDistrictComputed ??= Computed<bool>(() => super.validDistrict,
              name: '_AddressStoreBase.validDistrict'))
          .value;
  Computed<bool>? _$validPostalCodeComputed;

  @override
  bool get validPostalCode =>
      (_$validPostalCodeComputed ??= Computed<bool>(() => super.validPostalCode,
              name: '_AddressStoreBase.validPostalCode'))
          .value;
  Computed<bool>? _$validCityComputed;

  @override
  bool get validCity =>
      (_$validCityComputed ??= Computed<bool>(() => super.validCity,
              name: '_AddressStoreBase.validCity'))
          .value;
  Computed<bool>? _$validUfComputed;

  @override
  bool get validUf => (_$validUfComputed ??= Computed<bool>(() => super.validUf,
          name: '_AddressStoreBase.validUf'))
      .value;
  Computed<bool>? _$validComplementComputed;

  @override
  bool get validComplement =>
      (_$validComplementComputed ??= Computed<bool>(() => super.validComplement,
              name: '_AddressStoreBase.validComplement'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_AddressStoreBase.validForm'))
          .value;

  final _$streetControllerAtom =
      Atom(name: '_AddressStoreBase.streetController');

  @override
  TextEditingController get streetController {
    _$streetControllerAtom.reportRead();
    return super.streetController;
  }

  @override
  set streetController(TextEditingController value) {
    _$streetControllerAtom.reportWrite(value, super.streetController, () {
      super.streetController = value;
    });
  }

  final _$numberControllerAtom =
      Atom(name: '_AddressStoreBase.numberController');

  @override
  TextEditingController get numberController {
    _$numberControllerAtom.reportRead();
    return super.numberController;
  }

  @override
  set numberController(TextEditingController value) {
    _$numberControllerAtom.reportWrite(value, super.numberController, () {
      super.numberController = value;
    });
  }

  final _$postalCodeControllerAtom =
      Atom(name: '_AddressStoreBase.postalCodeController');

  @override
  TextEditingController get postalCodeController {
    _$postalCodeControllerAtom.reportRead();
    return super.postalCodeController;
  }

  @override
  set postalCodeController(TextEditingController value) {
    _$postalCodeControllerAtom.reportWrite(value, super.postalCodeController,
        () {
      super.postalCodeController = value;
    });
  }

  final _$cityControllerAtom = Atom(name: '_AddressStoreBase.cityController');

  @override
  TextEditingController get cityController {
    _$cityControllerAtom.reportRead();
    return super.cityController;
  }

  @override
  set cityController(TextEditingController value) {
    _$cityControllerAtom.reportWrite(value, super.cityController, () {
      super.cityController = value;
    });
  }

  final _$districtControllerAtom =
      Atom(name: '_AddressStoreBase.districtController');

  @override
  TextEditingController get districtController {
    _$districtControllerAtom.reportRead();
    return super.districtController;
  }

  @override
  set districtController(TextEditingController value) {
    _$districtControllerAtom.reportWrite(value, super.districtController, () {
      super.districtController = value;
    });
  }

  final _$ufControllerAtom = Atom(name: '_AddressStoreBase.ufController');

  @override
  TextEditingController get ufController {
    _$ufControllerAtom.reportRead();
    return super.ufController;
  }

  @override
  set ufController(TextEditingController value) {
    _$ufControllerAtom.reportWrite(value, super.ufController, () {
      super.ufController = value;
    });
  }

  final _$complementControllerAtom =
      Atom(name: '_AddressStoreBase.complementController');

  @override
  TextEditingController get complementController {
    _$complementControllerAtom.reportRead();
    return super.complementController;
  }

  @override
  set complementController(TextEditingController value) {
    _$complementControllerAtom.reportWrite(value, super.complementController,
        () {
      super.complementController = value;
    });
  }

  final _$streetAtom = Atom(name: '_AddressStoreBase.street');

  @override
  String? get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String? value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  final _$numberAtom = Atom(name: '_AddressStoreBase.number');

  @override
  String? get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String? value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$districtAtom = Atom(name: '_AddressStoreBase.district');

  @override
  String? get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String? value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  final _$postalCodeAtom = Atom(name: '_AddressStoreBase.postalCode');

  @override
  String? get postalCode {
    _$postalCodeAtom.reportRead();
    return super.postalCode;
  }

  @override
  set postalCode(String? value) {
    _$postalCodeAtom.reportWrite(value, super.postalCode, () {
      super.postalCode = value;
    });
  }

  final _$cityAtom = Atom(name: '_AddressStoreBase.city');

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$ufAtom = Atom(name: '_AddressStoreBase.uf');

  @override
  String? get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String? value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  final _$complementAtom = Atom(name: '_AddressStoreBase.complement');

  @override
  String? get complement {
    _$complementAtom.reportRead();
    return super.complement;
  }

  @override
  set complement(String? value) {
    _$complementAtom.reportWrite(value, super.complement, () {
      super.complement = value;
    });
  }

  final _$_AddressStoreBaseActionController =
      ActionController(name: '_AddressStoreBase');

  @override
  void setStreet(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPostalCode(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setPostalCode');
    try {
      return super.setPostalCode(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUF(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setUF');
    try {
      return super.setUF(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_AddressStoreBaseActionController.startAction(
        name: '_AddressStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_AddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
streetController: ${streetController},
numberController: ${numberController},
postalCodeController: ${postalCodeController},
cityController: ${cityController},
districtController: ${districtController},
ufController: ${ufController},
complementController: ${complementController},
street: ${street},
number: ${number},
district: ${district},
postalCode: ${postalCode},
city: ${city},
uf: ${uf},
complement: ${complement},
validStreet: ${validStreet},
validNumber: ${validNumber},
validDistrict: ${validDistrict},
validPostalCode: ${validPostalCode},
validCity: ${validCity},
validUf: ${validUf},
validComplement: ${validComplement},
validForm: ${validForm}
    ''';
  }
}
