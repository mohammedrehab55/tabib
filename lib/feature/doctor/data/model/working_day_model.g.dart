// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingDayModel _$WorkingDayModelFromJson(Map<String, dynamic> json) =>
    WorkingDayModel(
      dayNumber: (json['dayNumber'] as num).toInt(),
      startTime: const TimeOfDayConverter().fromJson(
        json['startTime'] as String?,
      ),
      endTime: const TimeOfDayConverter().fromJson(json['endTime'] as String?),
    );

Map<String, dynamic> _$WorkingDayModelToJson(WorkingDayModel instance) =>
    <String, dynamic>{
      'dayNumber': instance.dayNumber,
      'startTime': const TimeOfDayConverter().toJson(instance.startTime),
      'endTime': const TimeOfDayConverter().toJson(instance.endTime),
    };
