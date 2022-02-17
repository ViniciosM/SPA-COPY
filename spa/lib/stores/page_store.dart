import 'package:mobx/mobx.dart';
part 'page_store.g.dart';

class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase with Store {
  @observable
  int index = 0;

  @observable
  int currentIndex = 0;

  @observable
  String pageName = 'Início';

  @action
  void setIndex(int value) => index = value;

  @action
  void setCurrentIndex(int value) => currentIndex = value;

  @action
  void setPageName(int value) {
    switch (value) {
      case 0:
        pageName = 'Início';
        break;
      case 1:
        pageName = 'Pesquisa';
        break;
      case 2:
        pageName = 'Cadastro';
        break;
      case 3:
        pageName = 'Prontuário';
        break;
      default:
        pageName = 'Início';
    }
  }
}
