import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/app_router.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/main.dart';

class Tabib extends StatelessWidget {
  final AppRouter router;
  const Tabib({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        onGenerateRoute: router.onGenrateRoute,
        initialRoute: isLogged ? Routes.homePageRoute : Routes.loginRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}
