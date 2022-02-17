import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/admin.dart';
import 'package:spa/repositories/coordinator_repository.dart';
import 'package:spa/repositories/supervisor_repository.dart';
import 'package:spa/stores/coordinator_store.dart';
import 'package:spa/stores/medical_record_store.dart';
import 'package:spa/stores/patient_store.dart';
import 'package:spa/stores/scheduling_store.dart';
import 'package:spa/stores/supervisor_store.dart';
import 'package:spa/stores/trainee_store.dart';

showAlertDialog(BuildContext context, String title, String id) {
  ThemeData themeData = Theme.of(context);
  Widget deleteButton = Padding(
    padding: EdgeInsets.all(defaultPadding),
    child: TextButton(
      child: Text(
        "Excluir",
        style: TextStyle(color: themeData.colorScheme.error),
      ),
      onPressed: () {
        switch (title) {
          case 'supervisor':
            SupervisorStore supervisorStore = GetIt.I<SupervisorStore>();
            supervisorStore.delete(id);
            Navigator.pop(context);
            break;
          case 'coordenador':
            CoordinatorStore coordinatorStore = GetIt.I<CoordinatorStore>();
            coordinatorStore.delete(id);
            Navigator.pop(context);
            break;
          case 'estagiário':
            TraineeStore traineeStore = GetIt.I<TraineeStore>();
            traineeStore.delete(id);
            Navigator.pop(context);
            break;
          case 'atendimento':
            SchedulingStore schedulingStore = GetIt.I<SchedulingStore>();
            schedulingStore.delete(id);
            Navigator.pop(context);
            break;
          case 'paciente':
            PatientStore patientStore = GetIt.I<PatientStore>();
            patientStore.delete(id);
            Navigator.pop(context);
            break;
          case 'prontuário':
            MedicalRecordStore medicalRecordStore =
                GetIt.I<MedicalRecordStore>();
            medicalRecordStore.delete(id);
            Navigator.pop(context);
            break;
        }
      },
    ),
  );
  Widget cancelButton = Padding(
    padding: EdgeInsets.all(defaultPadding),
    child: TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Excluir $title"),
    content: const Text("Gostaria mesmo de excluir esse cadastro?"),
    actions: [
      deleteButton,
      cancelButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
