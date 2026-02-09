class EventVendor {
  final int id;
  final List<String> portfolio;
  final String companyOwnerName;
  final String businessName;
  final String operatingAddress;
  final List<String> servicesProvided;

  EventVendor({
    required this.id,
    required this.portfolio,
    required this.companyOwnerName,
    required this.businessName,
    required this.operatingAddress,
    required this.servicesProvided,
  });

  factory EventVendor.fromJson(Map<String, dynamic> json) {
    return EventVendor(
      id: json['id'],
      portfolio: List<String>.from(json['portfolio']),
      companyOwnerName: json['companyOwnerName'],
      businessName: json['businessName'],
      operatingAddress: json['operatingAddress'],
      servicesProvided: List<String>.from(json['servicesProvided']),
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
    };
  }
}
