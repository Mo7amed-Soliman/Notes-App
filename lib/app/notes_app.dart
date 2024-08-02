import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/helper/utils/constants.dart';
import 'package:notes_app/core/routes/routes.dart';
import 'package:notes_app/core/theme/theme.dart';
import 'package:notes_app/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: getDarkTheme(),
        routes: getRoutes,
        initialRoute: initialRoute,
      ),
    );
  }
}
