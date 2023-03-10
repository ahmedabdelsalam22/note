import 'package:flutter/material.dart';
import 'package:note/data/models/note_mode.dart';
import 'package:note/presentation/contoller/note_cubit.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({
    Key? key,
    this.cubit,
    this.noteModel,
  }) : super(key: key);

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  final NoteCubit? cubit;
  final NoteModel? noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit',
              icon: Icons.check,
              onPressedIcon: () {
                cubit!.updateNote(
                    id: noteModel!.id,
                    title: titleController.text,
                    content: subtitleController.text,
                    context: context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: 'title',
              onChange: (value) {
                titleController.text = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: 'subTitle',
              maxLine: 5,
              onChange: (value) {
                subtitleController.text = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
