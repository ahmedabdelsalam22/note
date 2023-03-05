part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class GetNotesLoadingState extends NoteState {}

class GetNotesSuccessState extends NoteState {}

class GetNotesErrorState extends NoteState {}
