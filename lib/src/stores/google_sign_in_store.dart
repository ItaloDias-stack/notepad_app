import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:notepad_app/src/utils/error_message.dart';
part 'google_sign_in_store.g.dart';

class GoogleSignInStore = _GoogleSignInStoreBase with _$GoogleSignInStore;

abstract class _GoogleSignInStoreBase with Store {
  final googleSignIn = GoogleSignIn();

  @observable
  GoogleSignInAccount? user;

  @observable
  bool isLoading = false;

  @action
  setIsLoading(bool value) => isLoading = value;

  @action
  Future googleLogin(BuildContext context) async {
    isLoading = true;
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      isLoading = false;
      showRequestErrorMessage(
          context, "Erro ao realizar a autenticação com o google");
      return;
    }

    user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    isLoading = false;
  }
}
