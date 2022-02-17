import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/stores/coordinator_store.dart';

class CoordinatorForm extends StatelessWidget {
  const CoordinatorForm({Key? key, this.update}) : super(key: key);
  final bool? update;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CoordinatorStore _coordinatorStore = GetIt.I<CoordinatorStore>();
    return Column(
      children: [
        SizedBox(height: height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Column(
                children: [
                  Observer(builder: (_) {
                    return TextFormField(
                      controller: _coordinatorStore.nameController,
                      enabled: !_coordinatorStore.loading,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        errorText: _coordinatorStore.nameError,
                        focusedBorder:
                            themeData.inputDecorationTheme.focusedBorder,
                        disabledBorder: themeData.inputDecorationTheme.border,
                        labelText: 'Nome',
                        labelStyle: themeData.inputDecorationTheme.labelStyle,
                        enabledBorder:
                            themeData.inputDecorationTheme.enabledBorder,
                      ),
                      onChanged: _coordinatorStore.setName,
                    );
                  }),
                  SizedBox(height: height * 0.05),
                  Observer(builder: (_) {
                    return TextFormField(
                      controller: _coordinatorStore.emailController,
                      enabled: !_coordinatorStore.loading,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        errorText: _coordinatorStore.emailError,
                        focusedBorder:
                            themeData.inputDecorationTheme.focusedBorder,
                        disabledBorder: themeData.inputDecorationTheme.border,
                        labelText: 'Email',
                        labelStyle: themeData.inputDecorationTheme.labelStyle,
                        enabledBorder:
                            themeData.inputDecorationTheme.enabledBorder,
                      ),
                      onChanged: _coordinatorStore.setEmail,
                    );
                  }),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 1.8,
              padding: EdgeInsets.only(left: width * 0.05),
              child: Column(
                children: [
                  Observer(builder: (_) {
                    return TextFormField(
                      controller: _coordinatorStore.crpController,
                      enabled: !_coordinatorStore.loading,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: _coordinatorStore.crpError,
                        focusedBorder:
                            themeData.inputDecorationTheme.focusedBorder,
                        disabledBorder: themeData.inputDecorationTheme.border,
                        labelText: 'CRP',
                        labelStyle: themeData.inputDecorationTheme.labelStyle,
                        enabledBorder:
                            themeData.inputDecorationTheme.enabledBorder,
                      ),
                      onChanged: _coordinatorStore.setCrp,
                    );
                  }),
                  SizedBox(height: height * 0.05),
                  Observer(builder: (_) {
                    return TextFormField(
                      controller: _coordinatorStore.phoneController,
                      enabled: !_coordinatorStore.loading,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        errorText: _coordinatorStore.phoneError,
                        focusedBorder:
                            themeData.inputDecorationTheme.focusedBorder,
                        disabledBorder: themeData.inputDecorationTheme.border,
                        labelText: 'Telefone',
                        labelStyle: themeData.inputDecorationTheme.labelStyle,
                        enabledBorder:
                            themeData.inputDecorationTheme.enabledBorder,
                      ),
                      inputFormatters: [
                        // obrigatório
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      onChanged: _coordinatorStore.setPhone,
                    );
                  }),
                  SizedBox(height: height * 0.1),
                  Observer(
                    builder: (_) {
                      if (update == false || update == null) {
                        return TextButton(
                          onPressed: _coordinatorStore.validForm &&
                                  _coordinatorStore.loading == false
                              ? _coordinatorStore.savePressed
                              : null,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFF029F8C),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.height,
                            height: 50,
                            alignment: Alignment.center,
                            child: _coordinatorStore.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Salvar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        );
                      } else {
                        return TextButton(
                          onPressed: _coordinatorStore.loading == false
                              ? _coordinatorStore.updatePressed
                              : null,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFF029F8C),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.height,
                            height: 50,
                            alignment: Alignment.center,
                            child: _coordinatorStore.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Atualizar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  if (update == true)
                    Observer(builder: (_) {
                      return TextButton(
                        onPressed: () {
                          _coordinatorStore.clearFields();
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color(0xFF029F8C).withOpacity(0.8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.height,
                          height: 50,
                          alignment: Alignment.center,
                          child: _coordinatorStore.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Fechar',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      );
                    }),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
