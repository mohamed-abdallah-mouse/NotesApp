import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model/note_model.dart';
import 'package:notes_app/views/edit_notes.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditNotes(note: noteModel);
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(8),
                title: Text(noteModel.title),
                subtitle: Text(noteModel.content),
                trailing: IconButton(
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<NotesCubit>(context).getNote();
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 8, bottom: 16),
                child: Text(noteModel.data),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
