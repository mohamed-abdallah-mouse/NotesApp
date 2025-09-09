import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_notes.dart';

import '../../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotes();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Ok', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
