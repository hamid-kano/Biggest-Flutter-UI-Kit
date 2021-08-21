class PCPlayerListModel {
  // ignore: non_constant_identifier_names
  List<CricketTeam>? cricket_Team;

  // ignore: non_constant_identifier_names
  PCPlayerListModel({this.cricket_Team});

  factory PCPlayerListModel.fromJson(Map<String, dynamic> json) {
    return PCPlayerListModel(
      cricket_Team: json['Cricket_Team'] != null ? (json['Cricket_Team'] as List).map((i) => CricketTeam.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cricket_Team != null) {
      data['Cricket_Team'] = this.cricket_Team!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CricketTeam {
  String? coachName;
  String? sName;
  String? teamIcon;
  String? teamName;
  List<TeamPlayer>? teamPlayers;

  CricketTeam({
    this.coachName,
    this.sName,
    this.teamIcon,
    this.teamName,
    this.teamPlayers,
  });

  factory CricketTeam.fromJson(Map<String, dynamic> json) {
    return CricketTeam(
      coachName: json['coachName'],
      sName: json['sName'],
      teamIcon: json['teamIcon'],
      teamName: json['teamName'],
      teamPlayers: json['teamPlayers'] != null ? (json['teamPlayers'] as List).map((i) => TeamPlayer.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coachName'] = this.coachName;
    data['sName'] = this.sName;
    data['teamIcon'] = this.teamIcon;
    data['teamName'] = this.teamName;
    if (this.teamPlayers != null) {
      data['teamPlayers'] = this.teamPlayers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamPlayer {
  String? id;
  bool? isCaptain;
  bool? isWicketKeeper;
  String? playerName;
  String? role;

  TeamPlayer({this.id, this.isWicketKeeper = false, this.playerName, this.role, this.isCaptain = false});

  factory TeamPlayer.fromJson(Map<String, dynamic> json) {
    return TeamPlayer(
      id: json['id'],
      isCaptain: json['isCaptain'],
      isWicketKeeper: json['isWicketKeeper'],
      playerName: json['playerName'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isCaptain'] = this.isCaptain;
    data['isWicketKeeper'] = this.isWicketKeeper;
    data['playerName'] = this.playerName;
    data['role'] = this.role;
    return data;
  }
}
