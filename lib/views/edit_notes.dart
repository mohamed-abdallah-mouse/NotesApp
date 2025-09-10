import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model/note_model.dart';

class EditNotes extends StatefulWidget {
  const EditNotes({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  String? title, content;
  late TextEditingController titleController;
  late TextEditingController contentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) return;
        saveData();
        deleteNote();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
          actions: [
            IconButton(
              onPressed: () {
                saveData();
                FocusScope.of(context).unfocus();
              },
              icon: Icon(Icons.check),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  onChanged: (value) {
                    title = value;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Title'),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: contentController,
                  maxLines: null,
                  onChanged: (value) {
                    content = value;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Content'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteNote() {
    if (widget.note.title.isEmpty && widget.note.content.isEmpty) {
      widget.note.delete();
    }
  }

  void saveData() {
    widget.note.title = title ?? widget.note.title;
    widget.note.content = content ?? widget.note.content;
    widget.note.save();
  }
}
