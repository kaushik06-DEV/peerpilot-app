import 'package:flutter/material.dart';
import '../models/stats_model.dart';

class StatsProvider with ChangeNotifier {
  StatsModel stats = StatsModel.initial();
  bool leveledUp = false;

  void logActivity() {
    stats.totalQuestions++;
    stats.xp += 10;

    int previousLevel = stats.level;
    stats.level = stats.xp ~/ 10;
    leveledUp = stats.level > previousLevel;

    if (_isNewDay(stats.lastActive)) {
      stats.streak++;
    } else {
      stats.streak = 1;
    }

    stats.lastActive = DateTime.now();
    _evaluateBadges();
    notifyListeners();
  }

  void _evaluateBadges() {
    if (stats.totalQuestions >= 10 && !stats.badges.contains('Curious Learner')) {
      stats.badges.add('Curious Learner');
    }
    if (stats.streak >= 5 && !stats.badges.contains('Streak Master')) {
      stats.badges.add('Streak Master');
    }
  }

  bool _isNewDay(DateTime lastDate) {
    final now = DateTime.now();
    return now.day != lastDate.day || now.month != lastDate.month || now.year != lastDate.year;
  }
}