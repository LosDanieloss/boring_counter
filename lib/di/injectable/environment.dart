import 'package:injectable/injectable.dart';

class EnvironmentName {
  static const development = 'development';
  static const staging = 'staging';
  static const production = 'production';
}

const development = Environment(EnvironmentName.development);
const staging = Environment(EnvironmentName.staging);
const production = Environment(EnvironmentName.production);
