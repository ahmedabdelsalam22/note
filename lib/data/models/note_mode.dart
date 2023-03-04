class NoteModel {
  int id;
  String title;
  String content;
  final String date;
  final DateTime time;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.time,
    required this.date,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      time: map['time'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'time': time,
      'date': date
    };
  }
}
