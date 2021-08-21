class PCHistoryData {
  List<History>? history;

  PCHistoryData({this.history});

  factory PCHistoryData.fromJson(Map<String, dynamic> json) {
    return PCHistoryData(
      history: json['history'] != null ? (json['history'] as List).map((i) => History.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? champion;
  String? result;
  String? runnersUp;
  String? teamImage;
  String? teamOneScore;
  String? teamTwoScore;
  String? year;

  History({this.champion, this.result, this.runnersUp, this.teamImage, this.teamOneScore, this.teamTwoScore, this.year});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      champion: json['champion'],
      result: json['result'],
      runnersUp: json['runnersUp'],
      teamImage: json['teamImage'],
      teamOneScore: json['teamOneScore'],
      teamTwoScore: json['teamTwoScore'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['champion'] = this.champion;
    data['result'] = this.result;
    data['runnersUp'] = this.runnersUp;
    data['teamImage'] = this.teamImage;
    data['teamOneScore'] = this.teamOneScore;
    data['teamTwoScore'] = this.teamTwoScore;
    data['year'] = this.year;
    return data;
  }
}
