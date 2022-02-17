import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';

class Coordinator {
  String? idCoordinator;
  String? crpCoordinator;
  String? name;
  String? phone;
  String? email;

  Coordinator.fromParse(ParseObject object) {
    idCoordinator = object.objectId!;
    crpCoordinator = object.get<String>(keyCrpCoordinator)!;
    name = object.get<String>(keyNameCoordinator)!;
    email = object.get<String>(keyEmailCoordinator)!;
    phone = object.get<String>(keyPhoneCoordinator)!;
    //created = object.createdAt;
  }

  Coordinator({
    required this.crpCoordinator,
    required this.name,
    required this.phone,
    required this.email,
  });

  Coordinator copyWith({
    String? idCoordinator,
    String? crpCoordinator,
    String? name,
    String? phone,
    String? email,
  }) {
    return Coordinator(
      //idCoordinator: idCoordinator ?? this.idCoordinator,
      crpCoordinator: crpCoordinator ?? this.crpCoordinator,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCoordinator': idCoordinator,
      'crpCoordinator': crpCoordinator,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory Coordinator.fromMap(Map<String, dynamic> map) {
    return Coordinator(
      //idCoordinator: map['idCoordinator'],
      crpCoordinator: map['crpCoordinator'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinator.fromJson(String source) =>
      Coordinator.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coordinator(idCoordinator: $idCoordinator, crpCoordinator: $crpCoordinator, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coordinator &&
        other.idCoordinator == idCoordinator &&
        other.crpCoordinator == crpCoordinator &&
        other.name == name &&
        other.phone == phone &&
        other.email == email;
  }

  @override
  int get hashCode {
    return idCoordinator.hashCode ^
        crpCoordinator.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode;
  }
}
