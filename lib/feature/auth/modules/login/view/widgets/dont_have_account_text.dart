import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tabib/core/routing/routes.dart';

import 'package:tabib/core/theme/texts_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13BlueSemiBold.copyWith(color: Colors.black),
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.signInRoute,
                  (route) => false,
                );
              },
          ),
        ],
      ),
    );
  }
}//Already have an account yet? Sign Up