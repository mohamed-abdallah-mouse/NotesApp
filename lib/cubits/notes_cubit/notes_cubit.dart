import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> getNote() {
    var notebox = Hive.box<NoteModel>(kNoteBox);
    List<NoteModel> note = notebox.values.toList();
    emit(NotesSuccess());
    return note;
  }
}
