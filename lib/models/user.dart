class User {
  final int id;
  final String name;
  final int level;
  final int points;
  final int streak;
  final List<String> badges;

  User({
    required this.id,
    required this.name,
    required this.level,
    required this.points,
    required this.streak,
    required this.badges,
  });

  // Copy method for immutability (useful for editing state)
  User copyWith({
    int? id,
    String? name,
    int? level,
    int? points,
    int? streak,
    List<String>? badges,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
      points: points ?? this.points,
      streak: streak ?? this.streak,
      badges: badges ?? this.badges,
    );
  }

  // JSON deserialization
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      points: json['points'],
      streak: json['streak'],
      badges: List<String>.from(json['badges']),
    );
  }

  // JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'points': points,
      'streak': streak,
      'badges': badges,
    };
  }
}
