import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/feature/doctor/logic/doctor_information_cubit/doctor_information_state.dart';

class DoctorInformationCubit extends Cubit<DoctorInformationState> {
  DoctorInformationCubit() : super(DoctorInformationState());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController consultationDurationController =
      TextEditingController();
  TextEditingController consultationFeeController = TextEditingController();

  void updatePersonalInformation(
    String fullName,
    String phoneNumber,
    String address,
  ) {
    debugPrint('''
fullName : $fullName , \n
phoneNumber : $phoneNumber , \n
address : $address , \n

''');
    emit(
      state.copyWith(
        fullName: fullName,
        phoneNumber: phoneNumber,
        address: address,
      ),
    );
  }

  void updateProfessionalInformation(
    String specialist,
    int yearsOfExperience,
    int consultationDuration,
    double consultationFee,
  ) {
    debugPrint('''
specialist : $specialist , \n
yearsOfExperience : $yearsOfExperience , \n
consultationDuration : $consultationDuration , \n
consultationFee : $consultationFee , \n

''');
    emit(
      state.copyWith(
        specialist: specialist,
        yearsOfExperience: yearsOfExperience,
        consultationDuration: consultationDuration,
        consultationFee: consultationFee,
      ),
    );
  }
}
