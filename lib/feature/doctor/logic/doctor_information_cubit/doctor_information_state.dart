// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorInformationState {
  final String? fullName;
  final String? id;
  final String? address;
  final String? phoneNumber;
  final String? specialist;
  final int? yearsOfExperience;
  final int? consultationDuration;
  final double? consultationFee;

  DoctorInformationState({
    this.phoneNumber,
    this.fullName,
    this.id,
    this.address,
    this.specialist,
    this.yearsOfExperience,
    this.consultationDuration,
    this.consultationFee,
  });

  DoctorInformationState copyWith({
    String? fullName,
    String? id,
    String? address,
    String? phoneNumber,
    String? specialist,
    int? yearsOfExperience,
    int? consultationDuration,
    double? consultationFee,
  }) {
    return DoctorInformationState(
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      specialist: specialist ?? this.specialist,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      consultationDuration: consultationDuration ?? this.consultationDuration,
      consultationFee: consultationFee ?? this.consultationFee,
    );
  }
}
