import 'package:note/data/models/note_mode.dart';

import '../../data/data_source/remote_data_source.dart';

abstract class GetNotesRepository {
  Future<List<NoteModel>> getNotes();
}

class GetNotesRepositoryImpl implements GetNotesRepository {
  final RemoteDataSourceImpl _remoteDataSourceImpl;

  GetNotesRepositoryImpl(this._remoteDataSourceImpl);

  @override
  Future<List<NoteModel>> getNotes() async {
    return await _remoteDataSourceImpl.getNotes();
  }
}
