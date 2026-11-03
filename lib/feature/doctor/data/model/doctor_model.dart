import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final String name;
  final String id;
  final String address;
  final String specialist;
  final int yearsOfExperience;
  final int consultationDuration;
  final double consultationFee;

  DoctorModel({
    required this.name,
    required this.id,
    required this.address,
    required this.specialist,
    required this.yearsOfExperience,
    required this.consultationDuration,
    required this.consultationFee,
  });

  //factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  factory DoctorModel.fromJson(Map<String, dynamic> map) =>
      _$DoctorModelFromJson(map);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}

const List<String> medicalSpecialties = [
  'Cardiology', // القلب
  'Dermatology', // الجلدية
  'Dentistry', // الأسنان
  'Pediatrics', // الأطفال
  'Orthopedics', // العظام
  'Ophthalmology', // العيون
  'Otolaryngology (ENT)', // الأنف والأذن والحنجرة
  'Neurology', // المخ والأعصاب
  'Neurosurgery', // جراحة المخ والأعصاب
  'Psychiatry', // الطب النفسي
  'Urology', // المسالك البولية
  'Gynecology', // النساء والتوليد
  'Obstetrics', // التوليد
  'General Surgery', // الجراحة العامة
  'Internal Medicine', // الباطنة
  'Pediatrics Surgery', // جراحة الأطفال
  'Oncology', // الأورام
  'Endocrinology', // الغدد الصماء
  'Gastroenterology', // الجهاز الهضمي
  'Nephrology', // الكلى
  'Pulmonology', // الأمراض الصدرية
  'Rheumatology', // الروماتيزم
  'Cardiothoracic Surgery', // جراحة القلب والصدر
  'Vascular Surgery', // جراحة الأوعية الدموية
  'Plastic Surgery', // جراحة التجميل
  'Anesthesiology', // التخدير
  'Radiology', // الأشعة
  'Pathology', // الباثولوجيا
  'Family Medicine', // طب الأسرة
  'Emergency Medicine', // طب الطوارئ
  'Physical Medicine', // الطب الطبيعي والتأهيل
  'Nutrition', // التغذية العلاجية
];
