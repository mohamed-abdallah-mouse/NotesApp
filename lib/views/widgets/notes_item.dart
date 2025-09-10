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
                return EditNotes(note: noteModel,);
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 3),
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
