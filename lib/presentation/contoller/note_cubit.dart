import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/data/models/note_mode.dart';

import '../../domain/repository/get_notes_repository.dart';

part 'note_state.dart';

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
    });
  }
}
