import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.success() = Success;
  const factory SignupState.loading() = Loading;
  const factory SignupState.failure(String errorMessage) = Failure;
}
