class EndPoints {
  static String baseUrl = "https://localhost:44382/api/notes";
  static String getAllNotes = "$baseUrl/getAllNotes";
  static String createNote = baseUrl;

  static String updateNote(int id) => "$baseUrl/$id";

  static String removeNote(int id) => "$baseUrl/$id";
}
