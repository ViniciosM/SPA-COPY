// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageStore on _PageStoreBase, Store {
  final _$indexAtom = Atom(name: '_PageStoreBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_PageStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$pageNameAtom = Atom(name: '_PageStoreBase.pageName');

  @override
  String get pageName {
    _$pageNameAtom.reportRead();
    return super.pageName;
  }

  @override
  set pageName(String value) {
    _$pageNameAtom.reportWrite(value, super.pageName, () {
      super.pageName = value;
    });
  }

  final _$_PageStoreBaseActionController =
      ActionController(name: '_PageStoreBase');

  @override
  void setIndex(int value) {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentIndex(int value) {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(value);
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageName(int value) {
    final _$actionInfo = _$_PageStoreBaseActionController.startAction(
        name: '_PageStoreBase.setPageName');
    try {
      return super.setPageName(value);
    } finally {
      _$_PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
currentIndex: ${currentIndex},
pageName: ${pageName}
    ''';
  }
}
