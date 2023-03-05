import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Note',
              onPressedIcon: () {},
              icon: Icons.search,
            ),
            const SizedBox(height: 30),
            const NotesListView(),
          ],
        ),
      ),
    );
  }
}
