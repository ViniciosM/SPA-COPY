import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/components/attendance_dialog.dart';
import 'package:spa/constants/admin.dart';
import 'package:spa/models/scheduling.dart';
import 'package:spa/stores/controller_store.dart';
import 'package:spa/stores/scheduling_store.dart';

class TableSchedulingDesktop extends StatelessWidget {
  const TableSchedulingDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    double height = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      if (_schedulingStore.error != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.error,
                color: Colors.red,
                size: 100,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ocorreu um erro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      } else if (_schedulingStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_schedulingStore.schedulingList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum atendimento encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _schedulingStore.setSearch('');
                },
                icon: Icon(Icons.refresh_rounded)),
          ],
        );
      }
      return SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            headingTextStyle: themeData.textTheme.subtitle1,
            dataTextStyle: themeData.textTheme.bodyText2,
            horizontalMargin: 0,
            columnSpacing: defaultPadding,
            columns: [
              DataColumn(
                label: Text("Data e horário",
                    style: themeData.textTheme.subtitle1),
              ),
              DataColumn(
                label: Text("Paciente", style: themeData.textTheme.subtitle1),
              ),
              DataColumn(
                label: Text(
                  "Estagiário",
                  style: themeData.textTheme.subtitle1,
                ),
              ),
              DataColumn(
                label: Text("Comparecimento",
                    style: themeData.textTheme.subtitle1),
              ),
            ],
            rows: List.generate(
              _schedulingStore.schedulingList.length,
              (index) => schedulingDataRow(
                  _schedulingStore.schedulingList[index], context),
            ),
          ),
        ),
      );
    });
  }
}

SchedulingStore _sStore = GetIt.I<SchedulingStore>();
//bool attendance = false;
/*
Widget checkboxAttendance(bool attendance, String idScheduling) {
  return Observer(builder: (_) {
    return Checkbox(
      value: attendance,
      onChanged: (value) {
        attendance = value!;
        _sStore.setAttendance(value);
        _sStore.updateAttendance(idScheduling);
      },
    );
  });
}
*/

DataRow schedulingDataRow(Scheduling scheduling, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  String screeningDateFormatted =
      '${scheduling.screeningDate!.day}/${scheduling.screeningDate!.month}/${scheduling.screeningDate!.year}';
  var textStyle = themeData.textTheme.bodyText2;
  return DataRow(
    cells: [
      DataCell(Text('$screeningDateFormatted às ${scheduling.screeningHour}',
          style: textStyle)),
      DataCell(Text(scheduling.patient!, style: textStyle)),
      DataCell(Text(
        scheduling.trainee!,
        style: textStyle,
      )),
      /*
      DataCell(Row(
        children: [
          checkboxAttendance(scheduling.attendance!, scheduling.idScheduling!),
          if (scheduling.attendance!) Text('Compareceu', style: textStyle),
          if (scheduling.attendance == false)
            Text('Não compareceu', style: textStyle)
        ],
      )),
      */
      if (scheduling.attendance == false)
        DataCell(
          OutlinedButton(
            child: Text('Confirmar',
                style: TextStyle(color: themeData.primaryColor)),
            onPressed: () {
              attendanceDialog(context, 'confirmar', scheduling);
            },
          ),
        ),
      if (scheduling.attendance == true)
        DataCell(Row(
          children: [
            Icon(Icons.check_circle_outline),
            Text('Compareceu', style: textStyle),
            /*
            IconButton(
              icon: Icon(Icons.undo_outlined),
              onPressed: () {
                attendanceDialog(context, 'confirmar', scheduling);
              },
            ),
            */
          ],
        ))
    ],
  );
}
