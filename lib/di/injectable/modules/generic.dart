import 'package:boring_counter/di/injectable/all.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@module
abstract class GenericModule {
  @preResolve
  Future<Logger> getLogger() async => Logger();

  @preResolve
  Future<Uuid> getUuidGenerator() async => const Uuid();

  @Environment(EnvironmentName.development)
  @Environment(EnvironmentName.staging)
  @Environment(EnvironmentName.production)
  @preResolve
  Future<SharedPreferences> getPreferences() => SharedPreferences.getInstance();
}
