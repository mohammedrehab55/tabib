import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/feature/doctor/data/model/working_day_model.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_cubit.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_state.dart';
import 'package:tabib/feature/doctor/view/widgets/expanded_working_schedule_row.dart';

class BuildWorkingScheduleRow extends StatefulWidget {
  final int workingDayIndex;
  const BuildWorkingScheduleRow({super.key, required this.workingDayIndex});

  @override
  State<BuildWorkingScheduleRow> createState() =>
      _BuildWorkingScheduleRowState();
}

class _BuildWorkingScheduleRowState extends State<BuildWorkingScheduleRow> {
  bool toggleValue = false;
  bool isExpanded = false;
  final TimeOfDay time = TimeOfDay.now();
  String timeString(TimeOfDay time) =>
      '${time.hour}:${time.minute} ${time.period.name.toUpperCase()}';
  @override
  Widget build(BuildContext context) {
    final WorkingDayModel workingDay = context
        .read<WorkingScheduleCubit>()
        .state
        .workingDays[widget.workingDayIndex];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lighGrey, width: 1.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Transform.scale(
                scale: .6,
                child: Switch(
                  activeThumbColor: Colors.white,
                  activeTrackColor: ColorManager.mainBlue,
                  inactiveTrackColor: Colors.grey.shade300,
                  value: toggleValue,
                  onChanged: (value) {
                    setState(() {
                      toggleValue = value;

                      context.read<WorkingScheduleCubit>().addWorkingDay(
                        widget.workingDayIndex,
                      );
                    });
                  },
                ),
              ),

              //SizedBox(width: 6.w),
              SizedBox(
                width: 75.w,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  weekDays[workingDay.dayNumber - 1],
                  style: toggleValue
                      ? TextStyles.font16BlacMedium
                      : TextStyles.font16BlacMedium.copyWith(
                          color: ColorManager.grey,
                        ),
                ),
              ),

              // SizedBox(width: 6.w),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  width: 140,
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    color: ColorManager.lighGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${timeString(workingDay.startTime ?? TimeOfDay.now())} - ${timeString(workingDay.endTime ?? TimeOfDay.now())}',
                      style: TextStyles.font12BlacMedium.copyWith(
                        color: toggleValue ? Colors.black : ColorManager.grey,
                      ),
                    ),
                  ),
                ),
              ),
              isExpanded
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = false;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_up_outlined),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      icon: Icon(Icons.chevron_right),
                    ),
            ],
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            // alignment: Alignment.topCenter,
            child: isExpanded
                ? ExpandedWorkingScheduleRow(
                    workingDayIndex: widget.workingDayIndex,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

const weekDays = [
  'Saturday',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
];
