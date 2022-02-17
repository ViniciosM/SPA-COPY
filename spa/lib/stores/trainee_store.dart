import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:spa/helpers/extensions.dart';
import 'package:spa/models/trainee.dart';
import 'package:spa/repositories/trainee_repository.dart';
part 'trainee_store.g.dart';

class TraineeStore = _TraineeStoreBase with _$TraineeStore;

abstract class _TraineeStoreBase with Store {
  _TraineeStoreBase() {
    autorun((_) async {
      loading = true;

      if (trainee != null) {
        nameController.text = trainee!.name!;
        phoneController.text = trainee!.phone!;
        emailController.text = trainee!.email!;
        registrationController.text = trainee!.registration!;

        name = nameController.text;
        phone = phoneController.text;
        email = emailController.text;
        registration = registrationController.text;
        supervisor = trainee!.supervisor!;
        coordinator = trainee!.coordinator!;
        traineeArea = trainee!.traineeArea!;
        role = trainee!.role!;
        semester = trainee!.semester!;
      }

      try {
        var newTraineeList = await TraineeRepository().read(search, orderBy);
        updateTraineeList(newTraineeList);
        updateNameTraineeList(newTraineeList);
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
  TextEditingController registrationController = TextEditingController();

  ObservableList<Trainee> traineeList = ObservableList<Trainee>();

  @observable
  Trainee? trainee;

  @observable
  String? name;

  @observable
  String? registration;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  String? semester = 'Selecione o semestre';

  @observable
  String? coordinator = 'Selecione o Coordenador de estágio';

  @observable
  String? supervisor = 'Selecione o Supervisor de estágio';

  @observable
  String? traineeArea = 'Selecione a área de estágio';

  @observable
  String? role = 'Extramuro';

  @observable
  List<String> listNameTrainee = ['A definir'];

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool cleaning = false;

  @observable
  String search = '';

  @observable
  String orderBy = 'Ordem alfabética';

  @action
  void updateTraineeList(List<Trainee> upTrainee) {
    if (traineeList.isNotEmpty) {
      traineeList.clear();
    }
    traineeList.addAll(upTrainee);
  }

  @action
  void updateNameTraineeList(List<Trainee> upTrainee) {
    if (listNameTrainee.isNotEmpty) {
      listNameTrainee.clear();
      listNameTrainee.add('A definir');
    }
    for (Trainee t in upTrainee) {
      listNameTrainee.add(t.name!);
    }
  }

  @action
  void setSearch(String value) => search = value;

  @action
  void setOrderBy(String value) => orderBy = value;

  @action
  clearFields() {
    nameController.text = '';
    phoneController.text = '';
    emailController.text = '';
    registrationController.text = '';
    email = null;
    registration = null;
    phone = null;
    semester = 'Selecione o semestre';
    coordinator = 'Selecione o Coordenador de estágio';
    supervisor = 'Selecione o Supervisor de estágio';
    traineeArea = 'Selecione a área de estágio';
    role = 'Extramuro';
    trainee = null;
  }

  @action
  void setTrainee(Trainee value) => trainee = value;

  @action
  void setName(String value) => name = value;

  @action
  void setRegistration(String value) => registration = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setCoordinator(String value) => coordinator = value;

  @action
  void setSupervisor(String value) => supervisor = value;

  @action
  void setTraineeArea(String value) => traineeArea = value;

  @action
  void setRole(String value) => role = value;

  @action
  void setSemester(String value) => semester = value;

  @action
  void setLoading() => loading = !loading;

  @computed
  int get itemCount => traineeList.length;

  @computed
  bool get showProgress => loading && traineeList.isEmpty;

  @computed
  bool get validName => name != null && name!.length > 3;
  String? get nameError => name == null || validName ? null : 'Nome inválido';

  @computed
  bool get validRegistration =>
      registration != null && registration!.length == 14;
  String? get registrationError =>
      registration == null || validRegistration ? null : 'Matrícula inválido';

  @computed
  bool get validEmail =>
      email != null && email!.isEmailValid() && cleaning == false;
  String? get emailError =>
      email == null || validEmail ? null : 'Email inválido';

  @computed
  bool get validPhone =>
      phone != null && phone!.length == 14 && cleaning == false;
  String? get phoneError =>
      phone == null || validPhone ? null : 'Telefone inválido';

  @computed
  bool get validCoordinator => coordinator != null && cleaning == false;
  String? get coordinatorError =>
      coordinator == null || validCoordinator ? null : 'Coordenador inválido';

  @computed
  bool get validSupervisor => supervisor != null && cleaning == false;
  String? get supervisorError =>
      supervisor == null || validSupervisor ? null : 'Supervisor inválido';

  @computed
  bool get validTraineeArea => traineeArea != null && cleaning == false;
  String? get traineeAreaError => traineeArea == null || validTraineeArea
      ? null
      : 'Área de estágio inválida';

  @computed
  bool get validRole => role != null;
  String? get roleError =>
      role == null || validRole ? null : 'Extramuro/Intramuro inválida';

  @computed
  bool get validSemester => semester != null;
  String? get semesterError =>
      semester == null || validSemester ? null : 'Semestre inválida';

  @computed
  bool get validForm =>
      validName &&
      validEmail &&
      validPhone &&
      validCoordinator &&
      validSupervisor &&
      validTraineeArea &&
      validSemester &&
      validRole;

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
        Trainee t = Trainee(
            registration: registration,
            name: name,
            coordinator: coordinator,
            supervisor: supervisor,
            traineeArea: traineeArea,
            email: email,
            phone: phone,
            role: role,
            semester: semester);

        await TraineeRepository().create(t);
        traineeList.add(t);
        listNameTrainee.add(t.name!);
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
      trainee!.name = nameController.text;
      trainee!.email = emailController.text;
      trainee!.registration = registrationController.text;
      trainee!.phone = phoneController.text;
      trainee!.supervisor = supervisor;
      trainee!.coordinator = coordinator;
      trainee!.semester = semester;
      trainee!.role = role;
      trainee!.traineeArea = traineeArea;

      TraineeRepository traineeRepository = TraineeRepository();
      await traineeRepository.update(trainee!);
      traineeList.add(trainee!);
      trainee = null;
      clearFields();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _failedCreate() async {
    loading = true;
    loading = false;
  }

  @action
  Future<void> getAllTrainee() async {
    loading = true;
    try {
      TraineeRepository t = TraineeRepository();
      List<Trainee> listTrainee = await t.read(search, orderBy);

      for (Trainee t in listTrainee) {
        traineeList.add(t);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> getAllNameTrainee() async {
    loading = true;
    try {
      TraineeRepository t = TraineeRepository();
      List<Trainee> listTrainee = await t.read(search, orderBy);

      for (Trainee t in listTrainee) {
        listNameTrainee.add(t.name!);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> delete(String id) async {
    loading = true;
    error = null;

    try {
      await TraineeRepository().delete(id);
      traineeList.removeWhere((element) => element.idTrainee == id);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
