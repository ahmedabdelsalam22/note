abstract class NoteState {}

class NoteInitial extends NoteState {}

class GetNotesLoadingState extends NoteState {}

class GetNotesSuccessState extends NoteState {}

class GetNotesErrorState extends NoteState {}

class DeleteNotesLoadingState extends NoteState {}

class DeleteNotesSuccessState extends NoteState {}

class DeleteNotesErrorState extends NoteState {}

class CreateNotesLoadingState extends NoteState {}

class CreateNotesSuccessState extends NoteState {}

class CreateNotesErrorState extends NoteState {}
