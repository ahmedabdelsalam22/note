import 'package:note/core/services/network_services.dart';
import 'package:note/data/models/note_mode.dart';

abstract class RemoteDataSource {
  Future<List<NoteModel>> getNotes();

  Future<void> deleteNote(int id);

  Future<void> createNote(Map<String, dynamic> query);

  Future<void> updateNote(int id, Map<String, dynamic> body);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkServices _networkServices;

  RemoteDataSourceImpl(this._networkServices);

  @override
  Future<List<NoteModel>> getNotes() async {
    var response = await _networkServices
        .get("https://localhost:44382/api/Notes/getAllNotes");
    if (response.statusCode != 200) throw Exception();

    final result = response.data as List;

    final notes = result.map((e) => NoteModel.fromMap(e)).toList();
    return notes;
  }

  @override
  Future<void> deleteNote(int id) async {
    await _networkServices.delete("https://localhost:44382/api/Notes/$id");
  }

  @override
  Future<void> createNote(Map<String, dynamic> query) async {
    await _networkServices.post("https://localhost:44382/api/Notes", query);
  }

  @override
  Future<void> updateNote(int id, Map<String, dynamic> body) async {
    await _networkServices.put("https://localhost:44382/api/Notes/$id", body);
  }
}
