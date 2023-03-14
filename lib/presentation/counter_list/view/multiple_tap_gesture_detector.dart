import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

typedef Pointer = int;

typedef AdditionalFingersCount = int;

typedef MultipleTapGestureRecognizerFactory
    = GestureRecognizerFactoryWithHandlers<MultipleTapGestureRecognizer>;

typedef MultipleTapGestureCallback = void Function(
  AdditionalFingersCount additionalFingersCount,
);

class MultipleTapGestureRecognizer extends MultiTapGestureRecognizer {
  MultipleTapGestureRecognizer()
      : super(
          supportedDevices: {
            PointerDeviceKind.touch,
          },
        ) {
    onTap = _onTap;
    onTapDown = _onTapDown;
    onTapUp = _onTapUp;
  }

  static DateTime get _pointerPurgeDateTime => DateTime.now().subtract(
        const Duration(
          minutes: 4,
        ),
      );

  static DateTime get _pointerValidityDateTime => DateTime.now().subtract(
        const Duration(
          milliseconds: 500,
        ),
      );

  static const Duration _tapDelay = Duration(
    milliseconds: 300,
  );

  MultipleTapGestureCallback? onMultipleTap;

  Future<void>? _deferredTapCallback;

  final Map<Pointer, DateTime> _pointers = {};

  final Set<Pointer> _pointersToPurge = {};

  final Map<Pointer, DateTime> _pointersSnap = {};

  void _onTap(Pointer pointer) {
    if (_deferredTapCallback != null) {
      return;
    }
    final pointerTapDownTime = _pointers[pointer];
    final wasPointerDownLongerThanTapDuration = pointerTapDownTime?.isBefore(
          _pointerValidityDateTime,
        ) ??
        true;
    if (wasPointerDownLongerThanTapDuration) {
      return;
    }

    _purgePointersIfNeeded(
      pointer: pointer,
    );

    _snapPointers(
      pointers: _pointers,
    );

    _deferredTapCallback = deferTapCallback(
      pointer: pointer,
      pointersSnap: _pointersSnap,
    );
  }

  void _purgePointersIfNeeded({
    required Pointer pointer,
  }) {
    _pointers.removeWhere((key, value) {
      if (key == pointer) {
        return true;
      }
      if (_pointersToPurge.contains(key)) {
        return true;
      }
      final isPointerNoLongerRelevant = value.isBefore(
        _pointerPurgeDateTime,
      );
      if (isPointerNoLongerRelevant) {
        return true;
      }
      return false;
    });
  }

  void _snapPointers({
    required Map<Pointer, DateTime> pointers,
  }) {
    _pointersSnap
      ..removeWhere((key, value) => true)
      ..addAll(pointers);
  }

  Future<void> deferTapCallback({
    required Pointer pointer,
    required Map<Pointer, DateTime> pointersSnap,
  }) =>
      Future.delayed(
        _tapDelay,
        () {
          final additionalFingersCount = _calculateAdditionalFingersCount(
            pointer: pointer,
            pointersSnap: pointersSnap,
          );
          onMultipleTap?.call(additionalFingersCount);
        },
      ).then((value) {
        _deferredTapCallback = null;
      });

  AdditionalFingersCount _calculateAdditionalFingersCount({
    required Pointer pointer,
    required Map<Pointer, DateTime> pointersSnap,
  }) =>
      pointersSnap.containsKey(pointer)
          ? pointersSnap.length - 1
          : pointersSnap.length;

  void _onTapDown(Pointer pointer, TapDownDetails details) {
    _pointers.update(
      pointer,
      (old) => DateTime.now(),
      ifAbsent: DateTime.now,
    );
  }

  void _onTapUp(Pointer pointer, TapUpDetails details) {
    _pointersToPurge.add(pointer);
  }

  @override
  void rejectGesture(int pointer) {
    super.rejectGesture(pointer);
    _purgePointersIfNeeded(
      pointer: pointer,
    );
  }
}
