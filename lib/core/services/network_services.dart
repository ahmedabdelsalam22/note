import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future get(String url);
}

class NetworkServicesImpl implements NetworkServices {
  final dio = Dio();

  @override
  Future get(String url) async {
    return await dio.get(url);
  }
}
