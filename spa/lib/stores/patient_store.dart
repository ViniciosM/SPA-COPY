import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:spa/helpers/extensions.dart';
import 'package:spa/models/address.dart';
import 'package:spa/models/patient.dart';
import 'package:spa/repositories/patient_repository.dart';
import 'package:spa/stores/address_store.dart';
part 'patient_store.g.dart';

class PatientStore = _PatientStoreBase with _$PatientStore;

abstract class _PatientStoreBase with Store {
  _PatientStoreBase() {
    autorun((_) async {
      loading = true;

      if (patient != null) {
       
        String formattedBirthDate ='${patient!.birthDate!.day}/${patient!.birthDate!.month}/${patient!.birthDate!.year}';

        nameController.text = patient!.name!;
        phoneController.text = patient!.phone!;
        phone2Controller.text = patient!.phone2 ?? '';
        emailController.text = patient!.email!;
        nameResponsibleController.text = patient!.nameResponsible ?? '';
        phoneResponsibleController.text = patient!.phoneResponsible ?? '';
        naturalnessController.text = patient!.naturalness!;
        addressController.text = patient!.summaryAddress!;
        birthDateController.text = formattedBirthDate;

        educationLevel = patient!.educationLevel!;
        maritalStatus = patient!.maritalStatus!;
        howDidYouFindOut = patient!.howDidYouFindOut!;
        
        name = patient!.name!;
        phone = patient!.phone!;
        phone2 = patient!.phone2 ?? '';
        email = patient!.email!;
        nameResponsible = patient!.nameResponsible ?? '';
        phoneResponsible = patient!.phoneResponsible ?? '';
        naturalness = patient!.naturalness!;
        
        //address = patient!.address!;
        birthDate = formattedBirthDate;
      }
  
      try {
        var newPatientList = await PatientRepository().read(search, orderBy);
        updatePatientList(newPatientList);
        updateNamePatientList(newPatientList);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
      
    });
  }

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController phoneController = TextEditingController();

  @observable
  TextEditingController phone2Controller = TextEditingController();

  @observable
  TextEditingController naturalnessController = TextEditingController();

  @observable
  TextEditingController birthDateController = TextEditingController();

  @observable
  TextEditingController nameResponsibleController = TextEditingController();

  @observable
  TextEditingController addressController = TextEditingController();

  @observable
  TextEditingController phoneResponsibleController = TextEditingController();

  ObservableList<Patient> patientList = ObservableList<Patient>();

  @observable
  Patient? patient;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  String? phone2;

  @observable
  String? birthDate;

  @observable
  Address? address;

  @observable
  String? summaryAddress;

  @observable
  String? naturalness;

  @observable
  String? maritalStatus = 'Selecione o estado civil';

  @observable
  String? educationLevel = 'Selecione o grau de instrução';

  @observable
  String? howDidYouFindOut = 'Como ficou sabendo?';

  @observable
  String? nameResponsible;

  @observable
  String? phoneResponsible;

  @observable
  String addressFormatted = '';

  @observable
  String search = '';

  @observable
  String orderBy = 'Ordem alfabética';

  @observable
  List<String> listNamePatient = ['A definir'];

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void updatePatientList(List<Patient> upPatient) {
    if (patientList.isNotEmpty) {
      patientList.clear();
    }
    patientList.addAll(upPatient);
  }

  @action
  void updateNamePatientList(List<Patient> upPatient) {
    if (listNamePatient.isNotEmpty) {
      listNamePatient.clear();
      listNamePatient.add('A definir');
    }
    for (Patient p in upPatient) {
      listNamePatient.add(p.name!);
    }
  }

  @action
  void setSearch(String value) => search = value;

  @action
  void setOrderBy(String value) => orderBy = value;

  @action
  void setPatient(Patient value) => patient = value;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setPhone2(String value) => phone2 = value;

  @action
  void setBirthDate(String value) => birthDate = value;

  @action
  void setNaturalness(String value) => naturalness = value;

  @action
  void setMaritalStatus(String value) => maritalStatus = value;

  @action
  void setAddress(Address value) => address = value;

  @action
  void setSummaryAddress(String value) => summaryAddress = value;

  @action
  void setEducationLevel(String value) => educationLevel = value;

  @action
  void setHowDidYouFindOut(String value) => howDidYouFindOut = value;

  @action
  void setNameResponsible(String value) => nameResponsible = value;

  @action
  void setPhoneResponsible(String value) => phoneResponsible = value;

  @action
  void setAddressFormatted(String value) => addressFormatted = value;


  @action
  clearFields() {
    nameController.text = '';
    phone2Controller.text = '';
    phoneController.text = '';
    emailController.text = '';
    birthDateController.text = '';
    naturalnessController.text = '';
    nameResponsibleController.text = '';
    phoneResponsibleController.text = '';
    addressController.text = '';

    name = null;
    email = null;
    phone = null;
    phone2 = null;
    birthDate = null;
    naturalness = null;
    summaryAddress = null;
    maritalStatus = 'Selecione o estado civil';
    educationLevel = 'Selecione o grau de instrução';
    howDidYouFindOut = 'Como ficou sabendo?';
    nameResponsible = null;
    phoneResponsible = null;
    address = null;
    patient = null;
  }

  @computed
  bool get showProgress => loading && patientList.isEmpty;

  @computed
  bool get validName => name != null && name!.length > 3;
  String? get nameError => name == null || validName ? null : 'Nome inválido';

  @computed
  bool get validEmail => email != null && email!.isEmailValid();
  String? get emailError =>
      email == null || validEmail ? null : 'Email inválido';

  @computed
  bool get validPhone => phone != null && phone!.length == 14;
  String? get phoneError =>
      phone == null || validPhone ? null : 'Telefone inválido';

  @computed
  bool get validBirthDate => birthDate != null;
  String? get birthDateError => birthDate == null || validBirthDate
      ? null
      : 'Data de nascimento inválido';

  @computed
  bool get validAddress => address != null;
  String? get addressError =>
      address == null || validAddress ? null : 'Endereço inválido';

  @computed
  bool get validNaturalness => naturalness != null && naturalness!.length > 2;
  String? get naturalnessError =>
      naturalness == null || validNaturalness ? null : 'Naturalidade inválida';

  @computed
  bool get validMaritalStatus =>
      maritalStatus != null && maritalStatus!.length > 2;
  String? get maritalStatusError => maritalStatus == null || validMaritalStatus
      ? null
      : 'Estado civil inválido';

  @computed
  bool get validHowDidYouFindOut =>
      howDidYouFindOut != null && howDidYouFindOut!.length > 2;
  String? get howDidYouFindOutError =>
      howDidYouFindOut == null || validHowDidYouFindOut
          ? null
          : 'Como ficou sabendo inválido';

  @computed
  bool get validEducationLevel =>
      educationLevel != null && educationLevel!.length > 2;
  String? get educationLevelError =>
      educationLevel == null || validEducationLevel
          ? null
          : 'Grau de instrução inválido';

  @computed
  bool get validNameResponsible =>
      nameResponsible != null && nameResponsible!.length > 3;
  String? get nameResponsibleError =>
      nameResponsible == null || validNameResponsible
          ? null
          : 'Nome do responsável inválido';

  @computed
  bool get validPhoneResponsible =>
      phoneResponsible != null && phoneResponsible!.length == 14;
  String? get phoneResponsibleError =>
      phoneResponsible == null || validPhoneResponsible
          ? null
          : 'Telefone do responsável inválido';

  @computed
  bool get validForm =>
      validName &&
      validEmail &&
      validPhone &&
      validBirthDate &&
      validNaturalness &&
      validMaritalStatus &&
      validEducationLevel &&
      validHowDidYouFindOut;

  @computed
  Function() get savePressed => validForm ? _create : _failedCreate;

  @computed
  Function() get updatePressed => _update;

  @action
  Future<void> _create() async {
    loading = true;
    error = null;
    
    AddressStore addressStore = AddressStore();
    DateTime birthDateFormatted = DateTime.now();
    int age = 0;

    try {
      if (birthDate != null && birthDate!.length == 10) {
        List<String> list = [];
        list = birthDate!.split('/');
        birthDateFormatted = DateTime.parse('${list[2]}-${list[1]}-${list[0]}');
        age = DateTime.now().year - birthDateFormatted.year;
      }

      if (validForm) {
        //addressRepository.create(address!);
        Patient p = Patient(
            name: name,
            email: email,
            phone: phone,
            phone2: phone2,
            age: age,
            naturalness: naturalness,
            maritalStatus: maritalStatus,
            educationLevel: educationLevel,
            howDidYouFindOut: howDidYouFindOut,
            nameResponsible: nameResponsible,
            phoneResponsible: phoneResponsible,
            birthDate: birthDateFormatted,
            summaryAddress: summaryAddress,
            address: address);
        await PatientRepository().create(p);
        patientList.add(p);
        listNamePatient.add(p.name!);
        clearFields();
        addressStore.clearFields();
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
    
    AddressStore addressStore = AddressStore();
    DateTime birthDateFormatted = DateTime.now();
    int age = 0;
    try {
      if (birthDate != null && birthDate!.length == 10) {
        List<String> list = [];
        list = birthDate!.split('/');
        birthDateFormatted = DateTime.parse('${list[2]}-${list[1]}-${list[0]}');
        age = DateTime.now().year - birthDateFormatted.year;
      }

      patient!.name = nameController.text;
      patient!.email = emailController.text;
      patient!.phone = phoneController.text;
      patient!.phone2 = phone2Controller.text;
      patient!.naturalness = naturalnessController.text;
      patient!.birthDate = birthDateFormatted;
      patient!.address = address;
      patient!.summaryAddress = addressController.text;
      patient!.nameResponsible = nameResponsibleController.text;
      patient!.phoneResponsible = phoneResponsibleController.text;
      patient!.howDidYouFindOut = howDidYouFindOut;
      patient!.maritalStatus = maritalStatus;
      patient!.educationLevel = educationLevel;
      patient!.age = age;

      PatientRepository patientRepository = PatientRepository();
      await patientRepository.update(patient!);
      patientList.add(patient!);
        listNamePatient.add(patient!.name!);
        clearFields();
        addressStore.clearFields();
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
  Future<void> delete(String id) async {
    loading = true;
    error = null;

    try {
      await PatientRepository().delete(id);
      patientList.removeWhere((element) => element.idPatient == id);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> getAllPatient() async {
    loading = true;
    try {
      PatientRepository p = PatientRepository();
      List<Patient> listPatient = await p.read(search, orderBy);

      for (Patient p in listPatient) {
        patientList.add(p);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }

  @action
  Future<void> getAllNamePatient() async {
    loading = true;
    try {
      PatientRepository p = PatientRepository();
      List<Patient> listPatient = await p.read(search, orderBy);

      for (Patient p in listPatient) {
        listNamePatient.add(p.name!);
      }
      loading = false;
    } catch (e) {
      Future.error(e);
    }
  }
}
