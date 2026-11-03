import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/core/di/di.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/feature/auth/modules/login/logic/auth_cubit.dart';
import 'package:tabib/feature/auth/modules/login/view/login_screen.dart';
import 'package:tabib/feature/auth/modules/signup/logic/signup_cubit.dart';
import 'package:tabib/feature/auth/modules/signup/view/signup_screen.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_cubit.dart';
import 'package:tabib/feature/doctor/view/screens/doctor_professional_information_screen.dart';
import 'package:tabib/feature/doctor/view/screens/doctor_working_schedule_screen.dart';
import 'package:tabib/feature/doctor/view/screens/personal_information_screen.dart';
import 'package:tabib/feature/doctor/view/screens/review_doctor_information_page.dart';
import 'package:tabib/feature/home/view/screen/home_screen.dart';

class AppRouter {
  Route onGenrateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.doctorPersonalInformationRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DoctorInformationCubit>(),
            child: DoctorPersonalInformationScreen(),
          ),
        );
      case Routes.doctorProfessionalInformationRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => getIt<DoctorInformationCubit>(),
            child: DoctorProfessionalnformationScreen(),
          ),
        );
      case Routes.doctorWorkingScheduleRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<WorkingScheduleCubit>(),
            child: DoctorWorkingScheduleScreen(),
          ),
        );
      case Routes.reviewInformationRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<DoctorInformationCubit>(),
              ),
              BlocProvider(create: (context) => getIt<WorkingScheduleCubit>()),
            ],
            child: ReviewDoctorInformationPage(),
          ),
        );
      case Routes.signInRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(child: Text('Can\'t find ${setting.name} route')),
          ),
        );
    }
  }
}
