import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:spa/constants/keys.dart';

class Address {
  String? idAddress;
  String? street;
  String? number;
  String? district;
  String? postalCode;
  String? city;
  String? uf;
  String? complement;

  Address.fromParse(ParseObject object) {
    idAddress = object.objectId!;
    street = object.get<String>(keyStreet)!;
    number = object.get<String>(keyNumber)!;
    district = object.get<String>(keyDistrict)!;
    postalCode = object.get<String>(keyPostalCode)!;
    city = object.get<String>(keyCity)!;
    uf = object.get<String>(keyUF)!;
    complement = object.get<String>(keyComplement)!;
  }
  //created = object.createdAt;

  Address({
    this.street,
    this.number,
    this.district,
    this.postalCode,
    this.city,
    this.uf,
    this.complement,
  });

  Address copyWith({
    String? idAddress,
    String? street,
    String? number,
    String? district,
    String? postalCode,
    String? city,
    String? uf,
    String? complement,
  }) {
    return Address(
      //idAddress: idAddress ?? this.idAddress,
      street: street ?? this.street,
      number: number ?? this.number,
      district: district ?? this.district,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      uf: uf ?? this.uf,
      complement: complement ?? this.complement,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idAddress': idAddress,
      'street': street,
      'number': number,
      'district': district,
      'postalCode': postalCode,
      'city': city,
      'uf': uf,
      'complement': complement,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      //idAddress: map['idAddress'],
      street: map['street'],
      number: map['number'],
      district: map['district'],
      postalCode: map['postalCode'],
      city: map['city'],
      uf: map['uf'],
      complement: map['complement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rua: $street, N°: $number - Bairro: $district\nCEP: $postalCode\nCidade: $city-UF: $uf\nComplemento $complement)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.idAddress == idAddress &&
        other.street == street &&
        other.number == number &&
        other.district == district &&
        other.postalCode == postalCode &&
        other.city == city &&
        other.uf == uf &&
        other.complement == complement;
  }

  @override
  int get hashCode {
    return idAddress.hashCode ^
        street.hashCode ^
        number.hashCode ^
        district.hashCode ^
        postalCode.hashCode ^
        city.hashCode ^
        uf.hashCode ^
        complement.hashCode;
  }
}
