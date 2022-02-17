import 'package:flutter/material.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/pages/medical_record/components/table_medical_record_desktop.dart';
import 'package:spa/pages/medical_record/components/table_medical_record_mobile.dart';
import 'package:spa/pages/medical_record/components/table_medical_record_tablet.dart';
import 'package:spa/responsive.dart';

class OpenMedicalRecord extends StatelessWidget {
  const OpenMedicalRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: themeData.colorScheme.onBackground,
        borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
        boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          if (Responsive.isDesktop(context)) const TableMedicalRecordDesktop(),
          if (Responsive.isTablet(context)) const TableMedicalRecordTablet(),
          if (Responsive.isMobile(context)) const TableMedicalRecordMobile(),
        ],
      ),
    );
  }
}
