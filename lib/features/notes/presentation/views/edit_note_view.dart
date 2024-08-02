import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  static const String routeName = '/EditNoteView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditNoteViewBody(note: note),
      ),
    );
  }
}
