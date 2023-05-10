// Mocks generated by Mockito 5.4.0 from annotations
// in boring_counter/test/unit_test/data_source/counter/repository/prefs_counter_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:boring_counter/data_source/counter/repository/stream_provider.dart'
    as _i3;
import 'package:boring_counter/domain/counter/counter.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeStreamSink_0<S> extends _i1.SmartFake implements _i2.StreamSink<S> {
  _FakeStreamSink_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamController_1<T> extends _i1.SmartFake
    implements _i2.StreamController<T> {
  _FakeStreamController_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StreamController].
///
/// See the documentation for Mockito's code generation for more information.
class MockStreamController<T> extends _i1.Mock
    implements _i2.StreamController<T> {
  @override
  set onListen(void Function()? _onListen) => super.noSuchMethod(
        Invocation.setter(
          #onListen,
          _onListen,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onPause(void Function()? _onPause) => super.noSuchMethod(
        Invocation.setter(
          #onPause,
          _onPause,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onResume(void Function()? _onResume) => super.noSuchMethod(
        Invocation.setter(
          #onResume,
          _onResume,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onCancel(_i2.FutureOr<void> Function()? _onCancel) => super.noSuchMethod(
        Invocation.setter(
          #onCancel,
          _onCancel,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Stream<T> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i2.Stream<T>.empty(),
        returnValueForMissingStub: _i2.Stream<T>.empty(),
      ) as _i2.Stream<T>);
  @override
  _i2.StreamSink<T> get sink => (super.noSuchMethod(
        Invocation.getter(#sink),
        returnValue: _FakeStreamSink_0<T>(
          this,
          Invocation.getter(#sink),
        ),
        returnValueForMissingStub: _FakeStreamSink_0<T>(
          this,
          Invocation.getter(#sink),
        ),
      ) as _i2.StreamSink<T>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get isPaused => (super.noSuchMethod(
        Invocation.getter(#isPaused),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get hasListener => (super.noSuchMethod(
        Invocation.getter(#hasListener),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i2.Future<dynamic> get done => (super.noSuchMethod(
        Invocation.getter(#done),
        returnValue: _i2.Future<dynamic>.value(),
        returnValueForMissingStub: _i2.Future<dynamic>.value(),
      ) as _i2.Future<dynamic>);
  @override
  void add(T? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Future<dynamic> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i2.Future<dynamic>.value(),
        returnValueForMissingStub: _i2.Future<dynamic>.value(),
      ) as _i2.Future<dynamic>);
  @override
  _i2.Future<dynamic> addStream(
    _i2.Stream<T>? source, {
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addStream,
          [source],
          {#cancelOnError: cancelOnError},
        ),
        returnValue: _i2.Future<dynamic>.value(),
        returnValueForMissingStub: _i2.Future<dynamic>.value(),
      ) as _i2.Future<dynamic>);
}

/// A class which mocks [StreamProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockStreamProvider extends _i1.Mock implements _i3.StreamProvider {
  @override
  _i2.StreamController<_i4.Counter> provideCounterStream() =>
      (super.noSuchMethod(
        Invocation.method(
          #provideCounterStream,
          [],
        ),
        returnValue: _FakeStreamController_1<_i4.Counter>(
          this,
          Invocation.method(
            #provideCounterStream,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeStreamController_1<_i4.Counter>(
          this,
          Invocation.method(
            #provideCounterStream,
            [],
          ),
        ),
      ) as _i2.StreamController<_i4.Counter>);
  @override
  _i2.StreamController<List<_i4.Counter>> provideCountersStream() =>
      (super.noSuchMethod(
        Invocation.method(
          #provideCountersStream,
          [],
        ),
        returnValue: _FakeStreamController_1<List<_i4.Counter>>(
          this,
          Invocation.method(
            #provideCountersStream,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeStreamController_1<List<_i4.Counter>>(
          this,
          Invocation.method(
            #provideCountersStream,
            [],
          ),
        ),
      ) as _i2.StreamController<List<_i4.Counter>>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i5.SharedPreferences {
  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
        returnValueForMissingStub: <String>{},
      ) as Set<String>);
  @override
  Object? get(String? key) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as Object?);
  @override
  bool? getBool(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getBool,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as bool?);
  @override
  int? getInt(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getInt,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as int?);
  @override
  double? getDouble(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getDouble,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as double?);
  @override
  String? getString(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getString,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as String?);
  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  List<String>? getStringList(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getStringList,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as List<String>?);
  @override
  _i2.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i2.Future<bool>.value(false),
        returnValueForMissingStub: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
  @override
  _i2.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);
}
