import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/feature/doctor/view/widgets/doctor_information_row.dart';

class ProfessionalInformationReview extends StatelessWidget {
  final String? specialist;
  final String? yearsOfExperience;
  final String? consultationDuration;
  final String? consultationFee;

  const ProfessionalInformationReview({
    super.key,
    required this.specialist,
    required this.yearsOfExperience,
    required this.consultationDuration,
    required this.consultationFee,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.doctorProfessionalInformationRoute,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        height: size.height * .22,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lighGrey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Professional Information',
              style: TextStyles.font16BlacMedium,
            ),
            SizedBox(height: 8.h),
            DoctorInformationRow(
              title: 'Specialist',
              value: specialist,
              largeSpace: true,
            ),
            SizedBox(height: 8.h),
            DoctorInformationRow(
              largeSpace: true,
              title: 'YearsOfExperience',
              value: '$yearsOfExperience years',
            ),
            SizedBox(height: 8.h),
            DoctorInformationRow(
              title: 'ConsultationDuration',
              value: '$consultationDuration minutes',
              largeSpace: true,
            ),
            SizedBox(height: 8.h),
            DoctorInformationRow(
              title: 'ConsultationFee',
              value: '$consultationFee EGP',
              largeSpace: true,
            ),
          ],
        ),
      ),
    );
  }
}
