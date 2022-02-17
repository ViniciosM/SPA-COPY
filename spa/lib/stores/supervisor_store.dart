import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:spa/helpers/extensions.dart';
import 'package:spa/models/supervisor.dart';
import 'package:spa/repositories/supervisor_repository.dart';
part 'supervisor_store.g.dart';

class SupervisorStore = _SupervisorStoreBase with _$SupervisorStore;

abstract class _SupervisorStoreBase with Store {
  _SupervisorStoreBase() {
    autorun((_) async {
      loading = true;

      if (supervisor != null) {
        nameController.text = supervisor!.name!;
        phoneController.text = supervisor!.phone!;
        emailController.text = supervisor!.email!;
        crpController.text = supervisor!.crpSupervisor!;
        name = nameController.text;
        crp = phoneController.text;
        email = emailController.text;
        phone = phoneController.text;
      }

      try {
        var newSupervisorList =
            await SupervisorRepository().read(search, orderBy);
        updateSupervisorList(newSupervisorList);
        updateNameSupervisorList(newSupervisorList);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
    });
  }

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController phoneController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController crpController = TextEditingController();

  ObservableList<Supervisor> supervisorList = ObservableList<Supervisor>();

  @observable
  Supervisor? supervisor;

  @observable
  String? idSupervisor;

  @observable
  String? name;

  @observable
  String? crp;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  List<String> listNameSupervisor = ['A definir'];

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  String search = '';

  @observable
  String orderBy = 'Ordem alfabética';

  @action
  void updateSupervisorList(List<Supervisor> upSupervisor) {
    if (supervisorList.isNotEmpty) {
      supervisorList.clear();
    }
    supervisorList.addAll(upSupervisor);
  }

  @action
  void updateNameSupervisorList(List<Supervisor> upSupervisor) {
    if (listNameSupervisor.isNotEmpty) {
      listNameSupervisor.clear();
      listNameSupervisor.add('A definir');
    }
    for (Supervisor s in upSupervisor) {
      listNameSupervisor.add(s.name!);
    }
  }

  @action
  void setSearch(String value) => search = value;

  @action
  void setOrderBy(String value) => orderBy = value;

  @action
  void setIdSupervisor(String value) => idSupervisor = value;

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
  void setSupervisor(Supervisor value) => supervisor = value;

  @action
  clearFields() {
    nameController.text = '';
    phoneController.text = '';
    emailController.text = '';
    crpController.text = '';
    name = null;
    email = null;
    crp = null;
    phone = null;
    supervisor = null;
  }

  @computed
  int get itemCount => supervisorList.length;

  @computed
  bool get showProgress => loading && supervisorList.isEmpty;

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
  Function() get savePressed => validForm ? _create : _failCreate;

  @computed
  Function() get updatePressed => validForm ? _update : _failCreate;

  @action
  Future<void> _create() async {
    loading = true;
    error = null;

    try {
      if (validForm) {
        Supervisor s = Supervisor(
            name: name, crpSupervisor: crp, email: email, phone: phone);
        await SupervisorRepository().create(s);
        supervisorList.add(s);
        listNameSupervisor.add(s.name!);
        clearFields();
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _failCreate() async {
    loading = true;
    loading = false;
  }

  @action
  Future<void> getAllSupervisor() async {
    loading = true;
    try {
      SupervisorRepository s = SupervisorRepository();
      List<Supervisor> listSupervisor = await s.read(search, orderBy);

      for (Supervisor s in listSupervisor) {
        supervisorList.add(s);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> getAllNameSupervisor() async {
    loading = true;
    try {
      SupervisorRepository s = SupervisorRepository();
      List<Supervisor> listSupervisor = await s.read(search, orderBy);

      for (Supervisor s in listSupervisor) {
        listNameSupervisor.add(s.name!);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> _update() async {
    loading = true;
    error = null;

    try {
      supervisor!.name = nameController.text;
      supervisor!.email = emailController.text;
      supervisor!.crpSupervisor = crpController.text;
      supervisor!.phone = phoneController.text;

      SupervisorRepository supervisorRepository = SupervisorRepository();
      await supervisorRepository.update(supervisor!);
      supervisor = null;
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
      await SupervisorRepository().delete(id);
      supervisorList.removeWhere((element) => element.idSupervisor == id);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
