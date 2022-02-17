import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spa/stores/login_store.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    LoginStore _loginStore = LoginStore();
    final TextEditingController _username =
        TextEditingController(text: _loginStore.username);
    final TextEditingController _password =
        TextEditingController(text: _loginStore.password);
    return Form(
      child: Column(children: [
        Observer(builder: (_) {
          return TextFormField(
            controller: _username,
            enabled: !_loginStore.loading,
            decoration: InputDecoration(
              focusedBorder: themeData.inputDecorationTheme.focusedBorder,
              disabledBorder: themeData.inputDecorationTheme.border,
              labelText: 'Usuário',
              labelStyle: themeData.inputDecorationTheme.labelStyle,
              enabledBorder: themeData.inputDecorationTheme.enabledBorder,
            ),
            onChanged: _loginStore.setUsername,
          );
        }),
        const SizedBox(height: 30),
        Observer(builder: (_) {
          return TextFormField(
            controller: _password,
            enabled: !_loginStore.loading,
            decoration: InputDecoration(
              focusedBorder: themeData.inputDecorationTheme.focusedBorder,
              disabledBorder: themeData.inputDecorationTheme.border,
              labelText: 'Senha',
              labelStyle: themeData.inputDecorationTheme.labelStyle,
              enabledBorder: themeData.inputDecorationTheme.enabledBorder,
            ),
            onChanged: _loginStore.setPassword,
          );
        })
      ]),
    );
  }
}
