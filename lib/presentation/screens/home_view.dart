import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/presentation/contoller/note_cubit.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/notes_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NoteCubit.get(context);
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
                  NotesListView(
                    noteCubit: cubit,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
