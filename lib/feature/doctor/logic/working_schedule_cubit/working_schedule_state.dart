// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tabib/feature/doctor/data/model/working_day_model.dart';

class WorkingScheduleState {
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final List<WorkingDayModel> workingDays;
  final List<int> selectedorkingDays;

  WorkingScheduleState({
    this.startTime,
    this.endTime,
    required this.workingDays,
    required this.selectedorkingDays,
  });

  WorkingScheduleState copyWith({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    List<WorkingDayModel>? workingDays,
    List<int>? selectedorkingDays,
  }) {
    return WorkingScheduleState(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      workingDays: workingDays ?? this.workingDays,
      selectedorkingDays: selectedorkingDays ?? this.selectedorkingDays,
    );
  }
}
