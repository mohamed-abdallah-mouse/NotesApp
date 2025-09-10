import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return NotesItem();
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
