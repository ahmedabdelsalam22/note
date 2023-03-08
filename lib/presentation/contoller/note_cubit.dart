import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/data/models/note_mode.dart';
import 'package:note/presentation/screens/home_view.dart';

import '../../domain/repository/notes_repository.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._notesRepository) : super(NoteInitial());

  final NotesRepository _notesRepository;

  static NoteCubit get(context) => BlocProvider.of(context);

  List<NoteModel>? noteModel;

  Future<void> getNotes() async {
    emit(GetNotesLoadingState());
    await _notesRepository.getNotes().then((value) {
      noteModel = value;
      debugPrint(value.length.toString());
      debugPrint(value.toString());
      emit(GetNotesSuccessState());
    }).catchError((onError) {
      emit(GetNotesErrorState());
      print("Error when get notes$onError");
    });
  }

  void deleteNote(int id) {
    emit(DeleteNotesLoadingState());
    try {
      _notesRepository.deleteNote(id);
      emit(DeleteNotesSuccessState());
    } catch (e) {
      emit(DeleteNotesErrorState());
      print(e.toString());
    }
  }

  Future<void> createNote({
    required String title,
    required String content,
    required String date,
    required BuildContext context
  }) async {
    emit(CreateNotesLoadingState());
    try {
      _notesRepository.createNote({
        "title": title,
        "content": content,
        "date": date,
      });
       getNotes();
      Navigator.push(context, MaterialPageRoute(builder: ((context) =>const HomeView())));
      emit(CreateNotesSuccessState());
    } catch (e) {
      emit(CreateNotesErrorState());
    }
  }
}
