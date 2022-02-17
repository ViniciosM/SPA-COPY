import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:spa/constants/keys.dart';

class Scheduling {
  String? idScheduling;
  DateTime? screeningDate;
  String? screeningHour;
  String? supervisor;
  String? trainee;
  String? patient;
  bool? attendance;
  bool? openMedicalRecord;

  Scheduling({
    this.screeningDate,
    this.screeningHour,
    this.supervisor,
    this.trainee,
    this.patient,
  });

  Scheduling.fromDocument(AsyncSnapshot snapshot) {
    idScheduling = snapshot.data['objectId'];
    screeningDate = snapshot.data['screeningDate'];
    supervisor = snapshot.data['supervisor'];
    trainee = snapshot.data['trainee'];
    patient = snapshot.data['patient'];
    attendance = snapshot.data['attendance'];
    openMedicalRecord = snapshot.data['openMedicalRecord'];
  }

  Scheduling.fromParse(ParseObject object) {
    idScheduling = object.objectId;
    screeningDate = object.get<DateTime>(keyScreeningDateScheduling)!;
    screeningHour = object.get<String>(keyScreeningHourScheduling);
    supervisor = object.get<String>(keySupervisorScheduling);
    trainee = object.get<String>(keyTraineeScheduling);
    patient = object.get<String>(keyPatientScheduling);
    attendance = object.get<bool>(keyAttendanceScheduling);
    openMedicalRecord = object.get<bool>(keyOpenMedicalRecordScheduling);

    //created = object.createdAt;
  }

  Scheduling copyWith({
    String? idScheduling,
    DateTime? screeningDate,
    TimeOfDay? screeningTime,
    String? supervisor,
    String? trainee,
    String? patient,
    bool? attendance,
  }) {
    return Scheduling(
      //idScheduling: idScheduling ?? this.idScheduling,
      screeningDate: screeningDate ?? this.screeningDate,

      supervisor: supervisor ?? this.supervisor,
      trainee: trainee ?? this.trainee,
      patient: patient ?? this.patient,
      //attendance: attendance ?? this.attendance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idScheduling': idScheduling,
      //'screeningDate': screeningDate?.toMap(),
      //'screeningTime': screeningTime?.toMap(),
      'supervisor': supervisor,
      'trainee': trainee,
      'patient': patient,
      'attendance': attendance,
    };
  }

  factory Scheduling.fromMap(Map<String, dynamic> map) {
    return Scheduling(
      //idScheduling: map['idScheduling'],
      //screeningDate: DateTime.fromMillisecondsSinceEpoch(map['screeningDate']),
      //screeningTime: TimeOfDay.fromMap(map['screeningTime']),
      supervisor: map['supervisor'],
      trainee: map['trainee'],
      patient: map['patient'],
      //attendance: map['attendance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Scheduling.fromJson(String source) =>
      Scheduling.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Scheduling(idScheduling: $idScheduling, screeningDate: $screeningDate, supervisor: $supervisor, trainee: $trainee, patient: $patient, attendance: $attendance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Scheduling &&
        other.idScheduling == idScheduling &&
        other.screeningDate == screeningDate &&
        other.supervisor == supervisor &&
        other.trainee == trainee &&
        other.patient == patient &&
        other.attendance == attendance;
  }

  @override
  int get hashCode {
    return idScheduling.hashCode ^
        screeningDate.hashCode ^
        supervisor.hashCode ^
        trainee.hashCode ^
        patient.hashCode ^
        attendance.hashCode;
  }
}
