import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_cambio.freezed.dart';

@freezed
class HomeResultCambio<T> with _$HomeResultCambio<T> {
  factory HomeResultCambio.success(T data) = Success;
  factory HomeResultCambio.error(String message) = Error;
}
