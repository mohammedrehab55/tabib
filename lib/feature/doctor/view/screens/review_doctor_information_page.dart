import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/core/widgets/app_text_button.dart';
import 'package:tabib/core/widgets/step_progress_indecator.dart';
import 'package:tabib/feature/doctor/data/model/working_day_model.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_state.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_cubit.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_state.dart';
import 'package:tabib/feature/doctor/view/widgets/personal_information_review.dart';
import 'package:tabib/feature/doctor/view/widgets/professional_information_review.dart';
import 'package:tabib/feature/doctor/view/widgets/working_schedule_review.dart';

class ReviewDoctorInformationPage extends StatelessWidget {
  const ReviewDoctorInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepProgressIndicator(currentStep: 4),
                SizedBox(height: 8.h),
                Text(
                  'Review Your Information',
                  style: TextStyles.font24BlacBold,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Please review Your information.',
                  style: TextStyles.font14GreyMedium,
                ),
                SizedBox(height: 8.h),
                BlocBuilder<DoctorInformationCubit, DoctorInformationState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        PersonalInformationReview(
                          fulllName: state.fullName,
                          phoneNumber: state.phoneNumber,
                          address: state.address,
                        ),
                        SizedBox(height: 16.h),
                        ProfessionalInformationReview(
                          specialist: state.specialist,
                          yearsOfExperience: state.yearsOfExperience.toString(),
                          consultationDuration: state.consultationDuration
                              .toString(),
                          consultationFee: state.consultationFee.toString(),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 16.h),
                BlocBuilder<WorkingScheduleCubit, WorkingScheduleState>(
                  builder: (context, state) {
                    final list = state.selectedorkingDays;
                    List<WorkingDayModel> selectedDays = [];
                    list.forEach((index) {
                      debugPrint('Day Index : $index');
                      selectedDays.add(workingDays[index]);
                    });

                    return WorkingScheduleReview(workingDays: selectedDays);
                  },
                ),
                SizedBox(height: 16.h),
                AppTextButton(
                  title: 'Submit',
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.homePageRoute),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
