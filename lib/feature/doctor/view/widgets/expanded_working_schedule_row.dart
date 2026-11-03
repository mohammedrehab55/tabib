import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/theme/button_styles.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_cubit.dart';

class ExpandedWorkingScheduleRow extends StatelessWidget {
  final int workingDayIndex;
  ExpandedWorkingScheduleRow({super.key, required this.workingDayIndex});

  TimeOfDay? startTime;

  TimeOfDay? endTime;

  Widget _buildReadTimeContainer(void Function()? onTap, TimeOfDay time) {
    final timeString =
        '${time.hour}:${time.minute} ${time.period.name.toUpperCase()}';
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.lighGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Icon(Icons.timelapse_rounded),
              SizedBox(width: 16.w),
              Text(timeString, style: TextStyles.font16BlacMedium),
              Spacer(),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<TimeOfDay?> timeShowPicker() async => await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(timePickerTheme: ButtonStyles.timePickerThemeData),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: ColorManager.lighGrey),
            SizedBox(height: 6.h),
            Text('Start Time', style: TextStyles.font14GreyMedium),
            SizedBox(height: 6.h),
            //Update Start Time
            _buildReadTimeContainer(
              () async {
                startTime = await timeShowPicker();
                debugPrint('Start TIme : $startTime');
                context.read<WorkingScheduleCubit>().updateStartTime(
                  startTime!,
                  workingDayIndex,
                );
              },
              context
                      .read<WorkingScheduleCubit>()
                      .state
                      .workingDays[workingDayIndex]
                      .startTime ??
                  TimeOfDay.now(),
            ),
            SizedBox(height: 12.h),
            Text('Start Time', style: TextStyles.font14GreyMedium),
            SizedBox(height: 6.h),

            //Update End Time
            _buildReadTimeContainer(
              () async {
                endTime = await timeShowPicker();

                context.read<WorkingScheduleCubit>().updateEndTime(
                  endTime!,
                  workingDayIndex,
                );
              },
              context
                      .read<WorkingScheduleCubit>()
                      .state
                      .workingDays[workingDayIndex]
                      .endTime ??
                  TimeOfDay.now(),
            ),
          ],
        ),
      ),
    );
  }
}
