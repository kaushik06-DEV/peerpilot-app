import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question_provider.dart';

class QuestionInput extends StatefulWidget {
  const QuestionInput({super.key});

  @override
  State<QuestionInput> createState() => _QuestionInputState();
}

class _QuestionInputState extends State<QuestionInput> {
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  Future<void> _submitQuestion() async {
    final question = _controller.text.trim();
    if (question.isEmpty) return;

    setState(() => isLoading = true);
    await context.read<QuestionProvider>().askQuestion(question);
    setState(() => isLoading = false);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16), // Consistent margin
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _submitQuestion(),
            decoration: InputDecoration(
              labelText: 'Ask your question',
              hintText: 'e.g. Explain quantum tunneling',
              prefixIcon: const Icon(Icons.question_answer),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest, // Direct usage
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: isLoading ? null : _submitQuestion,
            icon: const Icon(Icons.send),
            label: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          if (isLoading) ...[
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator()),
          ]
        ],
      ),
    );
  }
}
