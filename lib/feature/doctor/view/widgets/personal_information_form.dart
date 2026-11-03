import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/widgets/app_text_form_filed.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';

class PersonalInformationForm extends StatelessWidget {
  final GlobalKey formKey;
  const PersonalInformationForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorInformationCubit>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter correct fullName';
              }
              return null;
            },
            hintText: 'FullName',
            controller: cubit.fullNameController,
          ),
          // SizedBox(height: 12.h),
          // AppTextFormFiled(hintText: 'Email', controller: fullNameController),
          SizedBox(height: 12.h),
          AppTextFormFiled(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter correct phone number';
              }
              return null;
            },
            hintText: 'Phone Number',
            controller: cubit.phoneNumberController,
          ),
          SizedBox(height: 12.h),
          AppTextFormFiled(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter correct address';
              }
              return null;
            },
            hintText: 'Address',
            controller: cubit.addressController,
          ),
        ],
      ),
    );
  }
}
