import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class DoctorInformationRow extends StatelessWidget {
  final String title;
  final String? value;
  final bool largeSpace;
  const DoctorInformationRow({
    this.largeSpace = false,
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: largeSpace ? 130.w : 80.h,
          child: Text(
            title,
            style: TextStyles.font14GreyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 16.w),
        Text(value ?? '', style: TextStyles.font14BlacMedium),
      ],
    );
  }
}
