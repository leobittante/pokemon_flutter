import 'package:http/http.dart' as client;
import 'network_info.dart';

abstract class HttpServices {
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}

class HHttpServices implements HttpServices {
  final NetworkInfo networkInfo;

  const HHttpServices({required this.networkInfo});

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    await networkInfo.isConnected;
    return client
        .get(Uri.parse(path).replace(queryParameters: queryParameters));
  }
}
