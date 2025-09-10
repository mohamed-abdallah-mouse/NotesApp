import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model/note_model.dart';
import 'package:notes_app/views/widgets/text_field_item.dart';

import '../edit_notes.dart';
import 'custom_elevated_button.dart';

class AddFormModelSheetItem extends StatefulWidget {
  const AddFormModelSheetItem({super.key});

  @override
  State<AddFormModelSheetItem> createState() => _AddFormModelSheetItemState();
}

class _AddFormModelSheetItemState extends State<AddFormModelSheetItem> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          TextFieldItem(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          TextFieldItem(
            hint: 'subtitle',
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          SizedBox(height: 16),
          CustomElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final String date =
                    ' ${DateTime.now().day}:${DateTime.now().month}:${DateTime.now().year}';
                NoteModel note = NoteModel(
                  title: title!,
                  content: content!,
                  data: date,
                  color: Colors.black.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditNotes();
                    },
                  ),
                );
                formKey.currentState!.save();
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20),
        ],
      ),
    );
  }
}
