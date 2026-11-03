import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:tabib/feature/auth/data/repo/auth_repo.dart';
import 'package:tabib/feature/auth/modules/login/logic/auth_cubit.dart';
import 'package:tabib/feature/auth/modules/signup/logic/signup_cubit.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_cubit.dart';

final getIt = GetIt.instance;

class DI {
  Future<void> setupGetIt() async {
    getIt.registerLazySingleton(() => FirebaseAuth.instance);
    getIt.registerLazySingleton(() => AuthRepo(auth: getIt<FirebaseAuth>()));
    getIt.registerFactory(() => AuthCubit(repo: getIt<AuthRepo>()));
    getIt.registerFactory(() => SignupCubit(auth: getIt<AuthRepo>()));
    getIt.registerLazySingleton(() => DoctorInformationCubit());
    getIt.registerLazySingleton(() => WorkingScheduleCubit());
  }
}
