import 'dart:ui';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/repositories/parse_errors.dart';

class SchedulingRepository {
  Future<List<Scheduling>> getSchedulingList() async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keySchedulingTable));
      //queryBuilder.orderByAscending(keyScreeningDateScheduling);
      //queryBuilder.setLimit(3);
      final response = await queryBuilder.query();
      if (response.success && response.results != null) {
        return response.results!.map((po) => Scheduling.fromParse(po)).toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha na conexão');
    }
  }

  Future<List<Scheduling>> getSchedulings() async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject('Schedulings'));
      //queryBuilder.orderByAscending(keyScreeningDateScheduling);
      //queryBuilder.setLimit(3);
      final apiResponse = await queryBuilder.query();

      if (apiResponse.success && apiResponse.results != null) {
        return apiResponse.results as List<Scheduling>;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error('Falha na conexão');
    }
  }

  Future<void> create(Scheduling scheduling) async {
    try {
      final schedulingObject = ParseObject(keySchedulingTable);

      //adObject.set(keyIdTrainee, Trainee.idTrainee);
      //schedulingObject.set<String>(keyIdScheduling, scheduling.idScheduling ?? '');

      schedulingObject.set<DateTime>(keyScreeningDateScheduling,
          scheduling.screeningDate ?? DateTime.now());
      schedulingObject.set<String>(
          keyScreeningHourScheduling, scheduling.screeningHour ?? '00:00');
      schedulingObject.set<String>(
          keySupervisorScheduling, scheduling.supervisor ?? '');
      schedulingObject.set<String>(
          keyTraineeScheduling, scheduling.trainee ?? '');
      schedulingObject.set<String>(
          keyPatientScheduling, scheduling.patient ?? '');
      schedulingObject.set<bool>(keyAttendanceScheduling, false);

      schedulingObject.set<bool>(keyOpenMedicalRecordScheduling, false);

      final response = await schedulingObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar agendamento');
    }
  }

  Future<List<Scheduling>> read(String search, String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keySchedulingTable));

    //queryBuilder.whereGreaterThanOrEqualsTo(keyScreeningDateScheduling, DateTime.now());

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyPatientScheduling, search,
          caseSensitive: false);
    }

    switch (orderBy) {
      case 'Ordem alfabética':
        queryBuilder.orderByAscending(keyPatientScheduling);
        break;
      case 'Todos os prontuários':
        queryBuilder.orderByDescending(keyCreatedAt);
        break;
      case 'Compareceu':
        queryBuilder.whereEqualTo(keyAttendanceScheduling, true);
        break;
      case 'Não compareceu':
        queryBuilder.whereEqualTo(keyAttendanceScheduling, false);
        break;
      case 'Prontuário aberto':
        queryBuilder.whereEqualTo(keyOpenMedicalRecordScheduling, true);
        break;
      case 'Prontuário não aberto':
        queryBuilder.whereEqualTo(keyOpenMedicalRecordScheduling, false);
        break;
      default:
        queryBuilder.orderByDescending(keyCreatedAt);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Scheduling.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<List<Scheduling>> readSchedulingsToOpen(
      String search, String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keySchedulingTable));

    queryBuilder.whereEqualTo(keyAttendanceScheduling, true);
    queryBuilder.whereEqualTo(keyOpenMedicalRecordScheduling, false);

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyPatientScheduling, search,
          caseSensitive: false);
    }

    if (orderBy == 'Mais recente') {
      queryBuilder.orderByDescending(keyCreatedAt);
    } else if (orderBy == 'Ordem alfabética') {
      queryBuilder.orderByAscending(keyPatientScheduling);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Scheduling.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<List<Scheduling>> readWithFilter(DateTime selectedDate) async {
    //String formattedSelectedDate ='${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';

    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keySchedulingTable));

    queryBuilder.orderByAscending(keyScreeningDateScheduling);
    queryBuilder.whereGreaterThanOrEqualsTo(
        keyScreeningDateScheduling, selectedDate);

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Scheduling.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> updateOpenMedicalRecord(String idScheduling) async {
    try {
      final schedulingObject = ParseObject(keySchedulingTable)
        ..objectId = idScheduling
        ..set(keyOpenMedicalRecordScheduling, true);

      final response = await schedulingObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar agendamento');
    }
  }

  Future<void> update(Scheduling scheduling) async {
    try {
      var schedulingObject = ParseObject(keySchedulingTable)
        ..objectId = scheduling.idScheduling
        ..set(keyScreeningDateScheduling, scheduling.screeningDate)
        ..set(keyScreeningHourScheduling, scheduling.screeningHour)
        ..set(keyTraineeScheduling, scheduling.trainee)
        ..set(keySupervisorScheduling, scheduling.supervisor)
        ..set(keyPatientScheduling, scheduling.patient);

      final response = await schedulingObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar supervisor');
    }
  }

  Future<void> updateAttendance(Scheduling scheduling, bool value) async {
    try {
      final schedulingObject = ParseObject(keySchedulingTable)
        ..objectId = scheduling.idScheduling
        ..set(keyAttendanceScheduling, value);

      final response = await schedulingObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar atendimento');
    }
  }

  QueryBuilder<ParseObject> querySchedulings() {
    final QueryBuilder<ParseObject> querySchedulings =
        QueryBuilder<ParseObject>(ParseObject('Scheduling'))
          ..orderByAscending('createdAt');
    return querySchedulings;
  }

  Future<void> delete(String id) async {
    final parseObject = ParseObject(keySchedulingTable)..objectId = id;

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
