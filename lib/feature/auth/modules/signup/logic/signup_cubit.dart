import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/core/data/model/app_result.dart';
import 'package:tabib/feature/auth/data/repo/auth_repo.dart';

import 'package:tabib/feature/auth/modules/signup/logic/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final TextEditingController emailContraller = TextEditingController();

  final TextEditingController passwordContraller = TextEditingController();

  final AuthRepo _auth;
  SignupCubit({required this._auth}) : super(SignupState.initial());

  Future<void> emitSignupStates(String email, String password) async {
    emit(SignupState.loading());

    final result = await _auth.signup(email, password);

    result.when(
      success: (data) => emit(SignupState.success()),
      failure: (error) => emit(SignupState.failure(error.message)),
    );
  }
}
