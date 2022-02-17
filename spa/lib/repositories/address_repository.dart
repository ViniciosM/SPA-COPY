import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/address.dart';
import 'package:spa/models/coordinator.dart';
import 'package:spa/models/patient.dart';
import 'package:spa/repositories/parse_errors.dart';

class AddressRepository {
  Future<void> create(Address address) async {
    try {
      final addressObject = ParseObject(keyAddressTable);

      //coordinatorObject.set(keyIdCoordinator, coordinator.idCoordinator);
      addressObject.set<String>(keyStreet, address.street ?? '');
      addressObject.set<String>(keyDistrict, address.district ?? '');
      addressObject.set<String>(keyPostalCode, address.postalCode ?? '');
      addressObject.set<String>(keyNumber, address.number ?? '0');
      addressObject.set<String>(keyCity, address.city ?? '');
      addressObject.set<String>(keyUF, address.uf ?? '');

      final response = await addressObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar coordenador');
    }
  }

  Future<List<Address>> read() async {
    //final currentUser = ParseUser('', '', '')..set(keyUserId, user.id);
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyAddressTable));

    //queryBuilder.setLimit(100);
    //queryBuilder.orderByDescending(keyCreatedAt);
    //queryBuilder.whereEqualTo(keyAdOwner, currentUser.toPointer());
    //queryBuilder.includeObject([keyAdCategory, keyAdOwner]);

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Address.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> delete(Address address) async {
    final parseObject = ParseObject(keyAddressTable)
      ..set(keyIdAddress, address.idAddress);

    final response = await parseObject.save();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
