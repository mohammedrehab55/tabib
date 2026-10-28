import 'package:flutter/material.dart';
import 'package:tabib/core/routing/app_router.dart';

class Tabib extends StatelessWidget {
  final AppRouter router;
  const Tabib({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text('....HomePage!!!'));
  }
}
