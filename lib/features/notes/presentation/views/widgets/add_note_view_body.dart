import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/cubits/add_node_cubit/add_note_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/add_note_form.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_search_icon.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            //* custom app bar
            Row(
              children: [
                CustomIcon(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_ios_new,
                ),
                const Spacer(),
                const CustomIcon(icon: Icons.visibility),
                const SizedBox(width: 20),
                CustomIcon(
                  onTap: () async {
                    // ? validate title and content and add note
                    await AddNoteCubit.get(context).validate();
                  },
                  icon: Icons.check,
                ),
              ],
            ),
            //* add note form
            const AddNoteForm(),
          ],
        ),
      ),
    );
  }
}
