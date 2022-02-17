import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/dialog_alert.dart';
import 'package:spa/pages/base/base_page.dart';
import 'package:spa/stores/login_store.dart';
import 'package:spa/theme/app_theme.dart' as appTheme;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    LoginStore _loginStore = GetIt.I<LoginStore>();
    final TextEditingController _username =
        TextEditingController(text: _loginStore.username);
    final TextEditingController _password =
        TextEditingController(text: _loginStore.password);
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 32,
              ),
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  Text(
                    "LOGIN",
                    style: themeData.textTheme.headline4,
                  ),
                  const Spacer(flex: 1),
                  //FormLogin(),
                  Form(
                    child: Column(children: [
                      Observer(builder: (_) {
                        return TextFormField(
                          controller: _username,
                          enabled: !_loginStore.loading,
                          decoration: InputDecoration(
                            errorText: _loginStore.usernameError,
                            focusedBorder:
                                themeData.inputDecorationTheme.focusedBorder,
                            disabledBorder:
                                themeData.inputDecorationTheme.border,
                            labelText: 'Usuário',
                            labelStyle:
                                themeData.inputDecorationTheme.labelStyle,
                            enabledBorder:
                                themeData.inputDecorationTheme.enabledBorder,
                          ),
                          onChanged: _loginStore.setUsername,
                        );
                      }),
                      const SizedBox(height: 30),
                      Observer(builder: (_) {
                        return TextFormField(
                          controller: _password,
                          obscureText: _loginStore.obscurePassword,
                          enabled: !_loginStore.loading,
                          decoration: InputDecoration(
                            errorText: _loginStore.passwordError,
                            suffix: _loginStore.obscurePassword
                                ? IconButton(
                                    icon: const Icon(
                                        Icons.visibility_off_outlined),
                                    onPressed: () {
                                      _loginStore.setObscurePassword();
                                    },
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.visibility_outlined),
                                    onPressed: () {
                                      _loginStore.setObscurePassword();
                                    },
                                  ),
                            focusedBorder:
                                themeData.inputDecorationTheme.focusedBorder,
                            disabledBorder:
                                themeData.inputDecorationTheme.border,
                            labelText: 'Senha',
                            labelStyle:
                                themeData.inputDecorationTheme.labelStyle,
                            enabledBorder:
                                themeData.inputDecorationTheme.enabledBorder,
                          ),
                          onChanged: _loginStore.setPassword,
                        );
                      })
                    ]),
                  ),
                  const Spacer(flex: 1),
                  //const ButtonLogin(text: 'Entrar',),
                  Observer(builder: (_) {
                    return TextButton(
                      onPressed: () {},
                      style: themeData.textButtonTheme.style,
                      child: Container(
                        width: MediaQuery.of(context).size.height,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Entrar',
                          style: themeData.textTheme.button,
                        ),
                      ),
                    );
                  }),
                  const Spacer(flex: 1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
