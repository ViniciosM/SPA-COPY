import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/data_selection.dart';
import 'package:spa/stores/coordinator_store.dart';
import 'package:spa/stores/supervisor_store.dart';
import 'package:spa/stores/trainee_store.dart';


class TraineeForm extends StatelessWidget {
  const TraineeForm({ Key? key, this.update }) : super(key: key);
  final bool? update;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    CoordinatorStore _coordinatorStore = GetIt.I<CoordinatorStore>();
    SupervisorStore _supervisorStore = GetIt.I<SupervisorStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _traineeStore.nameController,
                  enabled: !_traineeStore.loading,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    errorText: _traineeStore.nameError,
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelText: 'Nome do estagiário',
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),
                  onChanged: _traineeStore.setName,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _traineeStore.emailController,
                  enabled: !_traineeStore.loading,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    //enabled: !_traineeStore.loading,
                    errorText: _traineeStore.emailError,
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelText: 'Email',
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),
                  onChanged: _traineeStore.setEmail,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('${_traineeStore.coordinator}'),
                  items:
                      _coordinatorStore.listNameCoordinator.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (c) {
                    _traineeStore.setCoordinator(c!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  style: themeData.inputDecorationTheme.labelStyle,
                  isExpanded: true,
                  hint: Text('${_traineeStore.traineeArea}'),
                  items: traineeArea.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (ta) {
                    _traineeStore.setTraineeArea(ta!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('${_traineeStore.semester}'),
                  items: semester.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (s) {
                    _traineeStore.setSemester(s!);
                  },
                );
              }),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: width * 0.05),
          width: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _traineeStore.registrationController,
                  enabled: !_traineeStore.loading,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorText: _traineeStore.registrationError,
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelText: 'Matrícula',
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  onChanged: _traineeStore.setRegistration,
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return TextFormField(
                  controller: _traineeStore.phoneController,
                  enabled: !_traineeStore.loading,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText: _traineeStore.phoneError,
                    focusedBorder: themeData.inputDecorationTheme.focusedBorder,
                    disabledBorder: themeData.inputDecorationTheme.border,
                    labelText: 'Telefone',
                    labelStyle: themeData.inputDecorationTheme.labelStyle,
                    enabledBorder: themeData.inputDecorationTheme.enabledBorder,
                  ),
                  onChanged: _traineeStore.setPhone,
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('${_traineeStore.supervisor}'),
                  items:
                      _supervisorStore.listNameSupervisor.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (s) {
                    _traineeStore.setSupervisor(s!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('${_traineeStore.role}'),
                  items: <String>[
                    'Extramuro',
                    'Intramuro',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (r) {
                    _traineeStore.setRole(r!);
                  },
                );
              }),
              SizedBox(height: height * 0.05),
              Observer(builder: (_) {
               if(update == false || update == null){
                 return TextButton(
                  onPressed:
                      _traineeStore.validForm && _traineeStore.loading == false
                          ? _traineeStore.savePressed
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
                    child: const Text(
                      'Salvar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
               }else{
                 return TextButton(
                  onPressed:
                      _traineeStore.validForm && _traineeStore.loading == false
                          ? _traineeStore.updatePressed
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
                    child: const Text(
                      'Atualizar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
               }}),
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
        ),
      ],
    );
  }
}
