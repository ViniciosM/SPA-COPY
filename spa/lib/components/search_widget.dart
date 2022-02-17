import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/stores/coordinator_store.dart';
import 'package:spa/stores/medical_record_store.dart';
import 'package:spa/stores/patient_store.dart';
import 'package:spa/stores/scheduling_store.dart';
import 'package:spa/stores/supervisor_store.dart';
import 'package:spa/stores/trainee_store.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.searchFor}) : super(key: key);
  final String searchFor;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    MedicalRecordStore _medicalRecordStore = GetIt.I<MedicalRecordStore>();
    CoordinatorStore _coordinatorStore = GetIt.I<CoordinatorStore>();
    SupervisorStore _supervisorStore = GetIt.I<SupervisorStore>();
    SchedulingStore _schedulingStore = GetIt.I<SchedulingStore>();
    PatientStore _patientStore = GetIt.I<PatientStore>();
    TraineeStore _traineeStore = GetIt.I<TraineeStore>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.5,
      height: height * 0.05,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Pesquisar $searchFor",
          fillColor: themeData.colorScheme.onBackground,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
          ),
          //suffixIcon: SvgPicture.asset(  "assets/icons/Search.svg",),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: themeData.colorScheme.primary,
          ),
        ),
        //textInputAction: TextInputAction.search,
        onChanged: (text) {
          switch (searchFor) {
            case 'coordenadores':
              _coordinatorStore.setSearch(text);
              break;
            case 'estagiários':
              _traineeStore.setSearch(text);
              break;
            case 'paciente nos atendimentos':
              _schedulingStore.setSearch(text);
              break;
            case 'paciente nos atendimentos...':
              _schedulingStore.setSearch2(text);
              break;
            case 'pacientes':
              _patientStore.setSearch(text);
              break;
            case 'supervisores':
              _supervisorStore.setSearch(text);
              break;
            case 'paciente nos prontuários':
              _medicalRecordStore.setSearch(text);
              break;
          }
        },
      ),
    );
  }
}
