import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:spa/helpers/extensions.dart';
import 'package:spa/models/coordinator.dart';
import 'package:spa/repositories/coordinator_repository.dart';

part 'coordinator_store.g.dart';

class CoordinatorStore = _CoordinatorStoreBase with _$CoordinatorStore;

abstract class _CoordinatorStoreBase with Store {
  _CoordinatorStoreBase() {
    autorun((_) async {
      loading = true;

      if (coordinator != null) {
        nameController.text = coordinator!.name!;
        phoneController.text = coordinator!.phone!;
        emailController.text = coordinator!.email!;
        crpController.text = coordinator!.crpCoordinator!;
        name = nameController.text;
        crp = phoneController.text;
        email = emailController.text;
        phone = phoneController.text;
      }

      try {
        var newCoordinatorList =
            await CoordinatorRepository().read(search, orderBy);

        updateCoordinatorList(newCoordinatorList);
        updateNameCoordinatorList(newCoordinatorList);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
    });
  }

  @observable
  bool change = true;

  @observable
  Coordinator? coordinator;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController phoneController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController crpController = TextEditingController();

  ObservableList<Coordinator> coordinatorList = ObservableList<Coordinator>();

  @observable
  String? name;

  @observable
  String? crp;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  bool loading = false;

  @observable
  bool showSaveMessage = false;

  @observable
  bool showFailureMessage = false;

  @observable
  String? error;

  @observable
  String search = '';

  @observable
  bool update = false;

  @observable
  String orderBy = 'Ordem alfabética';

  @observable
  List<String> listNameCoordinator = ['A definir'];

  @action
  void updateCoordinatorList(List<Coordinator> upCoordinator) {
    if (coordinatorList.isNotEmpty) {
      coordinatorList.clear();
    }
    coordinatorList.addAll(upCoordinator);
  }

  @action
  void updateNameCoordinatorList(List<Coordinator> upCoordinator) {
    if (listNameCoordinator.isNotEmpty) {
      listNameCoordinator.clear();
      listNameCoordinator.add('A definir');
    }
    for (Coordinator c in upCoordinator) {
      listNameCoordinator.add(c.name!);
    }
  }

  @action
  void setSearch(String value) => search = value;

  @action
  void setOrderBy(String value) => orderBy = value;

  @action
  void setCoordinator(Coordinator value) => coordinator = value;

  @action
  editForm() {
    if (coordinator != null) {
      nameController.text = coordinator!.name!;
      phoneController.text = coordinator!.phone!;
      emailController.text = coordinator!.email!;
      crpController.text = coordinator!.crpCoordinator!;
    }
  }

  @action
  void setName(String value) => name = value;

  @action
  void setCrp(String value) => crp = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setLoading() => loading = !loading;

  @action
  void setShowSaveMessage(bool value) => showSaveMessage = value;

  @action
  void setShowFailureMessage(bool value) => showFailureMessage = value;

  @action
  clearFields() {
    loading = true;
    nameController.text = '';
    phoneController.text = '';
    emailController.text = '';
    crpController.text = '';
    name = null;
    email = null;
    crp = null;
    phone = null;
    loading = false;
  }

  @computed
  int get itemCount => coordinatorList.length;

  @computed
  bool get showProgress => loading && coordinatorList.isEmpty;

  @computed
  bool get validName => name != null && name!.length > 3;
  String? get nameError => name == null || validName ? null : 'Nome inválido';

  @computed
  bool get validCrp => crp != null && crp!.length >= 7 && crp!.length <= 9;
  String? get crpError => crp == null || validCrp ? null : 'CRP inválido';

  @computed
  bool get validEmail => email != null && email!.isEmailValid();
  String? get emailError =>
      email == null || validEmail ? null : 'Email inválido';

  @computed
  bool get validPhone => phone != null && phone!.length == 14;
  String? get phoneError =>
      phone == null || validPhone ? null : 'Telefone inválido';

  @computed
  bool get validForm => validName && validEmail && validCrp && validPhone;

  @computed
  Function() get savePressed => validForm ? _create : _failedCreate;

  @computed
  Function() get updatePressed => _update;

  @action
  Future<void> _create() async {
    loading = true;
    error = null;

    try {
      if (validForm) {
        Coordinator c = Coordinator(
            name: name, crpCoordinator: crp, email: email, phone: phone);
        await CoordinatorRepository().create(c);
        coordinatorList.add(c);
        listNameCoordinator.add(c.name!);
        clearFields();
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _update() async {
    loading = true;
    error = null;

    try {
      coordinator!.name = nameController.text;
      coordinator!.email = emailController.text;
      coordinator!.crpCoordinator = crpController.text;
      coordinator!.phone = phoneController.text;

      CoordinatorRepository coordinatorRepository = CoordinatorRepository();
      await coordinatorRepository.update(coordinator!);
      coordinator = null;
      clearFields();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> delete(String id) async {
    loading = true;
    error = null;

    try {
      await CoordinatorRepository().delete(id);
      coordinatorList.removeWhere((element) => element.idCoordinator == id);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _failedCreate() async {
    showFailureMessage = true;
  }

  @action
  Future<void> getAllCoordinator(String s) async {
    loading = true;
    try {
      if (coordinatorList.isNotEmpty) {
        coordinatorList.clear();
      }

      CoordinatorRepository c = CoordinatorRepository();
      List<Coordinator> listCoordinator = await c.read(s, orderBy);

      for (Coordinator c in listCoordinator) {
        coordinatorList.add(c);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> getAllNameCoordinator() async {
    loading = true;
    try {
      CoordinatorRepository c = CoordinatorRepository();
      List<Coordinator> listCoordinator = await c.readNameCoordinator();

      for (Coordinator c in listCoordinator) {
        listNameCoordinator.add(c.name!);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }
}
