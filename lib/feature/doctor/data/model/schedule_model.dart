import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabib/feature/doctor/data/model/working_day_model.dart';
import 'package:uuid/uuid.dart';
part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  final String id;
  final String doctorId;
  final List<WorkingDayModel> workingDays;

  ScheduleModel({String? id, required this.doctorId, required this.workingDays})
    : id = id ?? Uuid().v4();

  factory ScheduleModel.fromJson(Map<String, dynamic> map) =>
      _$ScheduleModelFromJson(map);
  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}
