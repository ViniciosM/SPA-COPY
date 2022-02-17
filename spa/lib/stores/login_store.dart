import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:spa/repositories/user_repository.dart';
import 'package:spa/stores/user_manager_store.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    autorun((_) async {
      loading = true;
      error = '';
      try {
        UserManagerStore userManagerStore = UserManagerStore();
        if (userManagerStore.isLoggedIn) {
          userIsLoggedIn = true;
        }
      } catch (e) {
        error = e.toString();
      }
      loading = false;
    });
  }
  @observable
  String? username;

  @observable
  String? password;

  @observable
  String? error;

  @observable
  bool loading = false;

  @observable
  bool obscurePassword = true;

  @observable
  bool userIsLoggedIn = false;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setError(String value) => error = value;

  @action
  void setErrorUsername(String value) => username = value;

  @action
  void setErrorPassword(String value) => password = value;

  @action
  void setLoading() => loading = !loading;

  @action
  void setObscurePassword() => obscurePassword = !obscurePassword;

  @computed
  bool get usernameValid => username != null && username!.length >= 3;
  String? get usernameError =>
      username == null || usernameValid ? null : 'Nome de usuário inválido';

  @computed
  bool get passwordValid => password != null && password!.length >= 4;
  String? get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida';

  @action
  bool validLogin() => usernameValid && passwordValid && loading == false;

  @computed
  Function get loginPressed => login;

  @action
  Future<void> login() async {
    loading = true;
    error = '';

    try {
      UserRepository userRepository = UserRepository();
      if (username != null && password != null) {
        final user =
            await userRepository.loginWithUsername(username!, password!);
        if (user != null) {
          GetIt.I<UserManagerStore>().setUser(user);
          userIsLoggedIn = true;
        }
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
