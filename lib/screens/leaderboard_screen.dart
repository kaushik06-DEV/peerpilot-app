import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../models/user.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<User> leaderboard = [];

  @override
  void initState() {
    super.initState();
    loadLeaderboard();
  }

  void loadLeaderboard() async {
    final data = await UserService.fetchLeaderboardService();
    setState(() => leaderboard = data);
  }

  Widget _buildRankMedal(int rank) {
    switch (rank) {
      case 1:
        return const Icon(Icons.emoji_events, color: Colors.amber, size: 28);
      case 2:
        return const Icon(Icons.emoji_events, color: Colors.grey, size: 26);
      case 3:
        return const Icon(Icons.emoji_events, color: Colors.brown, size: 24);
      default:
        return Text('#$rank', style: const TextStyle(fontWeight: FontWeight.bold));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: leaderboard.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          final user = leaderboard[index];
          final isCurrentUser = user.name == 'Kaushik'; // Highlight yourself if needed

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: isCurrentUser ? Colors.blue.shade50 : null,
            child: ListTile(
              leading: _buildRankMedal(index + 1),
              title: Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Text('Level ${user.level} • ${user.points} pts • 🔥 ${user.streak}d streak'),
              trailing: Wrap(
                spacing: 4,
                children: user.badges.map((b) => Text(b, style: const TextStyle(fontSize: 18))).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
