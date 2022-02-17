import 'package:mobx/mobx.dart';
part 'controller_store.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
  @observable
  bool attendance = false;

  @action
  void setAttendance(bool value) => attendance = !attendance;

  @observable
  int medicalRecord = 1;

  @action
  void setForm(int value) => medicalRecord = value;

  @observable
  int tableMedicalRecord = 1;

  @action
  void setTableMedicalRecord(int value) => tableMedicalRecord = value;
}
