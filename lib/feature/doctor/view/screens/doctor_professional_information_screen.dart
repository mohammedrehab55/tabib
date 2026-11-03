import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/core/widgets/app_text_button.dart';
import 'package:tabib/core/widgets/step_progress_indecator.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';
import 'package:tabib/feature/doctor/view/widgets/professional_information_form.dart';

class DoctorProfessionalnformationScreen extends StatelessWidget {
  DoctorProfessionalnformationScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorInformationCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepProgressIndicator(currentStep: 2),
                SizedBox(height: 8.h),
                Text(
                  'Professional Information',
                  style: TextStyles.font24BlacBold,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Tell us about professional information.',
                  style: TextStyles.font14GreyMedium,
                ),
                SizedBox(height: 30.h),

                ProfessionalInformationForm(formKey: formKey),
                SizedBox(height: 30.h),
                AppTextButton(
                  title: 'Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.updateProfessionalInformation(
                        cubit.specialistController.text,
                        int.parse(cubit.yearsOfExperienceController.text),
                        int.parse(cubit.consultationDurationController.text),
                        double.parse(cubit.consultationFeeController.text),
                      );

                      Navigator.pushNamed(
                        context,
                        Routes.doctorWorkingScheduleRoute,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
