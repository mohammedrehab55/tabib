import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/widgets/app_text_form_filed.dart';
import 'package:tabib/feature/doctor/data/model/doctor_model.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_cubit.dart';

class ProfessionalInformationForm extends StatefulWidget {
  final GlobalKey formKey;
  const ProfessionalInformationForm({super.key, required this.formKey});

  @override
  State<ProfessionalInformationForm> createState() =>
      _ProfessionalInformationFormState();
}

class _ProfessionalInformationFormState
    extends State<ProfessionalInformationForm> {
  String? selectedSpecialist;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorInformationCubit>();
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  selectedSpecialist == null) {
                return 'Please enter a correct specialist';
              }
              return null;
            },
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: (specialist) {
                debugPrint(specialist);
                setState(() {
                  cubit.specialistController.text = specialist;
                  selectedSpecialist = specialist;
                });
                // Update selected day
              },
              itemBuilder: (context) {
                return medicalSpecialties.map((day) {
                  return PopupMenuItem<String>(value: day, child: Text(day));
                }).toList();
              },
            ),
            hintText: selectedSpecialist ?? 'Specialist',
            controller: cubit.specialistController,
          ),
          SizedBox(height: 30.h),
          AppTextFormFiled(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a correct number of years';
              }
              return null;
            },
            keyboardType: TextInputType.numberWithOptions(),
            hintText: 'Years of Experience',
            controller: cubit.yearsOfExperienceController,
          ),
          SizedBox(height: 30.h),
          AppTextFormFiled(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  selectedSpecialist == null) {
                return 'Please enter a correct consultation duration ';
              }
              return null;
            },
            keyboardType: TextInputType.numberWithOptions(),
            hintText: 'Consultation Duration',
            controller: cubit.consultationDurationController,
          ),
          SizedBox(height: 30.h),
          AppTextFormFiled(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  selectedSpecialist == null) {
                return 'Please enter a correct consultation fee';
              }
              return null;
            },
            keyboardType: TextInputType.numberWithOptions(),
            hintText: 'Consultation Fee',
            controller: cubit.consultationFeeController,
          ),
        ],
      ),
    );
  }
}
