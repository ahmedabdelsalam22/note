import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

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
              onPressedIcon: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: 'title',
              onChange: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: 'subTitle',
              maxLine: 5,
              onChange: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
