import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class SignInWithText extends StatelessWidget {
  const SignInWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(indent: 2, endIndent: 2, color: ColorManager.grey),
        ),
        SizedBox(width: 2.w),
        Text('Or sign in with', style: TextStyles.font14GreyRegular.copyWith()),
        SizedBox(width: 2.w),
        Expanded(
          child: Divider(indent: 2, endIndent: 2, color: ColorManager.grey),
        ),
      ],
    );
  }
}
