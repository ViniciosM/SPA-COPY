import 'package:flutter/material.dart';
import 'package:spa/pages/forms/coordinator_form.dart';
import 'package:spa/pages/forms/patient_form.dart';
import 'package:spa/pages/forms/scheduling_form.dart';
import 'package:spa/pages/forms/supervisor_form.dart';
import 'package:spa/pages/forms/trainee_form.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({Key? key, required this.text, required this.page})
      : super(key: key);
  final String text;
  final String page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (page) {
          case 'sc':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SchedulingForm()));
            break;
          case 'co':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CoordinatorForm()));
            break;
          case 'tr':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TraineeForm()));
            break;
          case 'pa':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PatientForm()));
            break;
          case 'su':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SupervisorForm()));
            break;
        }
      },
      child: Card(
        child: Text(text),
      ),
    );
  }
}

//final navigator = Navigator.push(context, MaterialPageRoute(builder: (context) => TraineeForm()));
