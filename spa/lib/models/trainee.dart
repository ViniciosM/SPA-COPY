import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:spa/constants/keys.dart';

class Trainee {
  String? idTrainee;
  String? registration;
  String? name;
  String? coordinator;
  String? supervisor;
  String? traineeArea;
  String? semester;
  String? email;
  String? phone;
  String? role;

  Trainee({
    this.registration,
    this.name,
    this.coordinator,
    this.supervisor,
    this.traineeArea,
    this.semester,
    this.email,
    this.phone,
    this.role,
  });

  Trainee.fromParse(ParseObject object) {
    idTrainee = object.objectId;
    registration = object.get<String>(keyRegistrationTrainee);
    name = object.get<String>(keyNameTrainee);
    coordinator = object.get<String>(keyTraineeCoordinator);
    supervisor = object.get<String>(keyTraineeSupervisor);
    traineeArea = object.get<String>(keyNameTraineeArea);
    semester = object.get<String>(keySemesterTrainee);
    email = object.get<String>(keyEmailTrainee);
    phone = object.get<String>(keyPhoneTrainee);
    role = object.get<String>(keyRoleTrainee);
    //created = object.createdAt;
  }

  Trainee copyWith({
    String? idTrainee,
    String? registration,
    String? name,
    String? coordinator,
    String? supervisor,
    String? traineeArea,
    String? semester,
    String? email,
    String? phone,
    String? role,
  }) {
    return Trainee(
      //idTrainee: idTrainee ?? this.idTrainee,
      registration: registration ?? this.registration,
      name: name ?? this.name,
      coordinator: coordinator ?? this.coordinator,
      supervisor: supervisor ?? this.supervisor,
      traineeArea: traineeArea ?? this.traineeArea,
      semester: semester ?? this.semester,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTrainee': idTrainee,
      'registration': registration,
      'name': name,
      'coordinator': coordinator,
      'supervisor': supervisor,
      'traineeArea': traineeArea,
      'semester': semester,
      'email': email,
      'phone': phone,
      'role': role,
    };
  }

  factory Trainee.fromMap(Map<String, dynamic> map) {
    return Trainee(
      //idTrainee: map['idTrainee'],
      registration: map['registration'],
      name: map['name'],
      coordinator: map['coordinator'],
      supervisor: map['supervisor'],
      traineeArea: map['traineeArea'],
      semester: map['semester'],
      email: map['email'],
      phone: map['phone'],
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Trainee.fromJson(String source) =>
      Trainee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Trainee(idTrainee: $idTrainee, registration: $registration, name: $name, coordinator: $coordinator, supervisor: $supervisor, traineeArea: $traineeArea, semester: $semester, email: $email, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trainee &&
        other.idTrainee == idTrainee &&
        other.registration == registration &&
        other.name == name &&
        other.coordinator == coordinator &&
        other.supervisor == supervisor &&
        other.traineeArea == traineeArea &&
        other.semester == semester &&
        other.email == email &&
        other.phone == phone &&
        other.role == role;
  }

  @override
  int get hashCode {
    return idTrainee.hashCode ^
        registration.hashCode ^
        name.hashCode ^
        coordinator.hashCode ^
        supervisor.hashCode ^
        traineeArea.hashCode ^
        semester.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        role.hashCode;
  }
}
