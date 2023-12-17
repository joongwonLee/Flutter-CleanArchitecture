/// Freezed 라이브러리 사용하면 Result 만들 수 있음

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String e) = Error;
}

// abstract class Result<T> {
//   factory Result.success(T data) = Success;
//   factory Result.error(String message) = Error;
// }
//
// class Success<T> implements Result<T> {
//   final T data;
//   Success(this.data);
// }
//
// class Error<T> implements Result<T> {
//   final String message;
//   Error(this.message);
// }