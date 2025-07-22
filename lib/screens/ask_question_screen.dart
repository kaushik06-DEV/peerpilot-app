import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question_provider.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({super.key});

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitQuestion(QuestionProvider provider) {
    final question = _controller.text.trim();
    if (question.isNotEmpty) {
      provider.askQuestion(question);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            Expanded(
              child: provider.responses.isEmpty
                  ? const Center(child: Text("Ask me anything!"))
                  : ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(16),
                itemCount: provider.responses.length,
                itemBuilder: (context, index) {
                  final response = provider.responses.reversed.toList()[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("👤 You:", style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(height: 4),
                          Text(response.question),
                          const SizedBox(height: 12),
                          Text("🤖 PeerPilot:", style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(height: 4),
                          Text(response.answer),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Ask a question...',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.image, color: Colors.indigo),
                          onPressed: () {
                            // Image input logic
                          },
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onSubmitted: (_) => _submitQuestion(provider),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _submitQuestion(provider),
                    child: const Text("Send"),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
