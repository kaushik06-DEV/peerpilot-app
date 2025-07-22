class StatsModel {
  int totalQuestions;
  int xp;
  int level;
  int streak;
  DateTime lastActive;
  List<String> badges;

  StatsModel({
    required this.totalQuestions,
    required this.xp,
    required this.level,
    required this.streak,
    required this.lastActive,
    required this.badges,
  });

  factory StatsModel.initial() => StatsModel(
    totalQuestions: 0,
    xp: 0,
    level: 0,
    streak: 0,
    lastActive: DateTime.now(),
    badges: [],
  );
}