import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          //* custom app bar
          CustomAppBar(
            title: 'Notes',
            icon: FontAwesomeIcons.magnifyingGlass,
          ),
          SizedBox(height: 20),
          //*  notes ListView or no NotesWidget
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
