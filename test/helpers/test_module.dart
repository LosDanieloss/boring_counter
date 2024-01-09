import 'package:boring_counter/di/injectable/all.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'test_module.mocks.dart';

@module
abstract class TestModule {
  @Environment(EnvironmentName.tests)
  @preResolve
  Future<SharedPreferences> getPreferences() async => MockSharedPreferences();
}


