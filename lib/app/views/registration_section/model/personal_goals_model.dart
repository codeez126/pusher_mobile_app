
class GoalCategory {
  final String title;
  final String icon;
  final List<GoalOption> goals;

  GoalCategory({
    required this.title,
    required this.icon,
    required this.goals,
  });

  factory GoalCategory.fromMap(Map<String, dynamic> map) {
    return GoalCategory(
      title: map['title'],
      icon: map['icon'],
      goals: (map['goals'] as List<dynamic>)
          .map((goal) => GoalOption.fromString(goal))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'goals': goals.map((e) => e.toMap()).toList(),
    };
  }


}

class GoalOption {
  final String name;
  bool isSelected;

  GoalOption({
    required this.name,
    this.isSelected = false,
  });

  factory GoalOption.fromString(String goal) {
    return GoalOption(name: goal);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
    };
  }
}
