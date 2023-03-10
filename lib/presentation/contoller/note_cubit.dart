import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/data/models/note_mode.dart';
import 'package:note/presentation/screens/home_view.dart';

import '../../domain/repository/notes_repository.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._notesRepository) : super(NoteInitial());

  final NotesRepository _notesRepository;

  static NoteCubit get(context) => BlocProvider.of(context);

  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

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
      debugPrint("Error when get notes$onError");
    });
  }

  Future<void> createNote(
      {required String title,
      required String content,
      required BuildContext context}) async {
    emit(CreateNotesLoadingState());
    try {
      _notesRepository.createNote({
        "title": title,
        "content": content,
        "date": formattedDate,
      });
      getNotes();
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const HomeView())));
      emit(CreateNotesSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(CreateNotesErrorState());
    }
  }

  void updateNote(
      {required int id,
      required String title,
      required String content,
      required BuildContext context}) {
    try {
      emit(EditNotesLoadingState());
      _notesRepository.updateNote(id, {
        "title": title,
        "content": content,
        "date": formattedDate,
      });
      getNotes();
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const HomeView())));
      emit(EditNotesSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(EditNotesErrorState());
    }
  }

  void deleteNote(int id) {
    emit(DeleteNotesLoadingState());
    try {
      _notesRepository.deleteNote(id);
      getNotes();
      emit(DeleteNotesSuccessState());
    } catch (e) {
      emit(DeleteNotesErrorState());
      debugPrint(e.toString());
    }
  }
}
