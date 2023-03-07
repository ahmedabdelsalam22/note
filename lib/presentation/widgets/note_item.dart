import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/router/router.dart';
import '../../data/models/note_mode.dart';
import '../contoller/note_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.noteModel,
    required this.cubit,
  }) : super(key: key);

  final NoteModel noteModel;
  final NoteCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.editNoteViewRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            // color: Color(noteModel.color),
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  textColor: Colors.black,
                  title: Text(
                    noteModel.title,
                    style: const TextStyle(fontSize: 23),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      noteModel.content,
                      style: TextStyle(color: Colors.black.withOpacity(.4)),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(FontAwesomeIcons.trash),
                    color: Colors.black,
                    onPressed: () {
                      ///TODO :DELETE NOTE
                      cubit.deleteNote(noteModel.id);
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      noteModel.date,
                      style: TextStyle(color: Colors.black.withOpacity(.4)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
