class RatingModel {
  final String userID;
  final String userName;
  final String herafyID;
  final String evaluationText;
  final double rate;
  RatingModel({required this.userName, required this.userID,required this.herafyID,required this.evaluationText,required this.rate}); 
  factory RatingModel.fromJson(jsonData)
  {
    return RatingModel(
      userID: jsonData["userID"], 
      userName: jsonData["userName"], 
      herafyID: jsonData["herafyID"], 
      evaluationText: jsonData["evaluationText"], 
      rate: jsonData["rate"], 
    );
  }
}
