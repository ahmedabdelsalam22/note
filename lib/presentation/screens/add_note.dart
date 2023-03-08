import 'package:flutter/material.dart';
import 'package:note/presentation/contoller/note_cubit.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key, required this.noteCubit});

  final NoteCubit? noteCubit;

  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

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
              title: 'Add Note',
              icon: Icons.check,
              onPressedIcon: () {
                noteCubit!.createNote(
                    title: titleController.text,
                    content: subTitleController.text,
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
                subTitleController.text = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
