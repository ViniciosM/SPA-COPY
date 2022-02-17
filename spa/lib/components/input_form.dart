import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.text,
    required this.onChange,
    required this.error,
    required this.formatInput,
    required this.enabled,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Function(String) onChange;
  final String error;
  final List<TextInputFormatter> formatInput;
  final bool enabled;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return TextFormField(
      decoration: InputDecoration(
        errorText: error,
        labelText: text,
        focusedBorder: themeData.inputDecorationTheme.focusedBorder,
        disabledBorder: themeData.inputDecorationTheme.border,
        labelStyle: themeData.inputDecorationTheme.labelStyle,
        enabledBorder: themeData.inputDecorationTheme.enabledBorder,
      ),
      onChanged: onChange,
      inputFormatters: formatInput,
      enabled: enabled,
      onTap: onTap,
    );
  }
}

class FormDropDown extends StatelessWidget {
  const FormDropDown(
      {Key? key,
      required this.text,
      required this.itemsList,
      required this.onChange})
      : super(key: key);
  final Widget text;
  final Function(String?) onChange;
  final List<DropdownMenuItem<String>> itemsList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: DropdownButton<String>(
        isExpanded: true,
        hint: text,
        items: itemsList,
        onChanged: onChange,
      ),
    );
  }
}

class ButtonForm extends StatelessWidget {
  const ButtonForm({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);
  final VoidCallback? onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xFF029F8C),
        ),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
