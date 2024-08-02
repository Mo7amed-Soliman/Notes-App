import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/views/add_note_view.dart';
import 'package:notes_app/features/notes/presentation/views/edit_note_view.dart';
import 'package:notes_app/features/notes/presentation/views/notes_view.dart';
import 'package:notes_app/features/splash/splash_view.dart';

const String initialRoute = '/';
Map<String, WidgetBuilder> get getRoutes {
  return {
    initialRoute: (context) => const SplashView(),
    NotesView.routeName: (context) => const NotesView(),
    AddNoteView.routeName: (context) => const AddNoteView(),
    EditNoteView.routeName: (context) => EditNoteView(
          note: ModalRoute.of(context)?.settings.arguments as NoteModel,
        ),
  };
}
