import 'package:mobx/mobx.dart';
part 'form_store.g.dart';

class FormStore = _FormStoreBase with _$FormStore;

abstract class _FormStoreBase with Store {
  @observable
  int form = 1;

  @action
  void setForm(int value) => form = value;

  
}
