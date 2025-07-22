import 'package:flutter/material.dart';

class LevelUpScreen extends StatelessWidget {
  const LevelUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🏅 Celebration Icon
            const Icon(
              Icons.emoji_events,
              size: 100,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 24),

            // 🌟 Title
            const Text(
              'Level Up!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),

            // 🧠 Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'You reached a new milestone in your learning journey.\nKeep asking, keep growing!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 28),

            // 🎯 Continue Button
            ElevatedButton.icon(
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Continue'),
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}