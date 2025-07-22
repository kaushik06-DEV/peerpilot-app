import 'package:flutter/material.dart';
import '../models/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  final int rank;

  const UserTile({super.key, required this.user, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade100,
          child: Text('#$rank', style: const TextStyle(color: Colors.black)),
        ),
        title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Level ${user.level} • Streak ${user.streak} days'),
        trailing: Text('${user.points} pts', style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

