import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/feature/doctor/view/widgets/doctor_information_row.dart';

class PersonalInformationReview extends StatelessWidget {
  final String? fulllName;
  final String? phoneNumber;
  final String? address;

  const PersonalInformationReview({
    super.key,
    required this.fulllName,
    required this.phoneNumber,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, Routes.doctorPersonalInformationRoute),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        height: size.height * .20,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lighGrey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal Information', style: TextStyles.font16BlacMedium),
            SizedBox(height: 8.h),
            DoctorInformationRow(title: 'Name', value: 'Dr.$fulllName'),
            SizedBox(height: 8.h),
            DoctorInformationRow(title: 'Phone', value: '+2$phoneNumber'),
            SizedBox(height: 8.h),
            DoctorInformationRow(title: 'Address', value: address),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
