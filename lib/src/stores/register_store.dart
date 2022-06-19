import 'package:mobx/mobx.dart';
import 'package:notepad_app/src/models/local_user.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  LocalUser user = LocalUser();

  @action
  setEmail(String value) => user.email = value;

  @action
  setPassword(String value) => user.password = value;
}
