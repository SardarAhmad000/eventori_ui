class UserModel {
  final int id;
  final String? image;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String authMethod;
  final String? socialId;
  final String status;
  final String otp;
  final String otpExpiry;
  final String fcmToken;
  final String allowNotifications;
  final String createdAt;
  final String updatedAt;
  final String token;
  final String phoneNumber;
  final String gender;
  final String city;
  final String country;

  UserModel({
    required this.id,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.authMethod,
    required this.socialId,
    required this.status,
    required this.otp,
    required this.otpExpiry,
    required this.fcmToken,
    required this.allowNotifications,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.phoneNumber,
    required this.gender,
    required this.city,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      image: json["image"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      role: json["role"] ?? '',
      authMethod: json["authMethod"],
      socialId: json["socialId"],
      status: json["status"],
      otp: json["otp"]??'',
      otpExpiry: json["otpExpiry"]??'',
      fcmToken: json["fcmToken"],
      allowNotifications: json["allowNotifications"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      token: json["token"],
      phoneNumber: json["phoneNumber"]?? '',
      gender: json["gender"]?? '',
      city: json["city"]?? '',
      country: json["country"]?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "role": role,
      "authMethod": authMethod,
      "socialId": socialId,
      "status": status,
      "otp": otp,
      "otpExpiry": otpExpiry,
      "fcmToken": fcmToken,
      "allowNotifications": allowNotifications,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "token": token,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "city": city,
      "country": country,
    };
  }
}
