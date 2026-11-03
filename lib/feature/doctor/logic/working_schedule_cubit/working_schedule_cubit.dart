import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/feature/doctor/data/model/working_day_model.dart';
import 'package:tabib/feature/doctor/logic/working_schedule_cubit/working_schedule_state.dart';

class WorkingScheduleCubit extends Cubit<WorkingScheduleState> {
  WorkingScheduleCubit()
    : super(
        WorkingScheduleState(workingDays: workingDays, selectedorkingDays: []),
      );

  void updateStartTime(TimeOfDay time, int index) {
    final List<WorkingDayModel> updatedList = [...state.workingDays];

    updatedList[index] = state.workingDays[index].copyWith(startTime: time);
    emit(state.copyWith(workingDays: updatedList));
  }

  void updateEndTime(TimeOfDay time, int index) {
    final List<WorkingDayModel> updatedList = [...state.workingDays];

    updatedList[index] = state.workingDays[index].copyWith(endTime: time);
    emit(state.copyWith(workingDays: updatedList));
  }

  void addWorkingDay(int workingDayIndex) {
    List<int> selectedDays = [...state.selectedorkingDays];

    int dayIndex = selectedDays.indexWhere((index) => workingDayIndex == index);

    if (dayIndex == -1) {
      selectedDays = [...state.selectedorkingDays, workingDayIndex];
    }

    emit(state.copyWith(selectedorkingDays: selectedDays));
  }
}
