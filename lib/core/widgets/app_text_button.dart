import 'package:flutter/material.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(ColorManager.mainBlue),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 52)),
      ),
      child: Text(title, style: TextStyles.font16WhiteSemiBold),
    );
  }
}
