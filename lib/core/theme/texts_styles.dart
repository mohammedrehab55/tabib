import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/helper/font_weigh_helper.dart';
import 'package:tabib/core/theme/color_manager.dart';

class TextStyles {
  static TextStyle font24BlueBold = TextStyle(
    color: ColorManager.mainBlue,
    fontSize: 24.sp,
    fontWeight: FontWeighHelper.bold,
  );
  static TextStyle font14GreyRegular = TextStyle(
    color: ColorManager.grey,
    fontSize: 14.sp,
    fontWeight: FontWeighHelper.regular,
  );
  static TextStyle font12BlueRegular = TextStyle(
    color: ColorManager.mainBlue,
    fontSize: 12.sp,
    fontWeight: FontWeighHelper.regular,
  );
  static TextStyle font14GreyMedium = TextStyle(
    color: ColorManager.silverGrey,
    fontSize: 14.sp,
    fontWeight: FontWeighHelper.medium,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeighHelper.semibold,
  );
  static TextStyle font13BlueSemiBold = TextStyle(
    color: ColorManager.mainBlue,
    fontSize: 13.sp,
    fontWeight: FontWeighHelper.semibold,
  );
}
