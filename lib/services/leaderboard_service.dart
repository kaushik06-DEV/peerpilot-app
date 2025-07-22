import '../models/user.dart';

class LeaderboardService {
  static Future<List<User>> fetchTopUsers() async {
    // Simulated API response
    await Future.delayed(const Duration(seconds: 1));
    return [
      User(id: 1, name: 'Alice', level: 5, points: 320, streak: 14, badges: ['🔥', '🏆']),
      User(id: 2, name: 'Bob', level: 4, points: 290, streak: 10, badges: ['🎯']),
      User(id: 3, name: 'Charlie', level: 3, points: 250, streak: 5, badges: []),
    ];
  }
}
