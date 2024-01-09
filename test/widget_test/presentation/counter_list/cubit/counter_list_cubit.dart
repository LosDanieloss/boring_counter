import 'package:bloc_test/bloc_test.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:injectable/injectable.dart';

@Environment(EnvironmentName.tests)
@Singleton(as: CounterListCubit)
class MockCounterListCubit extends MockCubit<CounterListState>
    implements CounterListCubit {}
