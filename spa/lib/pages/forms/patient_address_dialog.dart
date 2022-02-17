import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/input_form.dart';
import 'package:spa/models/address.dart';
import 'package:spa/stores/address_store.dart';
import 'package:spa/theme/app_theme.dart';

Future<dynamic> showDialogWidget(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        ThemeData themeData = Theme.of(context);
        AddressStore _addressStore = GetIt.I<AddressStore>();

        return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dados de Endereço", style: themeData.textTheme.subtitle1),
                Text("campos obrigatórios *",
                    style: themeData.textTheme.subtitle2),
              ],
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(children: [
                    Observer(builder: (_) {
                      return TextFormField(
                        controller: _addressStore.streetController,
                        //enabled: !_addressStore.loading,

                        decoration: InputDecoration(
                          errorText: _addressStore.streetError,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          disabledBorder: themeData.inputDecorationTheme.border,
                          labelText: 'Rua *',
                          labelStyle: themeData.inputDecorationTheme.labelStyle,
                          enabledBorder:
                              themeData.inputDecorationTheme.enabledBorder,
                        ),

                        onChanged: _addressStore.setStreet,
                      );
                    }),
                    const SizedBox(height: 30),
                    Observer(builder: (_) {
                      return TextFormField(
                        controller: _addressStore.numberController,
                        decoration: InputDecoration(
                          errorText: _addressStore.numberError,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          disabledBorder: themeData.inputDecorationTheme.border,
                          labelText: 'N° *',
                          labelStyle: themeData.inputDecorationTheme.labelStyle,
                          enabledBorder:
                              themeData.inputDecorationTheme.enabledBorder,
                        ),
                        onChanged: _addressStore.setNumber,
                      );
                    }),
                    const SizedBox(height: 30),
                    Observer(builder: (_) {
                      return TextFormField(
                        controller: _addressStore.cityController,
                        decoration: InputDecoration(
                          errorText: _addressStore.cityError,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          disabledBorder: themeData.inputDecorationTheme.border,
                          labelText: 'Cidade *',
                          labelStyle: themeData.inputDecorationTheme.labelStyle,
                          enabledBorder:
                              themeData.inputDecorationTheme.enabledBorder,
                        ),
                        onChanged: _addressStore.setCity,
                      );
                    }),
                    const SizedBox(height: 30),
                    Observer(builder: (_) {
                      return TextFormField(
                        controller: _addressStore.complementController,
                        decoration: InputDecoration(
                          errorText: _addressStore.complementError,
                          focusedBorder:
                              themeData.inputDecorationTheme.focusedBorder,
                          disabledBorder: themeData.inputDecorationTheme.border,
                          labelText: 'Complemento',
                          labelStyle: themeData.inputDecorationTheme.labelStyle,
                          enabledBorder:
                              themeData.inputDecorationTheme.enabledBorder,
                        ),
                        onChanged: _addressStore.setComplement,
                      );
                    }),
                  ])),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(children: [
                      Observer(builder: (_) {
                        return TextFormField(
                          controller: _addressStore.districtController,
                          decoration: InputDecoration(
                            errorText: _addressStore.districtError,
                            focusedBorder:
                                themeData.inputDecorationTheme.focusedBorder,
                            disabledBorder:
                                themeData.inputDecorationTheme.border,
                            labelText: 'Bairro *',
                            labelStyle:
                                themeData.inputDecorationTheme.labelStyle,
                            enabledBorder:
                                themeData.inputDecorationTheme.enabledBorder,
                          ),
                          onChanged: _addressStore.setDistrict,
                        );
                      }),
                      const SizedBox(height: 30),
                      Observer(builder: (_) {
                        return TextFormField(
                          controller: _addressStore.postalCodeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            errorText: _addressStore.postalCodeError,
                            focusedBorder:
                                themeData.inputDecorationTheme.focusedBorder,
                            disabledBorder:
                                themeData.inputDecorationTheme.border,
                            labelText: 'CEP',
                            labelStyle:
                                themeData.inputDecorationTheme.labelStyle,
                            enabledBorder:
                                themeData.inputDecorationTheme.enabledBorder,
                          ),
                          inputFormatters: [
                            // obrigatório
                            FilteringTextInputFormatter.digitsOnly,
                            CepInputFormatter(),
                          ],
                          onChanged: _addressStore.setPostalCode,
                        );
                      }),
                      const SizedBox(height: 30),
                      Observer(builder: (_) {
                        return TextFormField(
                            controller: _addressStore.ufController,
                            decoration: InputDecoration(
                              errorText: _addressStore.ufError,
                              focusedBorder:
                                  themeData.inputDecorationTheme.focusedBorder,
                              disabledBorder:
                                  themeData.inputDecorationTheme.border,
                              labelText: 'UF *',
                              labelStyle:
                                  themeData.inputDecorationTheme.labelStyle,
                              enabledBorder:
                                  themeData.inputDecorationTheme.enabledBorder,
                            ),
                            onChanged: _addressStore.setUF);
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      ButtonForm(
                          onPress: () {
                            Address address = Address(
                                street: _addressStore.street,
                                number: _addressStore.number,
                                district: _addressStore.district,
                                postalCode: _addressStore.postalCode,
                                city: _addressStore.city,
                                uf: _addressStore.uf,
                                complement: _addressStore.complement);

                            Navigator.of(context).pop(address);
                          },
                          text: 'OK')
                    ]),
                  ),
                ],
              ),
            ));
      });
}
