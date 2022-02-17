import 'dart:convert';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';

class MedicalRecord {
  String? idMedicalRecord;
  int? number;
  String? demand;
  String? status;
  String? patient;
  DateTime? createAt;

  //Triagem
  DateTime? screeningDate;
  String? screeningHour;
  String? trainee;
  String? supervisor;
  //Ínicio do atendimento
  DateTime? startDate;
  String? startHour;
  String? traineeStart;
  String? supervisorStart;
  //Término do atendimento
  DateTime? endDate;
  String? endHour;
  String? traineeEnd;
  String? supervisorEnd;
  String? idScheduling;
  MedicalRecord({
    this.idMedicalRecord,
    this.number,
    this.demand,
    this.status,
    this.patient,
    this.createAt,
    this.screeningDate,
    this.screeningHour,
    this.trainee,
    this.supervisor,
    this.startDate,
    this.startHour,
    this.traineeStart,
    this.supervisorStart,
    this.endDate,
    this.endHour,
    this.traineeEnd,
    this.supervisorEnd,
    this.idScheduling,
  });

  MedicalRecord.fromParse(ParseObject object) {
    idMedicalRecord = object.objectId!;
    //idScheduling = object.get<String>(keyIdMedicalRecord);
    demand = object.get<String>(keyDemandMedicalRecord);
    status = object.get<String>(keyStatusMedicalRecord);
    patient = object.get<String>(keyPatientMedicalRecord);
    number = object.get<int>(keyNumberMedicalRecord);

    createAt = object.get<DateTime>(keyCreatedAt);
    //Triagem
    screeningDate = object.get<DateTime>(keyScreeningDateMedicalRecord);
    screeningHour = object.get<String>(keyScreeningHourMedicalRecord);
    trainee = object.get<String>(keyTraineeMedicalRecord);
    supervisor = object.get<String>(keySupervisorMedicalRecord);
    //Ínicio do atendimento
    startDate = object.get<DateTime>(keyStartDateMedicalRecord);
    startHour = object.get<String>(keyStartHourMedicalRecord);
    traineeStart = object.get<String>(keyTraineeStartMedicalRecord);
    supervisorStart = object.get<String>(keySupervisorStartMedicalRecord);
    //Término do atendimento
    endDate = object.get<DateTime>(keyEndDateMedicalRecord);
    endHour = object.get<String>(keyEndHourMedicalRecord);
    traineeEnd = object.get<String>(keyTraineeEndMedicalRecord);
    supervisorEnd = object.get<String>(keySupervisorEndMedicalRecord);
    idScheduling = object.get<String>(keySchedulingMedicalRecord);
  }

  MedicalRecord copyWith({
    String? idMedicalRecord,
    int? number,
    String? demand,
    String? status,
    String? patient,
    DateTime? createAt,
    DateTime? screeningDate,
    String? screeningHour,
    String? trainee,
    String? supervisor,
    DateTime? startDate,
    String? startHour,
    String? traineeStart,
    String? supervisorStart,
    DateTime? endDate,
    String? endHour,
    String? traineeEnd,
    String? supervisorEnd,
    String? idScheduling,
  }) {
    return MedicalRecord(
      idMedicalRecord: idMedicalRecord ?? this.idMedicalRecord,
      number: number ?? this.number,
      demand: demand ?? this.demand,
      status: status ?? this.status,
      patient: patient ?? this.patient,
      createAt: createAt ?? this.createAt,
      screeningDate: screeningDate ?? this.screeningDate,
      screeningHour: screeningHour ?? this.screeningHour,
      trainee: trainee ?? this.trainee,
      supervisor: supervisor ?? this.supervisor,
      startDate: startDate ?? this.startDate,
      startHour: startHour ?? this.startHour,
      traineeStart: traineeStart ?? this.traineeStart,
      supervisorStart: supervisorStart ?? this.supervisorStart,
      endDate: endDate ?? this.endDate,
      endHour: endHour ?? this.endHour,
      traineeEnd: traineeEnd ?? this.traineeEnd,
      supervisorEnd: supervisorEnd ?? this.supervisorEnd,
      idScheduling: idScheduling ?? this.idScheduling,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idMedicalRecord': idMedicalRecord,
      'number': number,
      'demand': demand,
      'status': status,
      'patient': patient,
      'createAt': createAt?.millisecondsSinceEpoch,
      'screeningDate': screeningDate?.millisecondsSinceEpoch,
      'screeningHour': screeningHour,
      'trainee': trainee,
      'supervisor': supervisor,
      'startDate': startDate?.millisecondsSinceEpoch,
      'startHour': startHour,
      'traineeStart': traineeStart,
      'supervisorStart': supervisorStart,
      'endDate': endDate?.millisecondsSinceEpoch,
      'endHour': endHour,
      'traineeEnd': traineeEnd,
      'supervisorEnd': supervisorEnd,
      'idScheduling': idScheduling,
    };
  }

