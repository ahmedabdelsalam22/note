import 'package:flutter/material.dart';
import 'package:note/presentation/contoller/note_cubit.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key, required this.noteCubit}) : super(key: key);

  final NoteCubit noteCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return NoteItem(
            noteModel: noteCubit.noteModel![index],
          );
        },
        itemCount: noteCubit.noteModel!.length,
      ),
    );
  }
}
