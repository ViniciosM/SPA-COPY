import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa/pages/search/coordinator_table.dart';
import 'package:spa/pages/search/patient_table.dart';
import 'package:spa/pages/search/scheduling_table.dart';
import 'package:spa/pages/search/supervisor_table.dart';
import 'package:spa/pages/search/trainee_table.dart';
import 'package:spa/stores/form_store.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    FormStore _formStore = FormStore();
    ScrollController _scrollController = ScrollController();
    double height = MediaQuery.of(context).size.height;

    return Scrollbar(
        controller: _scrollController,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuOption(
                    text: 'Atendimentos', page: 1, formStore: _formStore),
                menuOption(
                    text: 'Coordenadores', page: 2, formStore: _formStore),
                menuOption(text: 'Estagiários', page: 3, formStore: _formStore),
                menuOption(text: 'Pacientes', page: 4, formStore: _formStore),
                menuOption(
                    text: 'Supervisores', page: 5, formStore: _formStore),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: Observer(builder: (_) {
                switch (_formStore.form) {
                  case 1:
                    return const TableScheduling();
                  case 2:
                    return const TableCoordinator();
                  case 3:
                    return const TableTrainee();
                  case 4:
                    return const TablePatient();
                  case 5:
                    return const TableSupervisor();
                  default:
                    return const TableTrainee();
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
