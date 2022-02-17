// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormStore on _FormStoreBase, Store {
  final _$formAtom = Atom(name: '_FormStoreBase.form');

  @override
  int get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(int value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  final _$_FormStoreBaseActionController =
      ActionController(name: '_FormStoreBase');

  @override
  void setForm(int value) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setForm');
    try {
      return super.setForm(value);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
form: ${form}
    ''';
  }
}
