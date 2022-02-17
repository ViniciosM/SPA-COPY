import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/models/address.dart';
import 'package:spa/pages/forms/patient_address_dialog.dart';
import 'package:spa/responsive.dart';
import 'package:spa/stores/patient_store.dart';

class PatientForm extends StatelessWidget {
  const PatientForm({Key? key, this.update}) : super(key: key);

  final bool? update;

  @override
  Widget build(BuildContext context) {
    
    PatientStore _patientStore = GetIt.I<PatientStore>();
    
    Address? _address;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Wrap(
        children: [
          SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.22,
            child: Column(children: [
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.nameController,
                  decoration: InputDecoration(
                    errorText: _patientStore.nameError,
                    labelText: 'Nome do paciente *',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setName,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.addressController,
                  decoration: InputDecoration(
                    errorText: _patientStore.addressError,
                    labelText: 'Endereço *',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  onTap: () async {
                    try {
                      _address = await showDialogWidget(context);
                      if (_address != null) {
                        _patientStore.setAddress(_address!);
                        _patientStore.addressController.text =
                            '${_address!.street}, ${_address!.number} - ${_address!.district} ...';
                        _patientStore.setAddressFormatted(
                            '${_address!.street}, ${_address!.number} - ${_address!.district} ...');
                            _patientStore.setSummaryAddress('${_address!.street}, ${_address!.number}, ${_address!.district} - ${_address!.city}-${_address!.uf}');

                      }
                    } catch (e) {
                      Future.error(e);
                    }
                  },
                  onChanged: _patientStore.setAddressFormatted,
                );
              }),
              SizedBox(height: height * 0.03),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(_patientStore.educationLevel!),
                  items: educationLevel.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (el) {
                    _patientStore.setEducationLevel(el!);
                  },
                );
              }),
              SizedBox(height: height * 0.03),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.nameResponsibleController,
                  decoration: InputDecoration(
                    //errorText: error ?? '',
                    labelText: 'Nome do responsável',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setNameResponsible,
                );
              }),
              SizedBox(height: height * 0.05),
            ]),
          ),
          SizedBox(width: width * 0.05),
          SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.22,
            child: Column(children: [
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.emailController,
                  decoration: InputDecoration(
                    errorText: _patientStore.emailError,
                    labelText: 'Email *',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setEmail,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.naturalnessController,
                  decoration: InputDecoration(
                    //errorText: _patientStore.naturalnessError,
                    labelText: 'Naturalidade *',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setNaturalness,
                );
              }),
              SizedBox(height: height * 0.03),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(_patientStore.maritalStatus!),
                  items: maritalStatus.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (ms) {
                    _patientStore.setMaritalStatus(ms!);
                  },
                );
              }),
              SizedBox(height: height * 0.03),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.phoneResponsibleController,
                  decoration: InputDecoration(
                    //errorText: _patientStore.phoneResponsibleError,
                    labelText: 'Telefone do responsável',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setPhoneResponsible,
                );
              }),
              SizedBox(height: height * 0.05),
            ]),
          ),
          SizedBox(width: width * 0.05),
          SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.22,
            child: Column(children: [
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.phoneController,
                  decoration: InputDecoration(
                    errorText: _patientStore.phoneError,
                    labelText: 'Telefone *',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setPhone,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.birthDateController,
                  decoration: InputDecoration(
                    //errorText: _patientStore.phone2Error,
                    labelText: 'Data de nascimento *',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
                  ],
                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setBirthDate,
                );
              }),
              SizedBox(height: height * 0.03),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(_patientStore.howDidYouFindOut!),
                  items: howDidYouFindOut.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (h) {
                    _patientStore.setHowDidYouFindOut(h!);
                  },
                );
              }),
              SizedBox(height: height * 0.03),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _patientStore.phone2Controller,
                  decoration: InputDecoration(
                    //errorText: _patientStore.phone2Error,
                    labelText: 'Telefone de emergência',
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                  //inputFormatters: formatInput,
                  enabled: !_patientStore.loading,
                  //onTap: onTap,
                  onChanged: _patientStore.setPhone2,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                if (update == false || update == null) {
                  return TextButton(
                      onPressed: 
                              _patientStore.loading == false && _patientStore.validForm
                          ? _patientStore.savePressed
                          : null,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFF029F8C),
                      ),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Salvar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                } else {
                  return TextButton(
                      onPressed: 
                              _patientStore.loading == false && _patientStore.validForm
                          ? _patientStore.updatePressed
                          : null,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFF029F8C),
                      ),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Atualizar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                }
              }),
              SizedBox(
                height: height * 0.02,
              ),
              if (update == true)
                Observer(builder: (_) {
                  return TextButton(
                    onPressed: () {
                      _patientStore.clearFields();
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF029F8C).withOpacity(0.8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      height: 50,
                      alignment: Alignment.center,
                      child: _patientStore.loading == true
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
            ]),
          ),
        ],
      ),
    );
  }
}
