import 'package:flutter/material.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class AppTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  const AppTextFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.isObscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: ColorManager.lighGrey,
        hintText: hintText,
        hintStyle: TextStyles.font14GreyMedium,
        fillColor: ColorManager.ligherGrey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1.2, color: ColorManager.lighGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1.2, color: ColorManager.lighGrey),
        ),
      ),
    );
  }
}
