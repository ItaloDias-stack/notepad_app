// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoogleSignInStore on _GoogleSignInStoreBase, Store {
  final _$googleUserAtom = Atom(name: '_GoogleSignInStoreBase.googleUser');

  @override
  GoogleSignInAccount? get googleUser {
    _$googleUserAtom.reportRead();
    return super.googleUser;
  }

  @override
  set googleUser(GoogleSignInAccount? value) {
    _$googleUserAtom.reportWrite(value, super.googleUser, () {
      super.googleUser = value;
    });
  }

  final _$userAtom = Atom(name: '_GoogleSignInStoreBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$authAtom = Atom(name: '_GoogleSignInStoreBase.auth');

  @override
  FirebaseAuth get auth {
    _$authAtom.reportRead();
    return super.auth;
  }

  @override
  set auth(FirebaseAuth value) {
    _$authAtom.reportWrite(value, super.auth, () {
      super.auth = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_GoogleSignInStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$googleLoginAsyncAction =
      AsyncAction('_GoogleSignInStoreBase.googleLogin');

  @override
  Future<dynamic> googleLogin(BuildContext context) {
    return _$googleLoginAsyncAction.run(() => super.googleLogin(context));
  }

  final _$signOutAsyncAction = AsyncAction('_GoogleSignInStoreBase.signOut');

  @override
  Future<dynamic> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_GoogleSignInStoreBase.signInWithEmailAndPassword');

  @override
  Future<dynamic> signInWithEmailAndPassword(
      BuildContext context, LocalUser localUser) {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword(context, localUser));
  }

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('_GoogleSignInStoreBase.registerWithEmailAndPassword');

  @override
  Future<dynamic> registerWithEmailAndPassword(
      BuildContext context, LocalUser localUser) {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword(context, localUser));
  }

  final _$_GoogleSignInStoreBaseActionController =
      ActionController(name: '_GoogleSignInStoreBase');

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$_GoogleSignInStoreBaseActionController.startAction(
        name: '_GoogleSignInStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_GoogleSignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
googleUser: ${googleUser},
user: ${user},
auth: ${auth},
isLoading: ${isLoading}
    ''';
  }
}
