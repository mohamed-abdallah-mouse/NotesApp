import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/models/note_model/note_model.dart';

class ColorPickerWithButton extends StatelessWidget {
  const ColorPickerWithButton({
    super.key,
    required this.note,
    required this.onColorChanged,
    this.onPressed,
  });
  final NoteModel note;
  final void Function(Color) onColorChanged;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorPicker(
          pickerColor: Color(note.textColor),
          onColorChanged: onColorChanged,
          pickerAreaHeightPercent: 0.8,
          enableAlpha: false, // لو مش عايز درجة الشفافية
          displayThumbColor: true,
          paletteType: PaletteType.hueWheel, // دي اللي بتخليه دايرة
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            fixedSize: Size(120, 60),
          ),
          onPressed: onPressed,

          child: Text('save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
