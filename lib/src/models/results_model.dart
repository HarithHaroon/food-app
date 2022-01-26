class ResultsModel {
  List<dynamic> businesses;

  ResultsModel({
    this.businesses,
  });

  ResultsModel.fromJson(Map<String, dynamic> parsedJson) {
    businesses = parsedJson['businesses'];
  }
}
