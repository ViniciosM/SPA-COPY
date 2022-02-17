import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/admin.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/stores/scheduling_store.dart';

attendanceDialog(BuildContext context, String action, Scheduling scheduling) {
  ThemeData themeData = Theme.of(context);
  Widget confirmButton = Padding(
    padding: EdgeInsets.all(defaultPadding),
    child: TextButton(
      child: Text(
        "Confirmar",
        style: TextStyle(color: themeData.primaryColor),
      ),
      onPressed: () {
        switch (action) {
          case 'confirmar':
            SchedulingStore schedulingStore = GetIt.I<SchedulingStore>();
            schedulingStore.updateAttendance(action, scheduling);
            Navigator.pop(context);
            break;
          case 'desfazer':
            SchedulingStore schedulingStore = GetIt.I<SchedulingStore>();
            schedulingStore.updateAttendance(action, scheduling);
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
    title: Text("Confirmar comparecimento"),
    content: const Text("Confirmar o comparecimento do paciente?"),
    actions: [
      confirmButton,
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
