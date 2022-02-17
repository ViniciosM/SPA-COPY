import 'package:mobx/mobx.dart';
part 'util_store.g.dart';

class UtilStore = _UtilStoreBase with _$UtilStore;

abstract class _UtilStoreBase with Store {
  @observable
  String datePicked = '';

  @observable
  DateTime selectedDay = DateTime.now();

  @observable
  DateTime focusedDay = DateTime.now();

  @observable
  List<String> list = [];

  @observable
  DateTime dateFormated = DateTime.now();

  @action
  void setDate(String value) => datePicked = value;

  @action
  void setSelectedDay(DateTime value) => selectedDay = value;

  @action
  void setFocusedDay(DateTime value) => focusedDay = value;

  @computed
  bool get isDateValid => datePicked.length == 10;

  @computed
  List<String> get splitDate =>
      isDateValid ? list = datePicked.split('/') : list = [];

  @computed
  DateTime get formatedDate => isDateValid
      ? dateFormated =
          DateTime.parse('${splitDate[2]}-${splitDate[1]}-${splitDate[0]}')
      : dateFormated = DateTime.now();
}
