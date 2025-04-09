class HerafyModel {
  final String? herafyID;
  final String? herafyName;
  final String? age;
  final String? email;
  final String? phoneNumber;
  final String? major;
  final String? imageUrl;
  final String? status;
  HerafyModel( 
      {required this.imageUrl,
      required this.major,
      required this.herafyID,
      required this.herafyName,
      required this.age,
      required this.email,
      required this.phoneNumber,
      required this.status,
      });

  factory HerafyModel.fromJson(json) {
    return HerafyModel(
      status: json["status"],
      herafyName: json["herafyName"],
      imageUrl: json["imageUrl"],
      age: json["age"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      major: json["major"],
      herafyID: json["herafyID"]
    );
  }
}
