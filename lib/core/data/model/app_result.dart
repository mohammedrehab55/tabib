import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabib/core/data/model/error_model.dart';
part 'app_result.freezed.dart';

@Freezed()
abstract class AppResult<T> with _$AppResult<T> {
  factory AppResult.success(T data) = Success<T>;

  factory AppResult.failure(ErrorModel error) = Failure<T>;
}
