import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/text_field_item.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFieldItem(hint: 'Title'),
              SizedBox(height: 16),
              TextFieldItem(hint: 'content', maxLines: 5),
            ],
          ),
        ),
      ),
    );
  }
}
