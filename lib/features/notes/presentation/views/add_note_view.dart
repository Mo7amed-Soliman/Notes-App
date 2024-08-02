 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/presentation/cubits/add_node_cubit/add_note_cubit.dart';
import 'package:notes_app/features/notes/presentation/cubits/add_node_cubit/add_note_states.dart';
import 'package:notes_app/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  static const String routeName = '/AddNoteView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AddNoteCubit(),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              //? Management States
              _managementStates(state, context);
            },
            builder: (context, state) {
              return PopScope(
                onPopInvoked: (value) async {
                  //? check back using system
                  await _noPopInvoked(value, context);
                },
                child: const AddNoteViewBody(),
              );
            },
          ),
        ),
      ),
    );
  }

  //! Management States
  void _managementStates(AddNoteState state, BuildContext context) {
    switch (state) {
      case AddNoteSuccessState():
        NotesCubit.get(context).fetchNotes();
        //? back using check icon
        if (!AddNoteCubit.get(context).isBackUsingCheck) {
          Navigator.pop(context);
        }
    }
  }

  //! check back using system
  _noPopInvoked(value, context) async {
    if (value) {
      if (AddNoteCubit.get(context).isBackUsingCheck) {
        //! call check back using system
        await AddNoteCubit.get(context).backUsingSystem();
      }
    }
  }
}
