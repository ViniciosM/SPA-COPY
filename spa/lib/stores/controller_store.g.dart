// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerStore on _ControllerStoreBase, Store {
  final _$attendanceAtom = Atom(name: '_ControllerStoreBase.attendance');

  @override
  bool get attendance {
    _$attendanceAtom.reportRead();
    return super.attendance;
  }

  @override
  set attendance(bool value) {
    _$attendanceAtom.reportWrite(value, super.attendance, () {
      super.attendance = value;
    });
  }

  final _$medicalRecordAtom = Atom(name: '_ControllerStoreBase.medicalRecord');

  @override
  int get medicalRecord {
    _$medicalRecordAtom.reportRead();
    return super.medicalRecord;
  }

  @override
  set medicalRecord(int value) {
    _$medicalRecordAtom.reportWrite(value, super.medicalRecord, () {
      super.medicalRecord = value;
    });
  }

  final _$tableMedicalRecordAtom =
      Atom(name: '_ControllerStoreBase.tableMedicalRecord');

  @override
  int get tableMedicalRecord {
    _$tableMedicalRecordAtom.reportRead();
    return super.tableMedicalRecord;
  }

  @override
  set tableMedicalRecord(int value) {
    _$tableMedicalRecordAtom.reportWrite(value, super.tableMedicalRecord, () {
      super.tableMedicalRecord = value;
    });
  }

  final _$_ControllerStoreBaseActionController =
      ActionController(name: '_ControllerStoreBase');

  @override
  void setAttendance(bool value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setAttendance');
    try {
      return super.setAttendance(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setForm(int value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setForm');
    try {
      return super.setForm(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTableMedicalRecord(int value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setTableMedicalRecord');
    try {
      return super.setTableMedicalRecord(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
attendance: ${attendance},
medicalRecord: ${medicalRecord},
tableMedicalRecord: ${tableMedicalRecord}
    ''';
  }
}
