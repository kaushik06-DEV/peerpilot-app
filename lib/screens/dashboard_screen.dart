import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Welcome back! 🎉',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Stats', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _StatBox(label: 'Level', value: '7'),
                        _StatBox(label: 'Points', value: '540'),
                        _StatBox(label: 'Streak', value: '21🔥'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            Text('Quick Access', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _QuickButton(icon: Icons.question_answer, label: 'Ask AI'),
                _QuickButton(icon: Icons.menu_book, label: 'Courses'),
                _QuickButton(icon: Icons.leaderboard, label: 'Leaderboard'),
                _QuickButton(icon: Icons.person, label: 'Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate or handle action
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo.shade50,
        foregroundColor: Colors.indigo,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
