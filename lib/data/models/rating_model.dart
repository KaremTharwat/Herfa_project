class RatingModel {
  final String userID;
  final String herafyID;
  final String evaluationText;
  final double rate;
  RatingModel({required this.userID,required this.herafyID,required this.evaluationText,required this.rate}); 
  factory RatingModel.fromJson(jsonData)
  {
    return RatingModel(
      userID: jsonData["userID"], 
      herafyID: jsonData["herafyID"], 
      evaluationText: jsonData["evaluationText"], 
      rate: jsonData["rate"], 
    );
  }
}
