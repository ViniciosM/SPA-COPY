import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';
import 'package:spa/models/user.dart';

class UserRepository {
  Future<User?> loginWithUsername(String username, String password) async {
    final parseUser = ParseUser(username, password, username);

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error('Erro ao realizar login');
    }
  }

  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response!.success) {
        return mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  Future<void> logout() async {
    final ParseUser currentUser = await ParseUser.currentUser();
    await currentUser.logout();
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      username: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

  Future<void> recoverPassword(String email) async {
    final ParseUser user = ParseUser(email.toLowerCase(), '', email);
    final ParseResponse parseResponse = await user.requestPasswordReset();
    if (!parseResponse.success) {
      return Future.error('Não foi possível recuperar a senha');
    }
  }
}
