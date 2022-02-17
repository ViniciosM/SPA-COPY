const keyFieldId = 'objectId';
const keyCreatedAt = 'createdAt';

const keyUserId = keyFieldId;
const keyUserName = 'name';
const keyUserEmail = 'email';
const keyUserPhone = 'phone';
const keyUserType = 'type';
const keyUserCreatedAt = 'createdAt';
const keyUserAuthData = 'authData';

/* ----- Coordenador ----- */
const keyCoordinatorTable = 'Coordinator';
const keyIdCoordinator = keyFieldId;
const keyCrpCoordinator = 'crpCoordinator';
const keyNameCoordinator = 'name';
const keyPhoneCoordinator = 'phone';
const keyEmailCoordinator = 'email';

/* ----- Supervisor ----- */
const keySupervisorTable = 'Supervisor';
const keyIdSupervisor = keyFieldId;
const keyCrpSupervisor = 'crpSupervisor';
const keyNameSupervisor = 'name';
const keyPhoneSupervisor = 'phone';
const keyEmailSupervisor = 'email';

/* ----- Área de Estágio ----- */
const keyTraineeAreaTable = 'TraineeArea';
const keyTraineeAreaId = keyFieldId;
const keyTraineeArea = 'traineeArea';

/* ----- Estagiário ----- */
const String keyTraineeTable = 'Trainee';
const String keyIdTrainee = keyFieldId;
const String keyRegistrationTrainee = 'registration';
const String keyNameTrainee = 'name';
const String keyTraineeCoordinator = 'coordinator';
const String keyTraineeSupervisor = 'supervisor';
const String keyNameTraineeArea = 'traineeArea';
const String keySemesterTrainee = 'semester';
const String keyEmailTrainee = 'email';
const String keyPhoneTrainee = 'phone';
const String keyRoleTrainee = 'role';

/* ----- Paciente ----- */
const String keyPatientTable = 'Patient';
const String keyIdPatient = keyFieldId;
const String keyNamePatient = 'name';
const String keyAddressPatient = 'address';
const String keyEmailPatient = 'email';
const String keyPhonePatient = 'phone';
const String keyPhone2Patient = 'phone2';
const String keyAgePatient = 'age';
const String keyBirthDatePatient = 'birthDate';
const String keyNaturalnessPatient = 'naturalness';
const String keyMaritalStatusPatient = 'maritalStatus';
const String keyEducationLevelPatient = 'educationLevel';
const String keyHowDidYouFindOutPatient = 'howDidYouFindOut';
const String keyNameFatherPatient = 'nameFather';
const String keyPhoneFatherPatient = 'phoneFather';
const String keyBirthDateFatherPatient = 'birthDateFather';
const String keyNameMotherPatient = 'nameMother';
const String keyPhoneMotherPatient = 'phoneMother';
const String keyBirthDateMotherPatient = 'birthDateMother';
const String keyNameResponsiblePatient = 'nameResponsible';
const String keyPhoneResponsiblePatient = 'phoneResponsible';
const String keyBirthDateResponsiblePatient = 'birthDateResponsible';
const String keySummaryAddressPatient = 'summaryAddress';

/* ----- Endereço do Paciente ----- */
const String keyAddressTable = 'Address';
const String keyIdAddress = 'idAddress';
const String keyStreet = 'street';
const String keyNumber = 'number';
const String keyDistrict = 'district';
const String keyPostalCode = 'postalCode';
const String keyCity = 'city';
const String keyUF = 'uf';
const String keyComplement = 'complement';

/* ----- Agenda ----- */
const String keySchedulingTable = 'Scheduling';
const String keyIdScheduling = keyFieldId;
const String keyScreeningDateScheduling = 'screeningDate';
const String keyScreeningHourScheduling = 'screeningHour';
//const String keyScreeningTimeScheduling = 'screeningTime';
const String keySupervisorScheduling = 'supervisor';
const String keyTraineeScheduling = 'trainee';
const String keyPatientScheduling = 'patient';
const String keyAttendanceScheduling = 'attendance';
const String keyOpenMedicalRecordScheduling = 'openMedicalRecord';

/* ----- Comparecimento do Paciente ----- */
const String keyPatientAttendanceTable = 'PatientAttendance';
const String keyIdPatientAttendance = keyFieldId;
const String keySchedulePatientAttendance = 'screeningDate';
const String keyDescriptionPatientAttendance = 'supervisor';

/* ----- Prontuário ----- */
const String keyMedicalRecordTable = 'MedicalRecord';
const String keyIdMedicalRecord = keyFieldId;
const String keyDemandMedicalRecord = 'demand';
const String keyNumberMedicalRecord = 'number';
const String keyStatusMedicalRecord = 'status';
const String keyPatientMedicalRecord = 'patient';
//Triagem
const String keyScreeningDateMedicalRecord = 'screeningDate';
const String keyScreeningHourMedicalRecord = 'screeningHour';
const String keyTraineeMedicalRecord = 'trainee';
const String keySupervisorMedicalRecord = 'supervisor';
//Início de atendimento
const String keyStartDateMedicalRecord = 'startDate';
const String keyStartHourMedicalRecord = 'startHour';
const String keyTraineeStartMedicalRecord = 'traineeStart';
const String keySupervisorStartMedicalRecord = 'supervisorStart';
//Término do atendimento
const String keyEndDateMedicalRecord = 'endDate';
const String keyEndHourMedicalRecord = 'endHour';
const String keyTraineeEndMedicalRecord = 'traineeEnd';
const String keySupervisorEndMedicalRecord = 'supervisorEnd';
const String keySchedulingMedicalRecord = 'scheduling';
const String keyIdSchedulingMedicalRecord = 'idScheduling';
