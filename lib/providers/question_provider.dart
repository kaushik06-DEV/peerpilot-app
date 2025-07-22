import 'package:flutter/foundation.dart';

class QuestionResponse {
  final String question;
  final String answer;

  QuestionResponse(this.question, this.answer);
}

class QuestionProvider extends ChangeNotifier {
  final List<QuestionResponse> _responses = [];

  List<QuestionResponse> get responses => _responses;

  Future<void> askQuestion(String question) async {
    _responses.add(QuestionResponse(question, "Thinking..."));
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _responses[_responses.length - 1] = QuestionResponse(question, "Here's a smart answer!");
    notifyListeners();
  }
}
