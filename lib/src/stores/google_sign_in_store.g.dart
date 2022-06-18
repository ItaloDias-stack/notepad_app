// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoogleSignInStore on _GoogleSignInStoreBase, Store {
  final _$userAtom = Atom(name: '_GoogleSignInStoreBase.user');

  @override
  GoogleSignInAccount? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(GoogleSignInAccount? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
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
user: ${user},
isLoading: ${isLoading}
    ''';
  }
}
