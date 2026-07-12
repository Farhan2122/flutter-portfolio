/// Skill data model representing a technical competency
class Skill {
  final String id;
  final String name;
  final String category;
  final int displayOrder;

  Skill({
    required this.id,
    required this.name,
    required this.category,
    required this.displayOrder,
  }) {
    // Validation
    if (name.isEmpty) {
      throw ArgumentError('Skill name cannot be empty');
    }
    if (category.isEmpty) {
      throw ArgumentError('Skill category cannot be empty');
    }
  }

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      displayOrder: json['displayOrder'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'displayOrder': displayOrder,
    };
  }
}
