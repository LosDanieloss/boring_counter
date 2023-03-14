import 'package:boring_counter/presentation/counter_list/view/multiple_tap_gesture_detector.dart';
import 'package:flutter/material.dart';

class CounterListPage extends StatelessWidget {
  const CounterListPage({super.key});

  static const path = 'home';

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      // TODO(daniel): check if opaque behavior is needed after widget tree is done
      behavior: HitTestBehavior.opaque,
      gestures: {
        MultipleTapGestureRecognizer: MultipleTapGestureRecognizerFactory(
          MultipleTapGestureRecognizer.new,
          (MultipleTapGestureRecognizer instance) => {
            instance.onMultipleTap = (additionalFingersCount) {
              print(
                'MultipleTapGestureRecognizer recognized tap with'
                ' $additionalFingersCount additional fingers',
              );
            }
          },
        ),
      },
      child: const Placeholder(),
    );
  }
}
