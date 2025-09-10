import 'package:flutter/material.dart';

import 'add_form_model_sheet_item.dart';

class ModelSheetButtonItem extends StatelessWidget {
  const ModelSheetButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: AddFormModelSheetItem());
  }
}
