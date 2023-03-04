import 'package:note/core/services/network_services.dart';

abstract class RemoteDataSource {
  Future<void> getNotes();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkServices _networkServices;

  RemoteDataSourceImpl(this._networkServices);

  @override
  Future<void> getNotes() async {
    var response = await _networkServices.get();
  }
}
