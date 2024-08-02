import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notes_app/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_item_note.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_no_notes.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    //* fetch notes
    NotesCubit.get(context).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return NotesCubit.get(context).noteList.isEmpty
            ? const CustomNoNotes() // no notes
            : AnimationLimiter(
                child: ListView.builder(
                  itemCount: NotesCubit.get(context).noteList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 400),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: NoteItem(
                            noteModel: NotesCubit.get(context).noteList[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
