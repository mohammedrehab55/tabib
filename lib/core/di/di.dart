import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:tabib/feature/auth/data/repo/auth_repo.dart';
import 'package:tabib/feature/auth/logic/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

class DI {
  Future<void> setupGetIt() async {
    getIt.registerLazySingleton(() => FirebaseAuth.instance);
    getIt.registerLazySingleton(() => AuthRepo(auth: getIt<FirebaseAuth>()));
    getIt.registerFactory(() => AuthCubit(repo: getIt<AuthRepo>()));
  }
}
