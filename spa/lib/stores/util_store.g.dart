// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'util_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UtilStore on _UtilStoreBase, Store {
  Computed<bool>? _$isDateValidComputed;

  @override
  bool get isDateValid =>
      (_$isDateValidComputed ??= Computed<bool>(() => super.isDateValid,
              name: '_UtilStoreBase.isDateValid'))
          .value;
  Computed<List<String>>? _$splitDateComputed;

  @override
  List<String> get splitDate =>
      (_$splitDateComputed ??= Computed<List<String>>(() => super.splitDate,
              name: '_UtilStoreBase.splitDate'))
          .value;
  Computed<DateTime>? _$formatedDateComputed;

  @override
  DateTime get formatedDate =>
      (_$formatedDateComputed ??= Computed<DateTime>(() => super.formatedDate,
              name: '_UtilStoreBase.formatedDate'))
          .value;

  final _$datePickedAtom = Atom(name: '_UtilStoreBase.datePicked');

  @override
  String get datePicked {
    _$datePickedAtom.reportRead();
    return super.datePicked;
  }

  @override
  set datePicked(String value) {
    _$datePickedAtom.reportWrite(value, super.datePicked, () {
      super.datePicked = value;
    });
  }

  final _$selectedDayAtom = Atom(name: '_UtilStoreBase.selectedDay');

  @override
  DateTime get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  final _$focusedDayAtom = Atom(name: '_UtilStoreBase.focusedDay');

  @override
  DateTime get focusedDay {
    _$focusedDayAtom.reportRead();
    return super.focusedDay;
  }

  @override
  set focusedDay(DateTime value) {
    _$focusedDayAtom.reportWrite(value, super.focusedDay, () {
      super.focusedDay = value;
    });
  }

  final _$listAtom = Atom(name: '_UtilStoreBase.list');

  @override
  List<String> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<String> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$dateFormatedAtom = Atom(name: '_UtilStoreBase.dateFormated');

  @override
  DateTime get dateFormated {
    _$dateFormatedAtom.reportRead();
    return super.dateFormated;
  }

  @override
  set dateFormated(DateTime value) {
    _$dateFormatedAtom.reportWrite(value, super.dateFormated, () {
      super.dateFormated = value;
    });
  }

  final _$_UtilStoreBaseActionController =
      ActionController(name: '_UtilStoreBase');

  @override
  void setDate(String value) {
    final _$actionInfo = _$_UtilStoreBaseActionController.startAction(
        name: '_UtilStoreBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_UtilStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDay(DateTime value) {
    final _$actionInfo = _$_UtilStoreBaseActionController.startAction(
        name: '_UtilStoreBase.setSelectedDay');
    try {
      return super.setSelectedDay(value);
    } finally {
      _$_UtilStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFocusedDay(DateTime value) {
    final _$actionInfo = _$_UtilStoreBaseActionController.startAction(
        name: '_UtilStoreBase.setFocusedDay');
    try {
      return super.setFocusedDay(value);
    } finally {
      _$_UtilStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
datePicked: ${datePicked},
selectedDay: ${selectedDay},
focusedDay: ${focusedDay},
list: ${list},
dateFormated: ${dateFormated},
isDateValid: ${isDateValid},
splitDate: ${splitDate},
formatedDate: ${formatedDate}
    ''';
  }
}
