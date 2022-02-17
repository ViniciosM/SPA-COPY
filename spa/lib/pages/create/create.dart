import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa/pages/forms/coordinator_form.dart';
import 'package:spa/pages/forms/patient_form.dart';
import 'package:spa/pages/forms/scheduling_form.dart';
import 'package:spa/pages/forms/supervisor_form.dart';
import 'package:spa/pages/forms/trainee_form.dart';
import 'package:spa/stores/form_store.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    FormStore _formStore = FormStore();
    double height = MediaQuery.of(context).size.height;
    return Scrollbar(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            menuOption(text: 'Atendimento', page: 1, formStore: _formStore),
            menuOption(text: 'Coordenador', page: 2, formStore: _formStore),
            menuOption(text: 'Estagiário', page: 3, formStore: _formStore),
            menuOption(text: 'Paciente', page: 4, formStore: _formStore),
            menuOption(text: 'Supervisor', page: 5, formStore: _formStore),
          ],
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Center(
          child: Observer(builder: (_) {
            switch (_formStore.form) {
              case 1:
                return const SchedulingForm();
              case 2:
                return const CoordinatorForm();
              case 3:
                return const TraineeForm();
              case 4:
                return const PatientForm();
              case 5:
                return const SupervisorForm();
              default:
                return const SchedulingForm();
            }
          }),
        )
      ],
    ));
  }

  ThemeData themeData = ThemeData();

  Widget menuOption(
          {required String text,
          required int page,
          required FormStore formStore}) =>
      Observer(builder: (_) {
        return InkWell(
          onTap: () {
            switch (page) {
              case 1:
                formStore.setForm(1);
                break;
              case 2:
                formStore.setForm(2);
                break;
              case 3:
                formStore.setForm(3);
                break;
              case 4:
                formStore.setForm(4);
                break;
              case 5:
                formStore.setForm(5);
                break;
            }
          },
          child: Container(
              padding: const EdgeInsets.all(12),
              child: Observer(
                builder: (_) {
                  return formStore.form == page
                      ? Text(
                          text,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 17, color: Color(0xff029f8c))),
                        )
                      : Text(
                          text,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Color(0xff4a4c4f))),
                        );
                },
              )),
        );
      });
}
