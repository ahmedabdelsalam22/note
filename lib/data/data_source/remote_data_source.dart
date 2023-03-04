import 'package:note/core/services/network_services.dart';
import 'package:note/data/models/note_mode.dart';

import '../../core/api_consts.dart';

abstract class RemoteDataSource {
  Future<List<NoteModel>> getNotes();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkServices _networkServices;

  RemoteDataSourceImpl(this._networkServices);

  @override
  Future<List<NoteModel>> getNotes() async {
    var response = await _networkServices.get(EndPoints.getAllNotes);
    if (response.statusCode != 200) throw Exception();

    final result = response.data as List;

    final notes = result.map((e) => NoteModel.fromMap(e)).toList();
    return notes;
  }
}
