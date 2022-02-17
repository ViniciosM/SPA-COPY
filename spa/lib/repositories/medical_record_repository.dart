import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/medical_record.dart';
import 'package:spa/repositories/parse_errors.dart';

class MedicalRecordRepository {
  Future<void> create(MedicalRecord medicalRecord) async {
    try {
      final medicalRecordObject = ParseObject(keyMedicalRecordTable);

      final schedulingObject = ParseObject(keySchedulingTable)
        ..objectId = medicalRecord.idScheduling
        ..set(keyOpenMedicalRecordScheduling, true);

      schedulingObject.save();

      /*
      var schedulingObject = ParseObject(keySchedulingTable)
        ..objectId = medicalRecord.idScheduling
        ..set(keyOpenMedicalRecordScheduling, true);

      schedulingObject.save();
      var schedulingMedicalRecord = ParseObject('Scheduling')
        ..objectId = scheduling.idScheduling;

      medicalRecordObject.set(
          keySchedulingMedicalRecord,
          (ParseObject('Scheduling')
            ..objectId = schedulingMedicalRecord.objectId!));
      */
      //adObject.set(keyIdTrainee, Trainee.idTrainee);
      //medicalRecordObject.set<String>(keyIdTrainee, medicalRecord.idMedicalRecord ?? '');

      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyMedicalRecordTable));
      int? countMedicalRecord;
      int? numberMR;
      var apiResponse = await queryBuilder.count();

      if (apiResponse.success && apiResponse.result != null) {
        countMedicalRecord = apiResponse.count;
        numberMR = countMedicalRecord + 1;
      }

      medicalRecordObject.set<int>(keyNumberMedicalRecord, numberMR ?? 0);

      medicalRecordObject.set<String>(
          keyDemandMedicalRecord, medicalRecord.demand ?? '');
      medicalRecordObject.set<String>(
          keyStatusMedicalRecord, medicalRecord.status ?? '');
      medicalRecordObject.set<String>(
          keyPatientMedicalRecord, medicalRecord.patient ?? '');

      medicalRecordObject.set<DateTime>(keyScreeningDateMedicalRecord,
          medicalRecord.screeningDate ?? DateTime.now());
      medicalRecordObject.set<String>(keyScreeningHourMedicalRecord,
          medicalRecord.screeningHour ?? '00:00');
      medicalRecordObject.set<String>(
          keyTraineeMedicalRecord, medicalRecord.trainee ?? '');
      medicalRecordObject.set<String>(
          keySupervisorMedicalRecord, medicalRecord.supervisor ?? '');

      medicalRecordObject.set<DateTime>(
          keyStartDateMedicalRecord, medicalRecord.startDate ?? DateTime.now());
      medicalRecordObject.set<String>(
          keyStartHourMedicalRecord, medicalRecord.startHour ?? '00:00');

      medicalRecordObject.set<String>(
          keyTraineeStartMedicalRecord, medicalRecord.traineeStart ?? '');
      medicalRecordObject.set<String>(
          keySupervisorStartMedicalRecord, medicalRecord.supervisorStart ?? '');

      medicalRecordObject.set<DateTime>(
          keyEndDateMedicalRecord, medicalRecord.endDate ?? DateTime.now());

      medicalRecordObject.set<String>(
          keyEndHourMedicalRecord, medicalRecord.endHour ?? '00:00');
      medicalRecordObject.set<String>(
          keyTraineeEndMedicalRecord, medicalRecord.traineeEnd ?? '');
      medicalRecordObject.set<String>(
          keySupervisorEndMedicalRecord, medicalRecord.supervisorEnd ?? '');

      medicalRecordObject.set<String>(
          keyIdSchedulingMedicalRecord, medicalRecord.idScheduling ?? '');

