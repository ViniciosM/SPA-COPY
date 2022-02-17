import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/address.dart';
import 'package:spa/models/patient.dart';
import 'package:spa/repositories/parse_errors.dart';

class PatientRepository {
  Future<void> create(Patient patient) async {
    try {
      //Address addressEmpty = Address(street: '-', district: '-', number: '0', city: '-', uf: '-', complement: '-', postalCode: '-');
      var addressPatient;
      if(patient.address != null){
         addressPatient = ParseObject('Address')
        ..set(keyStreet, patient.address!.street)
        ..set(keyNumber, patient.address!.number)
        ..set(keyDistrict, patient.address!.district)
        ..set(keyCity, patient.address!.city)
        ..set(keyPostalCode, patient.address!.postalCode)
        ..set(keyUF, patient.address!.uf)
        ..set(keyComplement, patient.address!.complement);

      await addressPatient.save();
      }else { 
         addressPatient = ParseObject('Address')
        ..set(keyStreet, '---')
        ..set(keyNumber, '000')
        ..set(keyDistrict, '---')
        ..set(keyCity, '---')
        ..set(keyPostalCode, '---')
        ..set(keyUF, '---')
        ..set(keyComplement, '---');

        await addressPatient.save();
      }
     

      final patientObject = ParseObject(keyPatientTable);
      //adObject.set(keyIdTrainee, Trainee.idTrainee);
      //traineeObject.set<String>(keyIdTrainee, trainee.idTrainee ?? '');

      //patientObject.set<String>(keyIdPatient, patient.idPatient ?? '');

      patientObject.set<String>(keyNamePatient, patient.name ?? '');

      patientObject.set<String>(keyEmailPatient, patient.email ?? '');

      patientObject.set<String>(keyPhonePatient, patient.phone ?? '');

      patientObject.set<ParseObject>(keyAddressPatient,
          ParseObject('Address')..objectId = addressPatient.objectId ?? '');

      patientObject.set<DateTime>(
          keyBirthDatePatient, patient.birthDate ?? DateTime.now());

      patientObject.set<int>(keyAgePatient, patient.age ?? 0);

      patientObject.set<String>(
          keyNaturalnessPatient, patient.naturalness ?? '');

      patientObject.set<String>(
          keySummaryAddressPatient, patient.summaryAddress ?? '');

      patientObject.set<String>(
          keyMaritalStatusPatient, patient.maritalStatus ?? '');

      patientObject.set<String>(
          keyEducationLevelPatient, patient.educationLevel ?? '');

      patientObject.set<String>(
          keyHowDidYouFindOutPatient, patient.howDidYouFindOut ?? '');

      patientObject.set<String>(
          keyNameResponsiblePatient, patient.nameResponsible ?? '');

      patientObject.set<String>(
          keyPhoneResponsiblePatient, patient.phoneResponsible ?? '');

      patientObject.set<String>(keyPhone2Patient, patient.phone2 ?? '');

      final response = await patientObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar paciente');
    }
  }

  Future<List<Patient>> read(String search, String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyPatientTable));

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyNamePatient, search, caseSensitive: false);
    }

    if (orderBy == 'Mais recente') {
      queryBuilder.orderByDescending(keyCreatedAt);
    } else if (orderBy == 'Ordem alfabética') {
      queryBuilder.orderByAscending(keyNamePatient);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Patient.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(Patient patient) async {

    try {

      var patientObject = ParseObject(keyPatientTable)
        ..objectId = patient.idPatient
        ..set(keyNamePatient, patient.name ?? '')
        ..set(keyEmailPatient, patient.email ?? '')
        ..set(keyPhonePatient, patient.phone ?? '')
        ..set(keySummaryAddressPatient, patient.summaryAddress ?? '')
        ..set(keyNaturalnessPatient, patient.naturalness ?? '')
        ..set(keyEducationLevelPatient, patient.educationLevel ?? '')
        ..set(keyMaritalStatusPatient, patient.maritalStatus ?? '')
        ..set(keyHowDidYouFindOutPatient, patient.howDidYouFindOut ?? '')
        ..set(keyNameResponsiblePatient, patient.nameResponsible ?? '')
        ..set(keyPhoneResponsiblePatient, patient.phoneResponsible ?? '')
        ..set(keyPhone2Patient, patient.phone2 ?? '')
        ..set(keyBirthDatePatient, patient.birthDate ?? '');

      final response = await patientObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar paciente');
    }
  }

  Future<void> delete(String idPatient) async {
    final parseObject = ParseObject(keyPatientTable)..objectId = idPatient;

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
