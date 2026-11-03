// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  name: json['name'] as String,
  id: json['id'] as String,
  address: json['address'] as String,
  specialist: json['specialist'] as String,
  yearsOfExperience: (json['yearsOfExperience'] as num).toInt(),
  consultationDuration: (json['consultationDuration'] as num).toInt(),
  consultationFee: (json['consultationFee'] as num).toDouble(),
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'address': instance.address,
      'specialist': instance.specialist,
      'yearsOfExperience': instance.yearsOfExperience,
      'consultationDuration': instance.consultationDuration,
      'consultationFee': instance.consultationFee,
    };
