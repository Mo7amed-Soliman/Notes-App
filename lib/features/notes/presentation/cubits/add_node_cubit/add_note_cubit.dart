import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/helper/utils/constants.dart';
import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:notes_app/features/notes/presentation/cubits/add_node_cubit/add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static AddNoteCubit get(context) => BlocProvider.of(context);
  //? form key
  final formKey = GlobalKey<FormState>();

  //? controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  //? auto validate
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;

  addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteErrorState());
    }
  }

  //? get random color
  getRandomColor() {
    int index = Random().nextInt(4);
    return kColors[index].value;
  }

  //? list of color
  List<Color> kColors = const [
    Color(0xffFFF599),
    Color(0xff9EFFFF),
    Color(0xffFD99FF),
    Color(0xffB69CFF),
  ];
  bool isBackUsingCheck = true;
  String dateFormat = DateFormat('dd-MM-yyyy').format(DateTime.now());

  //? validate title and content and add note
  validate() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      NoteModel noteModel = NoteModel(
        title: title!,
        content: content!,
        color: getRandomColor(),
        date: dateFormat,
      );
      isBackUsingCheck = false;
      await addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ValidateState());
    }
  }

  //? User navigated back using system navigation
  backUsingSystem() {
    // ? check if title and content is not empty and
    // ? Spaces are not allowed  then add note
    if (titleController.text.trim().isNotEmpty &&
        contentController.text.trim().isNotEmpty) {
      NoteModel noteModel = NoteModel(
        title: titleController.text,
        content: contentController.text,
        color: getRandomColor(),
        date: dateFormat,
      );
      addNote(noteModel);
    }
  }
}
