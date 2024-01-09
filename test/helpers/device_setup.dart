import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const monitor4kSize = Size(3840, 2160);
const monitor4kPixelRatio = 1.0;
const nexus6Size = Size(1440, 2560);
const nexus6PixelRatio = 3.5;

extension SetupDeviceScreen on WidgetTester {
  void setup4kMonitorScreen() => _setupDeviceScreen(
        monitor4kSize,
        monitor4kPixelRatio,
      );

  void setupNexusScreen() => _setupDeviceScreen(nexus6Size, nexus6PixelRatio);

  void _setupDeviceScreen(Size size, double devicePixelRatio) {
    binding.window.physicalSizeTestValue = size;
    binding.window.devicePixelRatioTestValue = devicePixelRatio;
  }

  void clearScreenSetup() => addTearDown(
        binding.window.clearPhysicalSizeTestValue,
      );
}
