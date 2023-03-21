import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:warehouse_app/utils/index.dart';

import 'json_to_type_converter.dart';

class ChopperClients {
  static final ChopperClients _clients = ChopperClients._internal();

  factory ChopperClients() {
    return _clients;
  }

  ChopperClients._internal();

  String? token;

  String baseURL = 'https://ops-api.dev.tnclog.vn/';

  String? deviceIdentifier;

  ChopperClient get client {
    String accessToken = LoginReference().accessToken!;

    return ChopperClient(
      baseUrl: Uri.parse(baseURL),
      interceptors: [
        (Request request) async {
          final updatedRequest = request.copyWith(
            headers: {
              'Content-type': 'application/json',
              'Authorization': 'Bearer $accessToken',
              'x-device-id': await _getDeviceId(),
            },
          );
          return updatedRequest;
        }
      ],
      converter: JsonToTypeConverter(),
      errorConverter: JsonToTypeConverter(),
    );
  }

  ChopperClient get loginClient {
    return ChopperClient(
      baseUrl: Uri.parse(baseURL),
      interceptors: [
        (Request request) async {
          final updatedRequest = request.copyWith(
            headers: {
              'Content-type': 'application/json',
              'x-device-id': await _getDeviceId(),
            },
          );
          return updatedRequest;
        }
      ],
      converter: JsonToTypeConverter(),
    );
  }

  Future<String> _getDeviceId() async {
    if (deviceIdentifier != null) {
      return deviceIdentifier!;
    }

    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor!;
    }

    return deviceIdentifier!;
  }
}
