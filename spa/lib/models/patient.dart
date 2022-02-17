import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:spa/constants/keys.dart';
import 'package:spa/models/address.dart';

class Patient {
  String? idPatient;
  String? name;
  String? email;
  String? phone;
  int? age;
  DateTime? birthDate;
  String? naturalness;
  String? maritalStatus;
  String? educationLevel;
  Address? address;
  String? summaryAddress;
  String? howDidYouFindOut;
  String? nameResponsible;
  String? phoneResponsible;
  String? phone2;
  DateTime? createAt;

  Patient({
    this.idPatient,
    this.name,
    this.email,
    this.phone,
    this.age,
    this.birthDate,
    this.naturalness,
    this.maritalStatus,
    this.educationLevel,
    this.address,
    this.summaryAddress,
    this.howDidYouFindOut,
    this.nameResponsible,
    this.phoneResponsible,
    this.phone2,
  });

  Patient.fromParse(ParseObject object) {
    idPatient = object.objectId!;
    name = object.get<String>(keyNamePatient);
    email = object.get<String>(keyEmailPatient);
    phone = object.get<String>(keyPhonePatient);
    phone2 = object.get<String>(keyPhone2Patient) ?? '';
    age = object.get<int>(keyAgePatient);
    birthDate = object.get<DateTime>(keyBirthDatePatient);
    summaryAddress = object.get<String>(keySummaryAddressPatient);
    naturalness = object.get<String>(keyNaturalnessPatient);
    maritalStatus = object.get<String>(keyMaritalStatusPatient);
    educationLevel = object.get<String>(keyEducationLevelPatient);
    howDidYouFindOut = object.get<String>(keyHowDidYouFindOutPatient);
    nameResponsible = object.get<String>(keyNameResponsiblePatient) ?? '';
    phoneResponsible = object.get<String>(keyPhoneResponsiblePatient) ?? '';

    /*
    address = Address(
      street: object.get<String>(keyStreet),
      number: object.get<String>(keyNumber),
      district: object.get<String>(keyDistrict),
      city: object.get<String>(keyCity),
      postalCode: object.get<String>(keyPostalCode),
      uf: object.get<String>(keyUF),
      complement: object.get<String>(keyComplement),
    );

    address = Address.fromParse(object.get<String>(keyAddressPatient)!);
    */
  }

  Patient copyWith({
    String? idPatient,
    String? name,
    String? email,
    String? phone,
    int? age,
    DateTime? birthDate,
    String? naturalness,
    String? maritalStatus,
    String? educationLevel,
    Address? address,
    String? summaryAddress,
    String? howDidYouFindOut,
    String? nameResponsible,
    String? phoneResponsible,
    String? phone2,
  }) {
    return Patient(
      idPatient: idPatient ?? this.idPatient,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      birthDate: birthDate ?? this.birthDate,
      naturalness: naturalness ?? this.naturalness,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      educationLevel: educationLevel ?? this.educationLevel,
      address: address ?? this.address,
      summaryAddress: summaryAddress ?? this.summaryAddress,
      howDidYouFindOut: howDidYouFindOut ?? this.howDidYouFindOut,
      nameResponsible: nameResponsible ?? this.nameResponsible,
      phoneResponsible: phoneResponsible ?? this.phoneResponsible,
      phone2: phone2 ?? this.phone2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPatient': idPatient,
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'naturalness': naturalness,
      'maritalStatus': maritalStatus,
      'educationLevel': educationLevel,
      'address': address?.toMap(),
      'summaryAddress': summaryAddress,
      'howDidYouFindOut': howDidYouFindOut,
      'nameResponsible': nameResponsible,
      'phoneResponsible': phoneResponsible,
      'phone2': phone2,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      idPatient: map['idPatient'] != null ? map['idPatient'] : null,
      name: map['name'] != null ? map['name'] : null,
      email: map['email'] != null ? map['email'] : null,
      phone: map['phone'] != null ? map['phone'] : null,
      age: map['age'] != null ? map['age'] : null,
      birthDate: map['birthDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthDate'])
          : null,
      naturalness: map['naturalness'] != null ? map['naturalness'] : null,
      maritalStatus: map['maritalStatus'] != null ? map['maritalStatus'] : null,
      educationLevel:
          map['educationLevel'] != null ? map['educationLevel'] : null,
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      summaryAddress:
          map['summaryAddress'] != null ? map['summaryAddress'] : null,
      howDidYouFindOut:
          map['howDidYouFindOut'] != null ? map['howDidYouFindOut'] : null,
      nameResponsible:
          map['nameResponsible'] != null ? map['nameResponsible'] : null,
      phoneResponsible:
          map['phoneResponsible'] != null ? map['phoneResponsible'] : null,
      phone2: map['phone2'] != null ? map['phone2'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient(idPatient: $idPatient, name: $name, email: $email, phone: $phone, age: $age, birthDate: $birthDate, naturalness: $naturalness, maritalStatus: $maritalStatus, educationLevel: $educationLevel, address: $address, summaryAddress: $summaryAddress, howDidYouFindOut: $howDidYouFindOut, nameResponsible: $nameResponsible, phoneResponsible: $phoneResponsible, phone2: $phone2)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Patient &&
        other.idPatient == idPatient &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.age == age &&
        other.birthDate == birthDate &&
        other.naturalness == naturalness &&
        other.maritalStatus == maritalStatus &&
        other.educationLevel == educationLevel &&
        other.address == address &&
        other.summaryAddress == summaryAddress &&
        other.howDidYouFindOut == howDidYouFindOut &&
        other.nameResponsible == nameResponsible &&
        other.phoneResponsible == phoneResponsible &&
        other.phone2 == phone2;
  }

  @override
  int get hashCode {
    return idPatient.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        age.hashCode ^
        birthDate.hashCode ^
        naturalness.hashCode ^
        maritalStatus.hashCode ^
        educationLevel.hashCode ^
        address.hashCode ^
        summaryAddress.hashCode ^
        howDidYouFindOut.hashCode ^
        nameResponsible.hashCode ^
        phoneResponsible.hashCode ^
        phone2.hashCode;
  }
}
