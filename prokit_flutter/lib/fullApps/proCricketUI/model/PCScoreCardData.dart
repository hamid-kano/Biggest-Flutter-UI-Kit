class PCScoreCardData {
  List<Inning>? innings;
  String? state;
  String? status;

  PCScoreCardData({this.innings, this.state, this.status});

  factory PCScoreCardData.fromJson(Map<String, dynamic> json) {
    return PCScoreCardData(
      innings: json['Innings'] != null ? (json['Innings'] as List).map((i) => Inning.fromJson(i)).toList() : null,
      state: json['state'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['status'] = this.status;
    if (this.innings != null) {
      data['innings'] = this.innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inning {
  // ignore: non_constant_identifier_names
  String? bat_team_id;
  // ignore: non_constant_identifier_names
  String? bat_team_name;
  List<Batsmen>? batsmen;
  // ignore: non_constant_identifier_names
  String? bowl_team_id;
  List<Bowler>? bowlers;
  Extras? extras;
  List<Fow>? fow;
  // ignore: non_constant_identifier_names
  String? innings_id;
  String? ovr;
  String? score;
  String? wkts;

  // ignore: non_constant_identifier_names
  Inning({this.bat_team_id, this.bat_team_name, this.batsmen, this.bowl_team_id, this.bowlers, this.extras, this.fow, this.innings_id, this.ovr, this.score, this.wkts});

  factory Inning.fromJson(Map<String, dynamic> json) {
    return Inning(
      bat_team_id: json['bat_team_id'],
      bat_team_name: json['bat_team_name'],
      batsmen: json['batsmen'] != null ? (json['batsmen'] as List).map((i) => Batsmen.fromJson(i)).toList() : null,
      bowl_team_id: json['bowl_team_id'],
      bowlers: json['bowlers'] != null ? (json['bowlers'] as List).map((i) => Bowler.fromJson(i)).toList() : null,
      extras: json['extras'] != null ? Extras.fromJson(json['extras']) : null,
      fow: json['fow'] != null ? (json['fow'] as List).map((i) => Fow.fromJson(i)).toList() : null,
      innings_id: json['innings_id'],
      ovr: json['ovr'],
      score: json['score'],
      wkts: json['wkts'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bat_team_id'] = this.bat_team_id;
    data['bat_team_name'] = this.bat_team_name;
    data['bowl_team_id'] = this.bowl_team_id;
    data['innings_id'] = this.innings_id;
    data['ovr'] = this.ovr;
    data['score'] = this.score;
    data['wkts'] = this.wkts;
    if (this.batsmen != null) {
      data['batsmen'] = this.batsmen!.map((v) => v.toJson()).toList();
    }
    if (this.bowlers != null) {
      data['bowlers'] = this.bowlers!.map((v) => v.toJson()).toList();
    }
    if (this.extras != null) {
      data['extras'] = this.extras!.toJson();
    }
    if (this.fow != null) {
      data['fow'] = this.fow!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bowler {
  String? id;
  String? m;
  String? n;
  String? o;
  String? r;
  String? w;
  String? wd;

  Bowler({this.id, this.m, this.n, this.o, this.r, this.w, this.wd});

  factory Bowler.fromJson(Map<String, dynamic> json) {
    return Bowler(
      id: json['id'],
      m: json['m'],
      n: json['n'],
      o: json['o'],
      r: json['r'],
      w: json['w'],
      wd: json['wd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['m'] = this.m;
    data['n'] = this.n;
    data['o'] = this.o;
    data['r'] = this.r;
    data['w'] = this.w;
    data['wd'] = this.wd;
    return data;
  }
}

class Batsmen {
  String? fours;
  String? sixes;
  String? b;
  String? id;
  // ignore: non_constant_identifier_names
  String? out_desc;
  String? r;

  // ignore: non_constant_identifier_names
  Batsmen({this.fours, this.sixes, this.b, this.id, this.out_desc, this.r});

  factory Batsmen.fromJson(Map<String, dynamic> json) {
    return Batsmen(
      fours: json['4s'],
      sixes: json['6s'],
      b: json['b'],
      id: json['id'],
      out_desc: json['out_desc'],
      r: json['r'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['4s'] = this.fours;
    data['6s'] = this.sixes;
    data['b'] = this.b;
    data['id'] = this.id;
    data['out_desc'] = this.out_desc;
    data['r'] = this.r;
    return data;
  }
}

class Extras {
  String? b;
  String? lb;
  String? nb;
  String? p;
  String? t;
  String? wd;

  Extras({this.b, this.lb, this.nb, this.p, this.t, this.wd});

  factory Extras.fromJson(Map<String, dynamic> json) {
    return Extras(
      b: json['b'],
      lb: json['lb'],
      nb: json['nb'],
      p: json['p'],
      t: json['t'],
      wd: json['wd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['b'] = this.b;
    data['lb'] = this.lb;
    data['nb'] = this.nb;
    data['p'] = this.p;
    data['t'] = this.t;
    data['wd'] = this.wd;
    return data;
  }
}

class Fow {
  String? id;
  String? over;
  String? score;
  // ignore: non_constant_identifier_names
  String? wkt_nbr;

  // ignore: non_constant_identifier_names
  Fow({this.id, this.over, this.score, this.wkt_nbr});

  factory Fow.fromJson(Map<String, dynamic> json) {
    return Fow(
      id: json['id'],
      over: json['over'],
      score: json['score'],
      wkt_nbr: json['wkt_nbr'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['over'] = this.over;
    data['score'] = this.score;
    data['wkt_nbr'] = this.wkt_nbr;
    return data;
  }
}
