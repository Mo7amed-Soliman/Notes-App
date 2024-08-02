import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_search_icon.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_text_form_filed.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            //* custom app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(
                  icon: Icons.arrow_back_ios_new,
                  onTap: _onTap,
                ),
                CustomIcon(
                  icon: Icons.check,
                  onTap: _onTap,
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextFormFiled(
              fontSize: 30,
              hintText: 'Title',
              controller: titleController,
            ),

            const SizedBox(height: 16),
            CustomTextFormFiled(
              fontSize: 20,
              hintText: 'Start typing here...',
              controller: contentController,
            ),
          ],
        ),
      ),
    );
  }

  _onTap() {
    //* if title or content is empty , keep old value
    _isValueEmptyKeepOld();
    //* update note
    widget.note.save();
    //* refresh notes
    NotesCubit.get(context).fetchNotes();
    //* go back
    Navigator.pop(context);
  }

  void _isValueEmptyKeepOld() {
    widget.note.title =
        titleController.text.isEmpty ? widget.note.title : titleController.text;

    widget.note.content = contentController.text.isEmpty
        ? widget.note.content
        : contentController.text;
  }
}
