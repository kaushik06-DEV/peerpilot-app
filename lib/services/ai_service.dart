import 'dart:convert';
import 'package:http/http.dart' as http;

class AiService {
  static Future<String> fetchAnswer(String question) async {
    final url = Uri.parse("http://127.0.0.1:8000/ask");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"question": question}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["answer"] ?? "No answer";
      } else {
        return "Server error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}