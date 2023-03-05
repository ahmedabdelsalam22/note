import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(
              noteModel: noteModel,
            ),
          ),
        );*/
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            // color: Color(noteModel.color),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  textColor: Colors.black,
                  title: const Text(
                    'title',
                    style: TextStyle(fontSize: 23),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'subTitle',
                      style: TextStyle(color: Colors.black.withOpacity(.4)),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(FontAwesomeIcons.trash),
                    color: Colors.black,
                    onPressed: () {},
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
                      'date',
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
