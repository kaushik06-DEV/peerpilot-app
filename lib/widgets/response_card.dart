import 'package:flutter/material.dart';

class ResponseCard extends StatelessWidget {
  final String question;
  final String answer;
  final bool expanded;
  final VoidCallback? onTap;

  const ResponseCard({
    super.key,
    required this.question,
    required this.answer,
    this.expanded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ExpansionTile(
        initiallyExpanded: expanded,
        onExpansionChanged: (_) => onTap?.call(),
        title: Row(
          children: [
            const Icon(Icons.question_answer, color: Colors.indigo),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                question,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
