class Achievement {
  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.target,
    required this.reward,
    this.progress = 0,
    this.completed = false,
    this.claimed = false,
  });

  final String id;
  final String title;
  final String description;

  final int target;

  final int reward;

  final int progress;

  final bool completed;

  final bool claimed;

  double get percentage =>
      progress / target;

  Achievement copyWith({
    int? progress,
    bool? completed,
    bool? claimed,
  }) {
    return Achievement(
      id: id,
      title: title,
      description: description,
      target: target,
      reward: reward,
      progress: progress ?? this.progress,
      completed: completed ?? this.completed,
      claimed: claimed ?? this.claimed,
    );
  }
}