class OrderModel {
  final String userID;
  final String herafyID;
  final String userName;
  final String phoneNumber;
  final String governorateName;
  final String cityName;
  OrderModel({required this.userID,required this.herafyID,required this.userName,required this.phoneNumber,required this.governorateName,required this.cityName,}); 
  factory OrderModel.fromJson(jsonData)
  {
    return OrderModel(
      userID: jsonData["userID"], 
      herafyID: jsonData["herafyID"], 
      userName: jsonData["userName"], 
      phoneNumber: jsonData["phoneNumber"], 
      governorateName: jsonData["governorateName"], 
      cityName: jsonData["cityName"], 
    );
  }
}
