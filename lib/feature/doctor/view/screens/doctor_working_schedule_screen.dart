import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/core/widgets/app_text_button.dart';
import 'package:tabib/core/widgets/step_progress_indecator.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_cubit.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_state.dart';
import 'package:tabib/feature/doctor/view/widgets/build_working_schedule_row.dart';

class DoctorWorkingScheduleScreen extends StatelessWidget {
  const DoctorWorkingScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepProgressIndicator(currentStep: 3),
                SizedBox(height: 8.h),
                Text('Working Schedule', style: TextStyles.font24BlacBold),
                SizedBox(height: 8.h),
                Text(
                  'Select the days and hours you are avaliable .',
                  style: TextStyles.font14GreyMedium,
                ),

                BlocBuilder<WorkingScheduleCubit, WorkingScheduleState>(
                  builder: (context, state) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BuildWorkingScheduleRow(workingDayIndex: index);
                      },
                      itemCount: state.workingDays.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 8.h);
                      },
                    );
                  },
                ),

                SizedBox(height: 16.h),
                AppTextButton(
                  title: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.reviewInformationRoute);
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
