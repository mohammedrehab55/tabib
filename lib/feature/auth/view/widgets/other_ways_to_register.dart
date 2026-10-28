import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabib/core/theme/color_manager.dart';

class OtherWaysToRegister extends StatelessWidget {
  const OtherWaysToRegister({super.key});
  Widget _buidIconContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 45,
      width: 45,

      decoration: BoxDecoration(
        color: ColorManager.lighGrey,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buidIconContainer(SvgPicture.asset('assets/svgs/google.svg')),
        SizedBox(width: 30.w),
        _buidIconContainer(SvgPicture.asset('assets/svgs/facebook.svg')),
        SizedBox(width: 30.w),
        _buidIconContainer(SvgPicture.asset('assets/svgs/apple.svg')),
      ],
    );
  }
}
