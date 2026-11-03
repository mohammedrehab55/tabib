import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabib/core/helper/time_of_day_converter.dart';
import 'package:uuid/uuid.dart';

part 'slot_model.g.dart';

@JsonSerializable()
class SlotModel {
  static const uuid = Uuid();
  final String id;
  final String doctorId;
  @TimeOfDayConverter()
  final TimeOfDay startAt;
  @TimeOfDayConverter()
  final TimeOfDay endAt;
  final DateTime date;
  final SlotStatus status;

  SlotModel({
    String? id,
    required this.doctorId,
    required this.startAt,
    required this.endAt,
    required this.date,
    this.status = SlotStatus.available,
  }) : id = uuid.v4();

  factory SlotModel.fromJson(Map<String, dynamic> map) =>
      _$SlotModelFromJson(map);
  Map<String, dynamic> toJson() => _$SlotModelToJson(this);
}

enum SlotStatus { available, booked, cancelled }
