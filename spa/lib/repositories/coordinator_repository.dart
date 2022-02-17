import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/coordinator.dart';
import 'package:spa/repositories/parse_errors.dart';

class CoordinatorRepository {
  Future<void> create(Coordinator coordinator) async {
    try {
      final coordinatorObject = ParseObject(keyCoordinatorTable);

      //coordinatorObject.set(keyIdCoordinator, coordinator.idCoordinator);
      coordinatorObject.set<String>(
          keyCrpCoordinator, coordinator.crpCoordinator ?? '');
      coordinatorObject.set<String>(keyNameCoordinator, coordinator.name ?? '');
      coordinatorObject.set<String>(
          keyEmailCoordinator, coordinator.email ?? '');
      coordinatorObject.set<String>(
          keyPhoneCoordinator, coordinator.phone ?? '');

      final response = await coordinatorObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar coordenador');
    }
  }

  Future<List<Coordinator>> read(String search, String orderBy) async {
    //final currentUser = ParseUser('', '', '')..set(keyUserId, user.id);
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyCoordinatorTable));

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyNameCoordinator, search,
          caseSensitive: false);
    }

    if (orderBy == 'Mais recente') {
      queryBuilder.orderByDescending(keyCreatedAt);
    } else if (orderBy == 'Ordem alfabética') {
      queryBuilder.orderByAscending(keyNameCoordinator);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Coordinator.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(Coordinator coordinator) async {
    print('EDITAR --------- $coordinator ---------------------');
    try {
      var coordinatorObject = ParseObject(keyCoordinatorTable)
        ..objectId = coordinator.idCoordinator
        ..set(keyCrpCoordinator, coordinator.crpCoordinator)
        ..set(keyNameCoordinator, coordinator.name)
        ..set(keyEmailCoordinator, coordinator.email)
        ..set(keyPhoneCoordinator, coordinator.phone);

      final response = await coordinatorObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar coordenador');
    }
  }

  Future<List<Coordinator>> readNameCoordinator() async {
    //final currentUser = ParseUser('', '', '')..set(keyUserId, user.id);
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyCoordinatorTable));

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Coordinator.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> delete(String id) async {
    final parseObject = ParseObject(keyCoordinatorTable)..objectId = id;

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
