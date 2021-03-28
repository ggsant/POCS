import 'package:poc_auth/app/features/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:poc_auth/app/features/auth/domain/entities/login_credentials.dart';
import 'package:poc_auth/app/features/auth/domain/entities/success_entity.dart';
import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  _SignInControllerBase(
    this.usecase,
  );

  final SignInWithEmailAndPassword usecase;

  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  final TextEditingController textEmailController = TextEditingController();

  final TextEditingController textPasswordController = TextEditingController();

  // Region Observables
  @observable
  Failure failure = ServerFailure(message: '');

  @observable
  SuccessEntity success = SuccessEntity(message: '');

  @action
  Future<void> signInWithEmailAndPassword() async {
    final result = await usecase.call(SignInCredentialsEntity(
      email: textEmailController.text,
      password: textPasswordController.text,
    ));
    result.fold((left) {
      return failure = left;
    }, (right) {
      return success = right;
    });
  }

  @computed
  bool get canSignIn =>
      textEmailController.text.isNotEmpty &&
      textPasswordController.text.isNotEmpty;
}
