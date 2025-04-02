class HerafyModel {
  final String? herafyName;
  final String? age;
  final String? email;
  final String? phoneNumber;
  final String? major;
  final String? imageUrl;
  HerafyModel(
      {required this.imageUrl,
      required this.major,
      required this.herafyName,
      required this.age,
      required this.email,
      required this.phoneNumber});

  factory HerafyModel.fromJson(json) {
    return HerafyModel(
      herafyName: json["herafyName"],
      imageUrl: json["imageUrl"],
      age: json["age"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      major: json["major"],
    );
  }
}
