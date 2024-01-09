import 'dart:async';

import 'package:boring_counter/domain/counter/counter.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class StreamProvider {
  StreamController<Counter> provideCounterStream() =>
      BehaviorSubject<Counter>();

  StreamController<List<Counter>> provideCountersStream() =>
      BehaviorSubject<List<Counter>>();
}
