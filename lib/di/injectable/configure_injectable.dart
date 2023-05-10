import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/di/injectable/configure_injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies({
  String environment = EnvironmentName.development,
}) =>
    init(
      getIt,
      environment: environment,
    );
