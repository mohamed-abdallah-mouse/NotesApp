import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/model_sheet_button_item.dart';
import 'package:notes_app/views/widgets/notes_item.dart';

class HomeVies extends StatelessWidget {
  const HomeVies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          var note = BlocProvider.of<NotesCubit>(context).getNote();
          BlocProvider.of<NotesCubit>(context).getNote();
          return ListView.builder(
            itemCount: note.length,
            itemBuilder: (context, index) {
              return NotesItem(noteModel: note[index]);
            },
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
        },
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
