import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/feature/doctor/data/model/working_day_model.dart';
import 'package:tabib/feature/doctor/view/widgets/build_working_schedule_row.dart';
import 'package:tabib/feature/doctor/view/widgets/doctor_information_row.dart';

class WorkingScheduleReview extends StatelessWidget {
  final List<WorkingDayModel> workingDays;
  const WorkingScheduleReview({super.key, required this.workingDays});

  @override
  Widget build(BuildContext context) {
    String timeOfDayFormate(TimeOfDay time) =>
        '${time.hour}:${time.minute} ${time.period.name.toUpperCase()}';
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, Routes.doctorWorkingScheduleRoute),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lighGrey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Working Schedule', style: TextStyles.font16BlacMedium),
            SizedBox(height: 8.h),
            ...workingDays.map((day) {
              return Column(
                children: [
                  DoctorInformationRow(
                    title: weekDays[day.dayNumber - 1],
                    value:
                        '${timeOfDayFormate(day.startTime ?? TimeOfDay.now())} - ${timeOfDayFormate(day.endTime ?? TimeOfDay.now())}',
                  ),
                  SizedBox(height: 8.h),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