  factory MedicalRecord.fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      idMedicalRecord:
          map['idMedicalRecord'] != null ? map['idMedicalRecord'] : null,
      number: map['number'] != null ? map['number'] : null,
      demand: map['demand'] != null ? map['demand'] : null,
      status: map['status'] != null ? map['status'] : null,
      patient: map['patient'] != null ? map['patient'] : null,
      createAt: map['createAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createAt'])
          : null,
      screeningDate: map['screeningDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['screeningDate'])
          : null,
      screeningHour: map['screeningHour'] != null ? map['screeningHour'] : null,
      trainee: map['trainee'] != null ? map['trainee'] : null,
      supervisor: map['supervisor'] != null ? map['supervisor'] : null,
      startDate: map['startDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startDate'])
          : null,
      startHour: map['startHour'] != null ? map['startHour'] : null,
      traineeStart: map['traineeStart'] != null ? map['traineeStart'] : null,
      supervisorStart:
          map['supervisorStart'] != null ? map['supervisorStart'] : null,
      endDate: map['endDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endDate'])
          : null,
      endHour: map['endHour'] != null ? map['endHour'] : null,
      traineeEnd: map['traineeEnd'] != null ? map['traineeEnd'] : null,
      supervisorEnd: map['supervisorEnd'] != null ? map['supervisorEnd'] : null,
      idScheduling: map['idScheduling'] != null ? map['idScheduling'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalRecord.fromJson(String source) =>
      MedicalRecord.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MedicalRecord(idMedicalRecord: $idMedicalRecord, number: $number, demand: $demand, status: $status, patient: $patient, createAt: $createAt, screeningDate: $screeningDate, screeningHour: $screeningHour, trainee: $trainee, supervisor: $supervisor, startDate: $startDate, startHour: $startHour, traineeStart: $traineeStart, supervisorStart: $supervisorStart, endDate: $endDate, endHour: $endHour, traineeEnd: $traineeEnd, supervisorEnd: $supervisorEnd, idScheduling: $idScheduling)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MedicalRecord &&
        other.idMedicalRecord == idMedicalRecord &&
        other.number == number &&
        other.demand == demand &&
        other.status == status &&
        other.patient == patient &&
        other.createAt == createAt &&
        other.screeningDate == screeningDate &&
        other.screeningHour == screeningHour &&
        other.trainee == trainee &&
        other.supervisor == supervisor &&
        other.startDate == startDate &&
        other.startHour == startHour &&
        other.traineeStart == traineeStart &&
        other.supervisorStart == supervisorStart &&
        other.endDate == endDate &&
        other.endHour == endHour &&
        other.traineeEnd == traineeEnd &&
        other.supervisorEnd == supervisorEnd &&
        other.idScheduling == idScheduling;
  }

  @override
  int get hashCode {
    return idMedicalRecord.hashCode ^
        number.hashCode ^
        demand.hashCode ^
        status.hashCode ^
        patient.hashCode ^
        createAt.hashCode ^
        screeningDate.hashCode ^
        screeningHour.hashCode ^
        trainee.hashCode ^
        supervisor.hashCode ^
        startDate.hashCode ^
        startHour.hashCode ^
        traineeStart.hashCode ^
        supervisorStart.hashCode ^
        endDate.hashCode ^
        endHour.hashCode ^
        traineeEnd.hashCode ^
        supervisorEnd.hashCode ^
        idScheduling.hashCode;
  }
}
