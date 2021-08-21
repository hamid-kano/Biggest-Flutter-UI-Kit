class PCSummaryData {
  String? alerts;
  // ignore: non_constant_identifier_names
  String? data_path;
  Header? header;
  // ignore: non_constant_identifier_names
  String? match_id;
  Official? official;
  List<Player>? players;
  // ignore: non_constant_identifier_names
  String? series_id;
  // ignore: non_constant_identifier_names
  String? series_name;
  Team1? team1;
  Team2? team2;
  Toss? toss;
  Url? url;
  Venue? venue;

  // ignore: non_constant_identifier_names
  PCSummaryData({this.alerts, this.data_path, this.header, this.match_id, this.official, this.players, this.series_id, this.series_name, this.team1, this.team2, this.toss, this.url, this.venue});

  factory PCSummaryData.fromJson(Map<String, dynamic> json) {
    return PCSummaryData(
      alerts: json['alerts'],
      data_path: json['data_path'],
      header: json['header'] != null ? Header.fromJson(json['header']) : null,
      match_id: json['match_id'],
      official: json['official'] != null ? Official.fromJson(json['official']) : null,
      players: json['players'] != null ? (json['players'] as List).map((i) => Player.fromJson(i)).toList() : null,
      series_id: json['series_id'],
      series_name: json['series_name'],
      team1: json['team1'] != null ? Team1.fromJson(json['team1']) : null,
      team2: json['team2'] != null ? Team2.fromJson(json['team2']) : null,
      toss: json['toss'] != null ? Toss.fromJson(json['toss']) : null,
      url: json['url'] != null ? Url.fromJson(json['url']) : null,
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alerts'] = this.alerts;
    data['data_path'] = this.data_path;
    data['match_id'] = this.match_id;
    data['series_id'] = this.series_id;
    data['series_name'] = this.series_name;
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.official != null) {
      data['official'] = this.official!.toJson();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    if (this.team1 != null) {
      data['team1'] = this.team1!.toJson();
    }
    if (this.team2 != null) {
      data['team2'] = this.team2!.toJson();
    }
    if (this.toss != null) {
      data['toss'] = this.toss!.toJson();
    }
    if (this.url != null) {
      data['url'] = this.url!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    return data;
  }
}

class Url {
  String? match;

  Url({this.match});

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      match: json['match'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match'] = this.match;
    return data;
  }
}

class Venue {
  String? lat;
  String? location;
  String? long;
  String? name;
  String? timezone;

  Venue({this.lat, this.location, this.long, this.name, this.timezone});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      lat: json['lat'],
      location: json['location'],
      long: json['long'],
      name: json['name'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['location'] = this.location;
    data['long'] = this.long;
    data['name'] = this.name;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Team1 {
  String? flag;
  String? id;
  String? name;
  // ignore: non_constant_identifier_names
  String? s_name;
  List<int>? squad;
  // ignore: non_constant_identifier_names
  List<int>? squad_bench;

  // ignore: non_constant_identifier_names
  Team1({this.flag, this.id, this.name, this.s_name, this.squad, this.squad_bench});

  factory Team1.fromJson(Map<String, dynamic> json) {
    return Team1(
      flag: json['flag'],
      id: json['id'],
      name: json['name'],
      s_name: json['s_name'],
      squad: json['squad'] != null ? new List<int>.from(json['squad']) : null,
      squad_bench: json['squad_bench'] != null ? new List<int>.from(json['squad_bench']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['id'] = this.id;
    data['name'] = this.name;
    data['s_name'] = this.s_name;
    if (this.squad != null) {
      data['squad'] = this.squad;
    }
    if (this.squad_bench != null) {
      data['squad_bench'] = this.squad_bench;
    }
    return data;
  }
}

class Player {
  // ignore: non_constant_identifier_names
  String? bat_style;
  // ignore: non_constant_identifier_names
  String? bowl_style;
  // ignore: non_constant_identifier_names
  String? f_name;
  String? id;
  String? image;
  String? name;
  String? role;
  String? speciality;

  // ignore: non_constant_identifier_names
  Player({this.bat_style, this.bowl_style, this.f_name, this.id, this.image, this.name, this.role, this.speciality});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      bat_style: json['bat_style'],
      bowl_style: json['bowl_style'],
      f_name: json['f_name'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      role: json['role'],
      speciality: json['speciality'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bat_style'] = this.bat_style;
    data['bowl_style'] = this.bowl_style;
    data['f_name'] = this.f_name;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['role'] = this.role;
    data['speciality'] = this.speciality;
    return data;
  }
}

class Toss {
  String? decision;
  String? winner;

  Toss({this.decision, this.winner});

  factory Toss.fromJson(Map<String, dynamic> json) {
    return Toss(
      decision: json['decision'],
      winner: json['winner'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['decision'] = this.decision;
    data['winner'] = this.winner;
    return data;
  }
}

class Official {
  Referee? referee;
  Umpire1? umpire1;
  Umpire2? umpire2;
  Umpire3? umpire3;

  Official({this.referee, this.umpire1, this.umpire2, this.umpire3});

  factory Official.fromJson(Map<String, dynamic> json) {
    return Official(
      referee: json['referee'] != null ? Referee.fromJson(json['referee']) : null,
      umpire1: json['umpire1'] != null ? Umpire1.fromJson(json['umpire1']) : null,
      umpire2: json['umpire2'] != null ? Umpire2.fromJson(json['umpire2']) : null,
      umpire3: json['umpire3'] != null ? Umpire3.fromJson(json['umpire3']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.referee != null) {
      data['referee'] = this.referee!.toJson();
    }
    if (this.umpire1 != null) {
      data['umpire1'] = this.umpire1!.toJson();
    }
    if (this.umpire2 != null) {
      data['umpire2'] = this.umpire2!.toJson();
    }
    if (this.umpire3 != null) {
      data['umpire3'] = this.umpire3!.toJson();
    }
    return data;
  }
}

class Referee {
  String? country;
  String? id;
  String? name;

  Referee({this.country, this.id, this.name});

  factory Referee.fromJson(Map<String, dynamic> json) {
    return Referee(
      country: json['country'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Umpire3 {
  String? country;
  String? id;
  String? name;

  Umpire3({this.country, this.id, this.name});

  factory Umpire3.fromJson(Map<String, dynamic> json) {
    return Umpire3(
      country: json['country'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Umpire2 {
  String? country;
  String? id;
  String? name;

  Umpire2({this.country, this.id, this.name});

  factory Umpire2.fromJson(Map<String, dynamic> json) {
    return Umpire2(
      country: json['country'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Umpire1 {
  String? country;
  String? id;
  String? name;

  Umpire1({this.country, this.id, this.name});

  factory Umpire1.fromJson(Map<String, dynamic> json) {
    return Umpire1(
      country: json['country'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Header {
  // ignore: non_constant_identifier_names
  String? end_time;
  // ignore: non_constant_identifier_names
  String? match_desc;
  List<int>? mom;
  List<String>? momNames;
  // ignore: non_constant_identifier_names
  String? start_time;
  String? state;
  // ignore: non_constant_identifier_names
  String? state_title;
  String? status;
  String? toss;
  String? type;
  // ignore: non_constant_identifier_names
  int? winning_team_id;

  // ignore: non_constant_identifier_names
  Header({this.end_time, this.match_desc, this.mom, this.momNames, this.start_time, this.state, this.state_title, this.status, this.toss, this.type, this.winning_team_id});

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      end_time: json['end_time'],
      match_desc: json['match_desc'],
      mom: json['mom'] != null ? new List<int>.from(json['mom']) : null,
      momNames: json['momNames'] != null ? new List<String>.from(json['momNames']) : null,
      start_time: json['start_time'],
      state: json['state'],
      state_title: json['state_title'],
      status: json['status'],
      toss: json['toss'],
      type: json['type'],
      winning_team_id: json['winning_team_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end_time'] = this.end_time;
    data['match_desc'] = this.match_desc;
    data['start_time'] = this.start_time;
    data['state'] = this.state;
    data['state_title'] = this.state_title;
    data['status'] = this.status;
    data['toss'] = this.toss;
    data['type'] = this.type;
    data['winning_team_id'] = this.winning_team_id;
    if (this.mom != null) {
      data['mom'] = this.mom;
    }
    if (this.momNames != null) {
      data['momNames'] = this.momNames;
    }
    return data;
  }
}

class Team2 {
  String? flag;
  String? id;
  String? name;
  // ignore: non_constant_identifier_names
  String? s_name;
  List<int>? squad;
  // ignore: non_constant_identifier_names
  List<int>? squad_bench;

  // ignore: non_constant_identifier_names
  Team2({this.flag, this.id, this.name, this.s_name, this.squad, this.squad_bench});

  factory Team2.fromJson(Map<String, dynamic> json) {
    return Team2(
      flag: json['flag'],
      id: json['id'],
      name: json['name'],
      s_name: json['s_name'],
      squad: json['squad'] != null ? new List<int>.from(json['squad']) : null,
      squad_bench: json['squad_bench'] != null ? new List<int>.from(json['squad_bench']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['id'] = this.id;
    data['name'] = this.name;
    data['s_name'] = this.s_name;
    if (this.squad != null) {
      data['squad'] = this.squad;
    }
    if (this.squad_bench != null) {
      data['squad_bench'] = this.squad_bench;
    }
    return data;
  }
}
