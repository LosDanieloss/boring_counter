import 'package:boring_counter/di/injectable/all.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  asExtension: false,
  generateForDir: ['lib', 'test']
)
Future<void> configureDependencies({
  String environment = EnvironmentName.tests,
}) =>
    init(
      getIt,
      environment: environment,
    );
