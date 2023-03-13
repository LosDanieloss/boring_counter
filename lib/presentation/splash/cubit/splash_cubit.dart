import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:boring_counter/presentation/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  // TODO(all): add other thing to array for parallel execution
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

  // TODO(all): await other thing is method for sequential execution
  Future<void> _initializeAllThings() async {
    await _initializeFirstThing();
    await _initializeSecondThing();
  }

  // TODO(all): rename method name & implement method
  Future<void> _initializeFirstThing() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {},
    );
  }

  // TODO(all): rename method name & implement method
  Future<void> _initializeSecondThing() async {}

  Future<void> _minSplashTime() => Future.delayed(
        const Duration(
          milliseconds: 300,
        ),
      );
}
