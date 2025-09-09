import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/text_field_item.dart';

import 'custom_elevated_button.dart';

class ModelSheetButtonItem extends StatelessWidget {
  const ModelSheetButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32),
          TextFieldItem(hint: 'Title'),
          SizedBox(height: 16),
          CustomElevatedButton(),
          SizedBox(height: 400),
        ],
      ),
    );
  }
}
