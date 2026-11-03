import 'package:flutter/material.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class ButtonStyles {
  static ButtonStyle timePickerButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(ColorManager.mainBlue),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    textStyle: WidgetStatePropertyAll(TextStyles.font16WhiteSemiBold),
  );

  static TimePickerThemeData timePickerThemeData = TimePickerThemeData(
    cancelButtonStyle: ButtonStyles.timePickerButtonStyle,
    confirmButtonStyle: ButtonStyles.timePickerButtonStyle,
    dayPeriodColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      }
      return Colors.white; // Unselected AM / PM
    }),

    dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.grey; // Unselected text
    }),

    dayPeriodTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),

    backgroundColor: Colors.white,

    // AM / PM
    // dayPeriodColor: ColorManager.mainBlue,
    // dayPeriodTextColor: Colors.white,

    // Clock
    dialBackgroundColor: Colors.grey.shade100,
    dialHandColor: ColorManager.mainBlue,

    // Selected hour/minute
    hourMinuteColor: ColorManager.mainBlue,
    hourMinuteTextColor: Colors.white,

    // Shape
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
