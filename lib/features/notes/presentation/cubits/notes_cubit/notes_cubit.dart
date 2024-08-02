import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/helper/utils/constants.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);
  List<NoteModel> noteList = [];
  fetchNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    noteList = noteBox.values.toList();
    emit(NotesSuccessState());
  }
}
