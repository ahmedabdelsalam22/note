import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<Response> get(String url);

  Future<void> post(String url, Map<String, dynamic> query);

  Future put(String url, Map<String, dynamic> body);

  Future delete(String url);
}

class NetworkServicesImpl implements NetworkServices {
  final Dio dio = Dio();

  @override
  Future<Response> get(String url) async {
    return await dio.get(url);
  }

  @override
  Future<void> post(String url, Map<String, dynamic> body) async {
    await dio.post(url, data: body);
  }

  @override
  Future put(String url, Map<String, dynamic> body) async {
    return await dio.put(url, data: body);
  }

  @override
  Future delete(String url) async {
    return await dio.delete(url);
  }
}
