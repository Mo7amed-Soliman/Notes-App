import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/app/notes_app.dart';
import 'package:notes_app/core/helper/observer/my_bloc_observer.dart';
import 'package:notes_app/core/helper/utils/constants.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';

void main() async {
  //! initialize hive
  await Hive.initFlutter();
  //! register adapter
  Hive.registerAdapter(NoteModelAdapter());
  //! open hive box
  await Hive.openBox<NoteModel>(kNotesBox);
  //! set observer
  Bloc.observer = AppBlocObservers();
  //! run app
  runApp(const NotesApp());
}
