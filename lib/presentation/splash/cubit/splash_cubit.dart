import 'package:bloc/bloc.dart';
import 'package:boring_counter/presentation/splash/cubit/splash_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  Future<void> initializeApp() async {
    emit(const SplashState.loading());
    await Future.wait(
      [
        _initializeAllThings(),
        _minSplashTime(),
      ],
    );
    emit(const SplashState.ready());
  }

  Future<void> _initializeAllThings() async {
    await _initializeFirstThing();
    await _initializeSecondThing();
  }

  Future<void> _initializeFirstThing() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {},
    );
  }

  Future<void> _initializeSecondThing() async {}

  Future<void> _minSplashTime() => Future.delayed(
        const Duration(
          milliseconds: 300,
        ),
      );
}
