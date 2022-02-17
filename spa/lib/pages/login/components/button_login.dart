import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spa/stores/login_store.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    LoginStore _loginStore = LoginStore();
    return Observer(builder: (_) {
      return TextButton(
        onPressed: _loginStore.login,
        style: themeData.textButtonTheme.style,
        child: Container(
          width: MediaQuery.of(context).size.height,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: themeData.textTheme.button,
          ),
        ),
      );
    });
  }
}
