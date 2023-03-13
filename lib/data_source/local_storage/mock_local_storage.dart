import 'package:injectable/injectable.dart';
import 'package:boring_counter/data_source/local_storage/local_storage.dart';

@Injectable(as: LocalStorage)
class MockLocalStorage implements LocalStorage {
}
