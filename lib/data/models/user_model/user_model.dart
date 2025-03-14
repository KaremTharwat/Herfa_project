class UserModel {
final String? email;
final String? password;
final String? userName;
final String? phoneNumber;
final String? cityName;
final String? governorateName;


  UserModel({required this.email, required this.password, required this.userName, required this.phoneNumber, required this.cityName, required this.governorateName});

factory UserModel.fromJson(jsonData)
{
  return UserModel(email:jsonData["email"], password: jsonData["password"], userName: jsonData["userName"], phoneNumber: jsonData["phoneNumber"], cityName: jsonData["cityName"], governorateName: jsonData["governorateName"]);
}
}