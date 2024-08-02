import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          //? push edit note view
          Navigator.pushNamed(
            context,
            EditNoteView.routeName,
            arguments: noteModel,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //* Title and icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Title
                    //? ConstrainedBox or LimitingBox
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        noteModel.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    //* Icon
                    IconButton(
                      onPressed: () {
                        noteModel.delete();
                        BlocProvider.of<NotesCubit>(context).fetchNotes();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                //* Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    noteModel.content,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                //* Date
                Text(
                  noteModel.date,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
