import '../models/user.dart';

class UserService {
  static Future<User> fetchUserById(int id) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading
    return User(
      id: id,
      name: 'Kaushik',
      level: 7,
      points: 540,
      streak: 21,
      badges: ['🔥', '💡', '⭐'],
    );
  }

  static Future<List<User>> fetchLeaderboardService() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      User(id: 1, name: "Alice", level: 12, points: 1250, streak: 30, badges: ['🔥', '👑']),
      User(id: 2, name: "Bob", level: 10, points: 1100, streak: 25, badges: ['💡']),
      User(id: 3, name: "Charlie", level: 9, points: 980, streak: 22, badges: ['⭐']),
      User(id: 4, name: "Kaushik", level: 8, points: 950, streak: 21, badges: ['💡', '🔥']),
    ];
  }
}
