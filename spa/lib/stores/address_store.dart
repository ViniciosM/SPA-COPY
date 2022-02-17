import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'address_store.g.dart';

class AddressStore = _AddressStoreBase with _$AddressStore;

abstract class _AddressStoreBase with Store {
  @observable
  TextEditingController streetController = TextEditingController();

  @observable
  TextEditingController numberController = TextEditingController();

  @observable
  TextEditingController postalCodeController = TextEditingController();

  @observable
  TextEditingController cityController = TextEditingController();

  @observable
  TextEditingController districtController = TextEditingController();

  @observable
  TextEditingController ufController = TextEditingController();

  @observable
  TextEditingController complementController = TextEditingController();

  @observable
  String? street;

  @observable
  String? number;

  @observable
  String? district;

  @observable
  String? postalCode;

  @observable
  String? city;

  @observable
  String? uf;

  @observable
  String? complement;

  @action
  void setStreet(String value) => street = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setDistrict(String value) => district = value;

  @action
  void setPostalCode(String value) => postalCode = value;

  @action
  void setCity(String value) => city = value;

  @action
  void setUF(String value) => uf = value;

  @action
  void setComplement(String value) => complement = value;

  @action
  clearFields() {
    streetController.text = '';
    numberController.text = '';
    postalCodeController.text = '';
    cityController.text = '';
    complementController.text = '';
    ufController.text = '';
    districtController.text = '';
    street = null;
    number = null;
    district = null;
    city = null;
    postalCode = null;
    complement = null;
    uf = null;
  }

  @computed
  bool get validStreet => street != null && street!.length > 3;
  String? get streetError =>
      street == null || validStreet ? null : 'Rua inválida';

  @computed
  bool get validNumber => number != null;
  String? get numberError =>
      uf == null || validNumber ? null : 'Número inválido';

  @computed
  bool get validDistrict => district != null && district!.length > 3;
  String? get districtError =>
      district == null || validDistrict ? null : 'Bairro inválido';

  @computed
  bool get validPostalCode => postalCode != null && postalCode!.length == 10;
  String? get postalCodeError =>
      postalCode == null || validPostalCode ? null : 'CEP inválido';

  @computed
  bool get validCity => city != null && city!.length > 3;
  String? get cityError => city == null || validCity ? null : 'Cidade inválida';

  @computed
  bool get validUf => uf != null && uf!.length == 2;
  String? get ufError => uf == null || validUf ? null : 'UF inválida';

  @computed
  bool get validComplement => complement != null && complement!.length > 3;
  String? get complementError =>
      uf == null || validComplement ? null : 'Complemento inválido';

  @computed
  bool get validForm =>
      validStreet && validNumber && validDistrict && validCity && validUf;
}
