import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';

class Supervisor {
  String? idSupervisor;
  String? crpSupervisor;
  String? name;
  String? phone;
  String? email;

  Supervisor.fromParse(ParseObject object) {
    idSupervisor = object.objectId;
    crpSupervisor = object.get<String>(keyCrpSupervisor);
    name = object.get<String>(keyNameSupervisor);
    email = object.get<String>(keyEmailSupervisor);
    phone = object.get<String>(keyPhoneSupervisor);
    //created = object.createdAt;
  }

  Supervisor({
    required this.crpSupervisor,
    required this.name,
    required this.phone,
    required this.email,
  });

  Supervisor copyWith({
    String? idSupervisor,
    String? crpSupervisor,
    String? name,
    String? phone,
    String? email,
  }) {
    return Supervisor(
      //idSupervisor: idSupervisor ?? this.idSupervisor,
      crpSupervisor: crpSupervisor ?? this.crpSupervisor,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idSupervisor': idSupervisor,
      'crpSupervisor': crpSupervisor,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory Supervisor.fromMap(Map<String, dynamic> map) {
    return Supervisor(
      //idSupervisor: map['idSupervisor'],
      crpSupervisor: map['crpSupervisor'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Supervisor.fromJson(String source) =>
      Supervisor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Supervisor(idSupervisor: $idSupervisor, crpSupervisor: $crpSupervisor, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Supervisor &&
        other.idSupervisor == idSupervisor &&
        other.crpSupervisor == crpSupervisor &&
        other.name == name &&
        other.phone == phone &&
        other.email == email;
  }

  @override
  int get hashCode {
    return idSupervisor.hashCode ^
        crpSupervisor.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode;
  }
}
