import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _InitialState;
  const factory SplashState.loading() = _LoadingState;
  const factory SplashState.ready() = _ReadyState;
}
