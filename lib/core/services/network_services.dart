import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future get(String url);
  Future put(String url);
  Future post(String url);
  Future delete(String url);
}

class NetworkServicesImpl implements NetworkServices {
  final dio = Dio();

  @override
  Future get(String url) async {
    return await dio.get(url);
  }

  @override
  Future put(String url) async {
    return await dio.put(url);
  }

  @override
  Future post(String url) async {
    return await dio.post(url);
  }

  @override
  Future delete(String url) async {
    return await dio.delete(url);
  }
}
