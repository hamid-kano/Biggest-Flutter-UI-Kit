class PCRanking {
  Player? player;
  Team? team;

  PCRanking({this.player, this.team});

  factory PCRanking.fromJson(Map<String, dynamic> json) {
    return PCRanking(
      player: json['player'] != null ? Player.fromJson(json['player']) : null,
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
    );
  }
}

class Player {
  FiledType? oDI;
  FiledType? t20;
  FiledType? tEST;

  Player({this.oDI, this.t20, this.tEST});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      oDI: json['ODI'] != null ? FiledType.fromJson(json['ODI']) : null,
      t20: json['T20'] != null ? FiledType.fromJson(json['T20']) : null,
      tEST: json['TEST'] != null ? FiledType.fromJson(json['TEST']) : null,
    );
  }
}

class Team {
  List<ODI>? oDI;
  List<T20>? t20;
  List<TEST>? tEST;

  Team({this.oDI, this.t20, this.tEST});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      oDI: json['ODI'] != null ? (json['ODI'] as List).map((i) => ODI.fromJson(i)).toList() : null,
      t20: json['T20'] != null ? (json['T20'] as List).map((i) => T20.fromJson(i)).toList() : null,
      tEST: json['TEST'] != null ? (json['TEST'] as List).map((i) => TEST.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.oDI != null) {
      data['oDI'] = this.oDI!.map((v) => v.toJson()).toList();
    }
    if (this.t20 != null) {
      data['t20'] = this.t20!.map((v) => v.toJson()).toList();
    }
    if (this.tEST != null) {
      data['tEST'] = this.tEST!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TEST {
  String? id;
  String? img;
  String? matches;
  String? name;
  String? points;
  String? rank;
  String? rating;

  TEST({this.id, this.img, this.matches, this.name, this.points, this.rank, this.rating});

  factory TEST.fromJson(Map<String, dynamic> json) {
    return TEST(
      id: json['id'],
      img: json['img'],
      matches: json['matches'],
      name: json['name'],
      points: json['points'],
      rank: json['rank'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['matches'] = this.matches;
    data['name'] = this.name;
    data['points'] = this.points;
    data['rank'] = this.rank;
    data['rating'] = this.rating;
    return data;
  }
}

class T20 {
  String? id;
  String? img;
  String? matches;
  String? name;
  String? points;
  String? rank;
  String? rating;

  T20({this.id, this.img, this.matches, this.name, this.points, this.rank, this.rating});

  factory T20.fromJson(Map<String, dynamic> json) {
    return T20(
      id: json['id'],
      img: json['img'],
      matches: json['matches'],
      name: json['name'],
      points: json['points'],
      rank: json['rank'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['matches'] = this.matches;
    data['name'] = this.name;
    data['points'] = this.points;
    data['rank'] = this.rank;
    data['rating'] = this.rating;
    return data;
  }
}

class ODI {
  String? id;
  String? img;
  String? matches;
  String? name;
  String? points;
  String? rank;
  String? rating;

  ODI({this.id, this.img, this.matches, this.name, this.points, this.rank, this.rating});

  factory ODI.fromJson(Map<String, dynamic> json) {
    return ODI(
      id: json['id'],
      img: json['img'],
      matches: json['matches'],
      name: json['name'],
      points: json['points'],
      rank: json['rank'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['matches'] = this.matches;
    data['name'] = this.name;
    data['points'] = this.points;
    data['rank'] = this.rank;
    data['rating'] = this.rating;
    return data;
  }
}

class RankType {
  ODI? oDI;
  T20? t20;
  TEST? tEST;

  RankType({this.oDI, this.t20, this.tEST});

  factory RankType.fromJson(Map<String, dynamic> json) {
    return RankType(
      oDI: json['ODI'] != null ? ODI.fromJson(json['ODI']) : null,
      t20: json['T20'] != null ? T20.fromJson(json['T20']) : null,
      tEST: json['TEST'] != null ? TEST.fromJson(json['TEST']) : null,
    );
  }
}

class FiledType {
  List<Rank>? allrounder;
  List<Rank>? batting;
  List<Rank>? bowling;

  FiledType({this.allrounder, this.batting, this.bowling});

  factory FiledType.fromJson(Map<String, dynamic> json) {
    return FiledType(
      allrounder: json['allrounder'] != null ? (json['allrounder'] as List).map((i) => Rank.fromJson(i)).toList() : null,
      batting: json['batting'] != null ? (json['batting'] as List).map((i) => Rank.fromJson(i)).toList() : null,
      bowling: json['bowling'] != null ? (json['bowling'] as List).map((i) => Rank.fromJson(i)).toList() : null,
    );
  }
}

class Rank {
  String? avg;
  String? country;
  // ignore: non_constant_identifier_names
  String? country_id;
  String? id;
  String? img;
  String? name;
  String? rank;
  String? rating;

  // ignore: non_constant_identifier_names
  Rank({this.avg, this.country, this.country_id, this.id, this.img, this.name, this.rank, this.rating});

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      avg: json['avg'],
      country: json['country'],
      country_id: json['country_id'],
      id: json['id'],
      img: json['img'],
      name: json['name'],
      rank: json['rank'],
      rating: json['rating'],
    );
  }
}
