import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabib/core/data/model/app_result.dart';
import 'package:tabib/core/data/model/error_model.dart';
import 'package:tabib/feature/auth/data/model/user_model.dart';

class AuthRepo {
  final FirebaseAuth _auth;

  AuthRepo({required this._auth});

  Future<AppResult<UserModel>> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        return AppResult.failure(
          ErrorModel(code: 'null', message: 'User is null'),
        );
      }
      return AppResult.success(
        UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
        ),
      );
    } catch (e) {
      return AppResult.failure(
        ErrorModel(code: 'error', message: e.toString()),
      );
    }
  }

  Future<AppResult<UserModel>> signup(String email, String password) async {
    try {
      final cerdential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (cerdential.user == null) {
        return AppResult.failure(
          ErrorModel(code: 'null', message: 'User is null'),
        );
      }
      return AppResult.success(
        UserModel(
          id: cerdential.user!.uid,
          email: cerdential.user!.email ?? '',
        ),
      );
    } catch (e) {
      return AppResult.failure(ErrorModel(code: '', message: e.toString()));
    }
  }
}
