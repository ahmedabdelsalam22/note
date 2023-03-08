import 'package:note/data/models/note_mode.dart';

import '../../data/data_source/remote_data_source.dart';

abstract class NotesRepository {
  Future<List<NoteModel>> getNotes();
  void deleteNote(int id);
  void createNote(Map<String, dynamic> query);
  void updateNote(int id, Map<String, dynamic> body);
}

class NotesRepositoryImpl implements NotesRepository {
  final RemoteDataSource _remoteDataSource;

  NotesRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<NoteModel>> getNotes() {
    return _remoteDataSource.getNotes();
  }

  @override
  void deleteNote(int id) async {
    await _remoteDataSource.deleteNote(id);
  }

  @override
  void createNote(Map<String, dynamic> query) {
    _remoteDataSource.createNote(query);
  }

  @override
  void updateNote(int id, Map<String, dynamic> body) {
    _remoteDataSource.updateNote(id, body);
  }
}
