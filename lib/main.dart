import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tabib/core/di/di.dart';
import 'package:tabib/core/routing/app_router.dart';
import 'package:tabib/firebase_options.dart';
import 'package:tabib/tabib.dart';

bool isLogged = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await FirebaseAuth.instance.signOut();
  checkIsLogged();
  await DI().setupGetIt();
  runApp(Tabib(router: AppRouter()));
}

void checkIsLogged() {
  debugPrint(FirebaseAuth.instance.currentUser.toString());
  isLogged = FirebaseAuth.instance.currentUser == null ? false : true;
}
