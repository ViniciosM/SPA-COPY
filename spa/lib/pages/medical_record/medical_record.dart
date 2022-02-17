import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa/pages/forms/medical_record_form.dart';
import 'package:spa/pages/forms/scheduling_form.dart';
import 'package:spa/pages/medical_record/open_medical_record.dart';
import 'package:spa/pages/medical_record/table_scheduling_attended.dart';
import 'package:spa/stores/controller_store.dart';

class MedicalRecordPage extends StatefulWidget {
  const MedicalRecordPage({Key? key}) : super(key: key);

  @override
  _MedicalRecordPageState createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends State<MedicalRecordPage> {
  @override
  Widget build(BuildContext context) {
    ControllerStore _controllerStore = ControllerStore();
    double height = MediaQuery.of(context).size.height;
    return Scrollbar(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            menuOption(
                text: 'Aberto', page: 1, controllerStore: _controllerStore),
            menuOption(
                text: 'Aguardando abertura',
                page: 2,
                controllerStore: _controllerStore),
          ],
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Center(
          child: Observer(builder: (_) {
            switch (_controllerStore.medicalRecord) {
              case 1:
                return const OpenMedicalRecord();
              case 2:
                return const TableSchedulingAttended();
              default:
                return const OpenMedicalRecord();
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
          required ControllerStore controllerStore}) =>
      Observer(builder: (_) {
        return InkWell(
          onTap: () {
            switch (page) {
              case 1:
                controllerStore.setForm(1);
                break;
              case 2:
                controllerStore.setForm(2);
                break;
              case 3:
                controllerStore.setForm(3);
                break;
            }
          },
          child: Container(
              padding: const EdgeInsets.all(12),
              child: Observer(
                builder: (_) {
                  return controllerStore.medicalRecord == page
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
