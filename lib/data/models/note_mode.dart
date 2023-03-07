class NoteModel {
  int id;
  String title;
  String content;
  final String date;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content, 'date': date};
  }
}