      final response = await medicalRecordObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar prontuário');
    }
  }

  Future<List<MedicalRecord>> read(String search, String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyMedicalRecordTable));

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyPatientMedicalRecord, search,
          caseSensitive: false);
    }

    if (orderBy == 'Em atendimento' ||
        orderBy == 'Aguardando psicoterapia' ||
        orderBy == 'Desligado') {
      queryBuilder.whereEqualTo(keyStatusMedicalRecord, orderBy);
    } else if (orderBy == 'Urgência' ||
        orderBy == 'Curto prazo' ||
        orderBy == 'Lista de espera') {
      queryBuilder.whereEqualTo(keyDemandMedicalRecord, orderBy);
    } else if (orderBy == 'Todos os prontuários') {
      queryBuilder.orderByAscending(keyScreeningDateMedicalRecord);
    } else {
      queryBuilder.orderByAscending(keyScreeningDateMedicalRecord);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!
          .map((po) => MedicalRecord.fromParse(po))
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<List<MedicalRecord>> readStartPage(String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyMedicalRecordTable));

    queryBuilder.whereLessThanOrEqualTo(
        keyScreeningDateMedicalRecord, DateTime.now());

    if (orderBy == 'Em atendimento' || orderBy == 'Aguardando psicoterapia') {
      queryBuilder.whereEqualTo(keyStatusMedicalRecord, orderBy);
    } else if (orderBy == 'Urgência' ||
        orderBy == 'Curto prazo' ||
        orderBy == 'Lista de espera') {
      queryBuilder.whereEqualTo(keyDemandMedicalRecord, orderBy);
    } else if (orderBy == 'Todos os prontuários') {
      queryBuilder.orderByAscending(keyScreeningDateMedicalRecord);
    } else {
      queryBuilder.orderByAscending(keyScreeningDateMedicalRecord);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!
          .map((po) => MedicalRecord.fromParse(po))
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(MedicalRecord medicalRecord) async {
    try {
      final schedulingObject = ParseObject(keySchedulingTable)
        ..objectId = medicalRecord.idScheduling
        ..set(keyOpenMedicalRecordScheduling, true);

      schedulingObject.save();

      final medicalRecordObject = ParseObject(keyMedicalRecordTable)
        ..objectId = medicalRecord.idMedicalRecord
        ..set(keyDemandMedicalRecord, medicalRecord.demand ?? '')
        ..set(keyStatusMedicalRecord, medicalRecord.status ?? '')
        ..set(keyPatientMedicalRecord, medicalRecord.patient ?? '')
        ..set(keyScreeningDateMedicalRecord,
            medicalRecord.screeningDate ?? DateTime.now())
        ..set(keyScreeningHourMedicalRecord,
            medicalRecord.screeningHour ?? '00:00')
        ..set(keyTraineeMedicalRecord, medicalRecord.trainee ?? '')
        ..set(keySupervisorMedicalRecord, medicalRecord.supervisor ?? '')
        ..set(keyStartDateMedicalRecord,
            medicalRecord.startDate ?? DateTime.now())
        ..set(keyStartHourMedicalRecord, medicalRecord.startHour ?? '00:00')
        ..set(keyTraineeStartMedicalRecord, medicalRecord.traineeStart ?? '')
        ..set(keySupervisorStartMedicalRecord,
            medicalRecord.supervisorStart ?? '')
        ..set(keyEndDateMedicalRecord, medicalRecord.endDate ?? DateTime.now())
        ..set(keyEndHourMedicalRecord, medicalRecord.endHour ?? '00:00')
        ..set(keyTraineeEndMedicalRecord, medicalRecord.traineeEnd ?? '')
        ..set(keySupervisorEndMedicalRecord, medicalRecord.supervisorEnd ?? '')
        ..set(keyIdSchedulingMedicalRecord, medicalRecord.idScheduling ?? '');

      final response = await medicalRecordObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar prontuário');
    }
  }

  Future<void> delete(String id) async {
    final parseObject = ParseObject(keyMedicalRecordTable)..objectId = id;

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
