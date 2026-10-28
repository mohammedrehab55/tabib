import 'package:flutter/material.dart';

import 'package:tabib/core/theme/texts_styles.dart';

class AleradyHaveAccountText extends StatelessWidget {
  const AleradyHaveAccountText({super.key});

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
          TextSpan(text: ' Sign Up', style: TextStyles.font13BlueSemiBold),
        ],
      ),
    );
  }
}//Already have an account yet? Sign Up