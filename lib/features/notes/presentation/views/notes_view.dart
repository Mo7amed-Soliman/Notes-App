import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/add_note_view.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/notes_view_bady.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  static const String routeName = '/NotesView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: NotesViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //? push to add note view
          Navigator.pushNamed(context, AddNoteView.routeName);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
