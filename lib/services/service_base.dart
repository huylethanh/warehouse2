import 'client/app_client.dart';

abstract class ServiceBase {
  final client = AppClient.create();
}
