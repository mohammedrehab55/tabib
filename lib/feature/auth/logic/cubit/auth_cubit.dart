import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/core/data/model/app_result.dart';
import 'package:tabib/feature/auth/data/repo/auth_repo.dart';
import 'package:tabib/feature/auth/logic/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit({required this.repo}) : super(AuthState.initial());

  Future<void> emitLogInStates(String email, String password) async {
    emit(const AuthState.loading());
    final result = await repo.login(email, password);
    result.when(
      success: (data) => emit(const AuthState.success()),
      failure: (error) => emit(AuthState.failure(error.message)),
    );
  }
}
