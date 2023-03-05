import 'package:note/data/models/note_mode.dart';

import '../../data/data_source/remote_data_source.dart';

abstract class NotesRepository {
  Future<List<NoteModel>> getNotes();
}

class NotesRepositoryImpl implements NotesRepository {
  final RemoteDataSourceImpl _remoteDataSourceImpl;

  NotesRepositoryImpl(this._remoteDataSourceImpl);

  @override
  Future<List<NoteModel>> getNotes() async {
    return await _remoteDataSourceImpl.getNotes();
  }
}
