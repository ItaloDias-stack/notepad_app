import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:notepad_app/src/models/local_user.dart';
import 'package:notepad_app/src/utils/error_message.dart';
part 'google_sign_in_store.g.dart';

class GoogleSignInStore = _GoogleSignInStoreBase with _$GoogleSignInStore;

abstract class _GoogleSignInStoreBase with Store {
  final googleSignIn = GoogleSignIn();

  @observable
  GoogleSignInAccount? googleUser;

  @observable
  User? user;

  @observable
  FirebaseAuth auth = FirebaseAuth.instance;

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

    this.googleUser = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //await FirebaseAuth.instance.signInWithCredential(credential);
    await auth.signInWithCredential(credential);

    log("GoogleUser: ${this.googleUser}");
    isLoading = false;
  }

  @action
  Future signOut(BuildContext context) async {}

  @action
  Future signInWithEmailAndPassword(
      BuildContext context, LocalUser localUser) async {
    try {
      isLoading = true;
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: localUser.email as String,
          password: localUser.password as String);
      if (result.user == null) {
        isLoading = false;
        showRequestErrorMessage(context, "Erro ao autenticar o usuário");
        return;
      }
      user = result.user!;
      log("Usuário autenticado: $user");
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print(e.toString());
      showRequestErrorMessage(context, e.toString());
    }
  }

  @action
  Future registerWithEmailAndPassword(
      BuildContext context, LocalUser localUser) async {
    try {
      isLoading = true;
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: localUser.email as String,
          password: localUser.password as String);
      if (result.user == null) {
        isLoading = false;
        showRequestErrorMessage(context, "Erro ao salvar o usuário");
        return;
      }
      user = result.user!;
      log("Usuário autenticado: $user");
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print(e.toString());
      showRequestErrorMessage(context, e.toString());
    }
  }
}
