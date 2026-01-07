class CategoryServices {
  final int id;
  final int eventCategoryId;
  final String serviceName;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryServices({
    required this.id,
    required this.eventCategoryId,
    required this.serviceName,
    required this.createdAt,
    required this.updatedAt,
  });

  /// FROM JSON
  factory CategoryServices.fromJson(Map<String, dynamic> json) {
    return CategoryServices(
      id: json['id'],
      eventCategoryId: json['eventCategoryId'],
      serviceName: json['serviceName'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  /// TO JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventCategoryId': eventCategoryId,
      'serviceName': serviceName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
