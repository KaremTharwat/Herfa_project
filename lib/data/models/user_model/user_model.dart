class UserModel {
final String? email;
final String? userID;
final String? userName;
final String? phoneNumber;
final String? cityName;
final String? governorateName;
final String? status;


  UserModel({required this.status,required this.userID ,required this.email, required this.userName, required this.phoneNumber, required this.cityName, required this.governorateName});

factory UserModel.fromJson(jsonData)
{
  return UserModel(userID: jsonData["userID"], status: jsonData["status"],email:jsonData["email"],userName: jsonData["userName"], phoneNumber: jsonData["phoneNumber"], cityName: jsonData["cityName"], governorateName: jsonData["governorateName"]);
}
}