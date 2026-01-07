class EventCategory {
  final int id;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventCategory({
    required this.id,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventCategory.fromJson(Map<String, dynamic> json) {
    return EventCategory(
      id: json['id'],
      categoryName: json['categoryName'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
