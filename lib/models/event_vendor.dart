class EventVendor {
  final int id;
  final List<String> portfolio;
  final String companyOwnerName;
  final String businessName;
  final String operatingAddress;
  final List<String> servicesProvided;
  final String serviceDescription;
  final String preferredContact;
  final String preferredContactValue;
  final VendorUser user;
   bool isfavorite;

  EventVendor({
    required this.id,
    required this.portfolio,
    required this.companyOwnerName,
    required this.businessName,
    required this.operatingAddress,
    required this.servicesProvided,
    required this.serviceDescription,
    required this.preferredContact,
    required this.preferredContactValue,
    required this.user,
    required this.isfavorite,
  });

  factory EventVendor.fromJson(Map<String, dynamic> json) {
    return EventVendor(
      id: json['id'] ?? 0,
      portfolio: List<String>.from(json['portfolio'] ?? []),
      companyOwnerName: json['companyOwnerName'] ?? '',
      businessName: json['businessName'] ?? '',
      operatingAddress: json['operatingAddress'] ?? '',
      servicesProvided: List<String>.from(json['servicesProvided'] ?? []),
      serviceDescription: json['serviceDescription'] ?? '',
      preferredContact: json['preferredContact'] ?? '',
      preferredContactValue: json['preferredContactValue'] ?? '',
      user: VendorUser.fromJson(json['user'] ?? {}),
        isfavorite: json['isfavorite'] ?? false
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
      'preferredContactValue': preferredContactValue,
      'user': user.toJson(),
      'isfavorite': isfavorite,
    };
  }

  @override
  String toString() {
    return 'EventVendor(id: $id, businessName: $businessName, owner: $companyOwnerName)';
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

  @override
  String toString() {
    return 'VendorUser(email: $email)';
  }
}
