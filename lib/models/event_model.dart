class EventModel {
  final int id;
  final int userId;
  final String image;
  final String eventName;
  final String eventCategory;
  final String about;
  final String country;
  final String city;
  final String eventDate;
  final bool sendReminderEmail;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventModel({
    required this.id,
    required this.userId,
    required this.image,
    required this.eventName,
    required this.eventCategory,
    required this.about,
    required this.country,
    required this.city,
    required this.eventDate,
    required this.sendReminderEmail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      userId: json['userId'],
      image: json['image'],
      eventName: json['eventName'],
      eventCategory: json['eventCategory'],
      about: json['about'],
      country: json['country']?? '',
      city: json['city']?? '',
      eventDate: json['eventDate'] ?? '',
      sendReminderEmail: json['sendReminderEmail'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'image': image,
      'eventName': eventName,
      'eventCategory': eventCategory,
      'about': about,
      'country': country,
      'city': city,
      'eventDate': eventDate,
      'sendReminderEmail': sendReminderEmail,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
