import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/theme_cubit/theme_mode_cubit.dart';
import 'package:notes_app/views/widgets/model_sheet_button_item.dart';
import 'package:notes_app/views/widgets/notes_item.dart';

import '../models/note_model/note_model.dart';

class HomeVies extends StatelessWidget {
  const HomeVies({super.key});

  @override
  Widget build(BuildContext context) {
    late NoteModel noteModel;
    List<NoteModel> note = BlocProvider.of<NotesCubit>(context).getNote();
    for (int i = 0; i < note.length; i++) {
      noteModel = note[i];
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notes'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: SizedBox(
        width: 200,
        height: 300,
        child: Drawer(
          child: SizedBox(
            child: ListView(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: DrawerHeader(child: Text('choose Theme')),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Dark theme"),
                  trailing: IconButton(
                    onPressed: () {
                      BlocProvider.of<ThemeModeCubit>(
                        context,
                      ).setThemeMode(isDark: true);
                    },
                    icon: Icon(Icons.dark_mode),
                  ),
                ),
                ListTile(
                  title: Text("Light theme"),
                  trailing: IconButton(
                    onPressed: () {
                      BlocProvider.of<ThemeModeCubit>(
                        context,
                      ).setThemeMode(isDark: false);
                    },
                    icon: Icon(Icons.light_mode),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          BlocProvider.of<NotesCubit>(context).getNote();
          var note = BlocProvider.of<NotesCubit>(context).getNote();
          BlocProvider.of<NotesCubit>(context).getNote();
          return Padding(
            padding: const EdgeInsets.only(bottom: 65),
            child: ListView.builder(
              itemCount: note.length,
              itemBuilder: (context, index) {
                return NotesItem(noteModel: note[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return ModelSheetButtonItem();
            },
          );
          BlocProvider.of<NotesCubit>(context).getNote();
        },
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
