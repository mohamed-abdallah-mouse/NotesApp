import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/theme_cubit/theme_mode_cubit.dart';
import 'package:notes_app/models/note_model/note_model.dart';
import 'package:notes_app/views/home_views.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
        BlocProvider<NotesCubit>(create: (context) => NotesCubit()),
        BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),
      ],
      child: Builder(
        builder: (context) {
          var mode = Brightness.dark;
          return BlocBuilder<ThemeModeCubit, ThemeModeState>(
            builder: (context, state) {
              if (state is DarkModeState) {
                mode = Brightness.dark;
              } else {
                mode = Brightness.light;
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(brightness: mode),
                home: HomeVies(),
              );
            },
          );
        },
      ),
    );
  }
}
