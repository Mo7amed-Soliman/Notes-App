abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

//! date state
final class AddNoteLoadingState extends AddNoteState {}

final class AddNoteSuccessState extends AddNoteState {}

final class AddNoteErrorState extends AddNoteState {}

final class ValidateState extends AddNoteState {}
