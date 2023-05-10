import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/presentation/counter/counter.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:injectable/injectable.dart';

@Environment(EnvironmentName.tests)
@Singleton(as: CounterCubit)
class MockCounterCubit extends MockCubit<UiCounter?> implements CounterCubit {}
