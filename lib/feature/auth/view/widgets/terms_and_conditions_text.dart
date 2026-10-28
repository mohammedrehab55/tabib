import 'package:flutter/material.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font14GreyRegular,
          ),
          TextSpan(
            text: ' Terms & Conditions ',
            style: TextStyles.font14GreyRegular.copyWith(color: Colors.black),
          ),
          TextSpan(text: 'and ', style: TextStyles.font14GreyRegular),
          TextSpan(
            text: 'PrivacyPolicy. ',
            style: TextStyles.font14GreyRegular.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
/**By logging, you agree to our  Terms & Conditions and PrivacyPolicy. */