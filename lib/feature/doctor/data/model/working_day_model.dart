// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tabib/core/helper/time_of_day_converter.dart';

part 'working_day_model.g.dart';

@JsonSerializable()
class WorkingDayModel {
  final int dayNumber;
  @TimeOfDayConverter()
  final TimeOfDay? startTime;
  @TimeOfDayConverter()
  final TimeOfDay? endTime;

  WorkingDayModel({required this.dayNumber, this.startTime, this.endTime});

  factory WorkingDayModel.fromJson(Map<String, dynamic> map) =>
      _$WorkingDayModelFromJson(map);
  Map<String, dynamic> toJson() => _$WorkingDayModelToJson(this);

  WorkingDayModel copyWith({
    int? dayNumber,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return WorkingDayModel(
      dayNumber: dayNumber ?? this.dayNumber,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}

List<WorkingDayModel> workingDays = [
  WorkingDayModel(
    dayNumber: 1,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  WorkingDayModel(
    dayNumber: 2,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  WorkingDayModel(
    dayNumber: 3,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  WorkingDayModel(
    dayNumber: 4,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  WorkingDayModel(
    dayNumber: 5,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  WorkingDayModel(
    dayNumber: 6,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  WorkingDayModel(
    dayNumber: 7,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
];
