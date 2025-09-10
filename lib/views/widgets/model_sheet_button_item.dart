import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import 'add_form_model_sheet_item.dart';

class ModelSheetButtonItem extends StatelessWidget {
  const ModelSheetButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          debugPrint(
            'failllllll${BlocProvider.of<AddNoteCubit>(context).state}',
          );
        }
        if (state is AddNoteSuccess) {
          debugPrint('sucesss');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(child: AddFormModelSheetItem());
      },
    );
  }
}
