class HerafyModel {
  final String? herafyName;
  final String? age;
  final String? email;
  final String? phoneNumber;
  final String? major;
  HerafyModel( {required this.major,required this.herafyName,required this.age,required this.email,required this.phoneNumber});

  factory HerafyModel.fromjson(json){
    return HerafyModel(
      herafyName: json["herafyName"],
      age: json["age"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      major: json["major"],
      );
  }
}