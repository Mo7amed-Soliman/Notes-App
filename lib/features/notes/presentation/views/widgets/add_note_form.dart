import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/presentation/cubits/add_node_cubit/add_note_cubit.dart';
import 'package:notes_app/features/notes/presentation/cubits/add_node_cubit/add_note_states.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_text_form_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return Form(
          key: AddNoteCubit.get(context).formKey,
          autovalidateMode: AddNoteCubit.get(context).autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 15),
              CustomTextFormFiled(
                controller: AddNoteCubit.get(context).titleController,
                fontSize: 30,
                onSaved: (value) {
                  AddNoteCubit.get(context).title = value;
                },
                hintText: 'Title',
                focusNode: myFocusNode,
              ),
              const SizedBox(height: 16),
              CustomTextFormFiled(
                controller: AddNoteCubit.get(context).contentController,
                fontSize: 20,
                onSaved: (value) {
                  AddNoteCubit.get(context).content = value;
                },
                hintText: 'Start typing here...',
              ),
            ],
          ),
        );
      },
    );
  }
}
