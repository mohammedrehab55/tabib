import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildValidatationRow('At least 1 lowercase letter', hasLowerCase),

        SizedBox(height: 2.h),
        buildValidatationRow('At least 1 uppercase letter', hasUpperCase),

        SizedBox(height: 2.h),
        buildValidatationRow(
          'At least 1 special character',
          hasSpecialCharacters,
        ),

        SizedBox(height: 2.h),
        buildValidatationRow('At least 1 number', hasNumber),
        SizedBox(height: 2.h),
        buildValidatationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidatationRow(String text, bool isVaild) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: ColorManager.grey),
        SizedBox(width: 6.w),

        Text(
          text,
          style: TextStyles.font13BlueSemiBold.copyWith(
            decorationColor: Colors.green,
            decorationThickness: 2,
            decoration: isVaild ? TextDecoration.lineThrough : null,
            color: isVaild ? ColorManager.grey : ColorManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
