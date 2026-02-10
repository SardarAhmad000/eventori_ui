class EventVendor {
  final int id;
  final List<String> portfolio;
  final String companyOwnerName;
  final String businessName;
  final String operatingAddress;
  final List<String> servicesProvided;
  final String serviceDescription;
  final String preferredContact;
  final VendorUser user;

  EventVendor({
    required this.id,
    required this.portfolio,
    required this.companyOwnerName,
    required this.businessName,
    required this.operatingAddress,
    required this.servicesProvided,
    required this.serviceDescription,
    required this.preferredContact,
    required this.user,
  });

  factory EventVendor.fromJson(Map<String, dynamic> json) {
    return EventVendor(
      id: json['id'],
      portfolio: List<String>.from(json['portfolio'] ?? []),
      companyOwnerName: json['companyOwnerName'] ?? '',
      businessName: json['businessName'] ?? '',
      operatingAddress: json['operatingAddress'] ?? '',
      servicesProvided: List<String>.from(json['servicesProvided'] ?? []),
      serviceDescription: json['serviceDescription'] ?? '',
      preferredContact: json['preferredContact'] ?? '',
      user: VendorUser.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'portfolio': portfolio,
      'companyOwnerName': companyOwnerName,
      'businessName': businessName,
      'operatingAddress': operatingAddress,
      'servicesProvided': servicesProvided,
      'serviceDescription': serviceDescription,
      'preferredContact': preferredContact,
      'user': user.toJson(),
    };
  }
}


class VendorUser {
  final String email;

  VendorUser({
    required this.email,
  });

  factory VendorUser.fromJson(Map<String, dynamic> json) {
    return VendorUser(
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
