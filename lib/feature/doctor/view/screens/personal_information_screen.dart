import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/core/widgets/app_text_button.dart';
import 'package:tabib/core/widgets/step_progress_indecator.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';
import 'package:tabib/feature/doctor/view/widgets/build_add_profile_photo_widget.dart';
import 'package:tabib/feature/doctor/view/widgets/personal_information_form.dart';

class DoctorPersonalInformationScreen extends StatelessWidget {
  DoctorPersonalInformationScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorInformationCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepProgressIndicator(currentStep: 1),
                SizedBox(height: 8.h),
                Text('Personal Information', style: TextStyles.font24BlacBold),
                SizedBox(height: 8.h),
                Text(
                  'Let\'s start with basic information.',
                  style: TextStyles.font14GreyMedium,
                ),
                SizedBox(height: 20.h),
                Align(child: const BuildAddProfilePhotoWidget()),

                SizedBox(height: 30.h),
                PersonalInformationForm(formKey: formKey),
                SizedBox(height: 50.h),
                AppTextButton(
                  title: 'Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.updatePersonalInformation(
                        cubit.fullNameController.text,
                        cubit.phoneNumberController.text,
                        cubit.addressController.text,
                      );
                      Navigator.pushNamed(
                        context,
                        Routes.doctorProfessionalInformationRoute,
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
