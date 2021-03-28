// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInController on _SignInControllerBase, Store {
  Computed<bool>? _$canSignInComputed;

  @override
  bool get canSignIn =>
      (_$canSignInComputed ??= Computed<bool>(() => super.canSignIn,
              name: '_SignInControllerBase.canSignIn'))
          .value;

  final _$failureAtom = Atom(name: '_SignInControllerBase.failure');

  @override
  Failure get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$successAtom = Atom(name: '_SignInControllerBase.success');

  @override
  SuccessEntity get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(SuccessEntity value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_SignInControllerBase.signInWithEmailAndPassword');

  @override
  Future<void> signInWithEmailAndPassword() {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword());
  }

  @override
  String toString() {
    return '''
failure: ${failure},
success: ${success},
canSignIn: ${canSignIn}
    ''';
  }
}
