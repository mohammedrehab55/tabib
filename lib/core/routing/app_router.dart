import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/core/di/di.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/feature/auth/logic/cubit/auth_cubit.dart';
import 'package:tabib/feature/auth/view/screens/login_screen.dart';
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
      case Routes.signInRoute:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('User not authed'))),
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
