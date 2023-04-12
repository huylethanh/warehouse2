import 'package:warehouse_app/models/models.dart';
import '../../services/services.dart';

class RegisterPickingTransport {
  final _service = PickingService();

  final List<String> registeredTransport = [];
  int failCount = 0;

  Future<PickingPath?> execute(int pickId) async {
    /*if (failCount < 5) {
            failCount += 1
            throw Exception("test fail")
        }*/
    final result = await _service.registerTransport(
        pickId, registeredTransport.reversed.toList());

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }

  bool register(String code) {
    if (registeredTransport.contains(code)) {
      return false;
    }

    registeredTransport.insert(0, code);
    return true;
  }

  void remove(int pos) {
    registeredTransport.removeAt(pos);
  }

  bool removeByName(String name) {
    final foundIndex =
        registeredTransport.indexWhere((element) => element == name);

    if (foundIndex < 0) {
      return false;
    }

    registeredTransport.removeAt(foundIndex);
    return true;
  }

  int count() {
    return registeredTransport.length;
  }

  bool enough() {
    return registeredTransport.length == 2;
  }
}
