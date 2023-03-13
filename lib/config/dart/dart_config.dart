import 'package:boring_counter/config/dart/configure_non_web.dart'
    if (dart.library.html) 'package:boring_counter/config/dart/configure_web.dart';

Future<void> configureDartEnvironment() async {
  configureUrlStrategy();
}
