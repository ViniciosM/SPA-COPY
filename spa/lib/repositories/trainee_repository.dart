import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/trainee.dart';
import 'package:spa/repositories/parse_errors.dart';

class TraineeRepository {
  Future<void> create(Trainee trainee) async {
    try {
      final traineeObject = ParseObject(keyTraineeTable);

      //adObject.set(keyIdTrainee, Trainee.idTrainee);
      //traineeObject.set<String>(keyIdTrainee, trainee.idTrainee ?? '');
      traineeObject.set<String>(keyRoleTrainee, trainee.role ?? '');
      traineeObject.set<String>(keyNameTrainee, trainee.name ?? '');
      traineeObject.set<String>(
          keyRegistrationTrainee, trainee.registration ?? '');
      traineeObject.set<Object>(
          keyTraineeCoordinator, trainee.coordinator ?? '');
      traineeObject.set<Object>(keyTraineeSupervisor, trainee.supervisor ?? '');
      traineeObject.set<Object>(keyNameTraineeArea, trainee.traineeArea ?? '');
      traineeObject.set(keySemesterTrainee, trainee.semester);
      traineeObject.set<String>(keyEmailTrainee, trainee.email ?? '');
      traineeObject.set<String>(keyPhoneTrainee, trainee.phone ?? '');
      traineeObject.set<String>(keyRoleTrainee, trainee.role ?? '');

      final response = await traineeObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar estagiário');
    }
  }

  Future<List<Trainee>> read(String search, String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyTraineeTable));

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyNameTrainee, search, caseSensitive: false);
    }

    if (orderBy == 'Mais recente') {
      queryBuilder.orderByDescending(keyCreatedAt);
    } else if (orderBy == 'Ordem alfabética') {
      queryBuilder.orderByAscending(keyNameTrainee);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Trainee.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(Trainee trainee) async {
    try {
      var traineeObject = ParseObject(keyTraineeTable)
        ..objectId = trainee.idTrainee
        ..set(keyNameTrainee, trainee.name ?? '')
        ..set(keyEmailTrainee, trainee.email ?? '')
        ..set(keyPhoneTrainee, trainee.phone ?? '')
        ..set(keyRegistrationTrainee, trainee.registration ?? '')
        ..set(keyTraineeSupervisor, trainee.supervisor ?? '')
        ..set(keySemesterTrainee, trainee.semester ?? '')
        ..set(keyTraineeCoordinator, trainee.coordinator ?? '')
        ..set(keyNameTraineeArea, trainee.traineeArea ?? '')
        ..set(keyRoleTrainee, trainee.role ?? '');

      final response = await traineeObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar estagiário');
    }
  }

  Future<void> delete(String id) async {
    final parseObject = ParseObject(keyTraineeTable)..objectId = id;

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
