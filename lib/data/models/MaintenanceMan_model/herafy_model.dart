class HerafyModel {
  final String? herafyID;
  final String? herafyName;
  final String? age;
  final String? email;
  final String? phoneNumber;
  final String? major;
  final String? imageUrl;
  final String? status;
  final double rate;
  final int numberOfResidents;
  final List experiences;
  final List availableServices;
  HerafyModel( {
    required this.status,
    required this.numberOfResidents,
    required this.imageUrl,
    required this.major,
    required this.herafyID,
    required this.herafyName,
    required this.age,
    required this.email,
    required this.phoneNumber,
    required this.rate,
    required this.experiences,
    required this.availableServices,
  });

  factory HerafyModel.fromJson(json) {
    return HerafyModel(
        status: json["status"],
        numberOfResidents: json["numberOfResidents"],
        rate: json["rate"],
        herafyName: json["herafyName"],
        imageUrl: json["imageUrl"],
        age: json["age"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        major: json["major"],
        herafyID: json["herafyID"],
        experiences: json["experiences"],
        availableServices: json["availableServices"],
        );
  }
}
