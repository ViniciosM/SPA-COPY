import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/supervisor.dart';
import 'package:spa/repositories/parse_errors.dart';

class SupervisorRepository {
  Future<void> create(Supervisor supervisor) async {
    try {
      final supervisorObject = ParseObject(keySupervisorTable);

      //supervisorObject.set(keyIdSupervisor, Supervisor.idSupervisor);
      supervisorObject.set<String>(
          keyCrpSupervisor, supervisor.crpSupervisor ?? '');
      supervisorObject.set<String>(keyNameSupervisor, supervisor.name ?? '');
      supervisorObject.set<String>(keyEmailSupervisor, supervisor.email ?? '');
      supervisorObject.set<String>(keyPhoneSupervisor, supervisor.phone ?? '');

      final response = await supervisorObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar supervisor');
    }
  }

  Future<List<Supervisor>> read(String search, String orderBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keySupervisorTable));

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyNameSupervisor, search,
          caseSensitive: false);
    }

    if (orderBy == 'Mais recente') {
      queryBuilder.orderByAscending(keyCreatedAt);
    } else if (orderBy == 'Ordem alfabética') {
      queryBuilder.orderByAscending(keyNameSupervisor);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Supervisor.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(Supervisor supervisor) async {
    try {
      var supervisorObject = ParseObject(keySupervisorTable)
        ..objectId = supervisor.idSupervisor
        ..set(keyCrpSupervisor, supervisor.crpSupervisor)
        ..set(keyNameSupervisor, supervisor.name)
        ..set(keyEmailSupervisor, supervisor.email)
        ..set(keyPhoneSupervisor, supervisor.phone);

      final response = await supervisorObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar supervisor');
    }
  }

  Future<void> delete(String id) async {
    final parseObject = ParseObject(keySupervisorTable)..objectId = id;
    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
