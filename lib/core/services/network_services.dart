import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<Response> get(String url);

  Future<void> post(String url, Map<String, dynamic> query);

  Future put(String url);

  Future delete(String url);
}

class NetworkServicesImpl implements NetworkServices {
  final Dio dio = Dio();

  @override
  Future<Response> get(String url) async {
    return await dio.get(url);
  }

  @override
  Future<void> post(String url, Map<String, dynamic> query) async {
    await dio.post(url, data: query);
  }

  @override
  Future put(String url) async {
    return await dio.put(url);
  }

  @override
  Future delete(String url) async {
    return await dio.delete(url);
  }
}
