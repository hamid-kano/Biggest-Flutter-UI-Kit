import 'package:prokit_flutter/fullApps/proCricketUI/model/PCCommentaryPreviewData.dart';

class PCCommentaryInProgressData {
  String? alerts;

  // ignore: non_constant_identifier_names
  BatTeam? bat_team;
  List<Batsman>? batsman;

  // ignore: non_constant_identifier_names
  BowTeam? bow_team;
  List<Bowler>? bowler;

  // ignore: non_constant_identifier_names
  bool? burst_cache;

  // ignore: non_constant_identifier_names
  int? burst_cache_id;

  // ignore: non_constant_identifier_names
  int? burst_cache_time;

  // ignore: non_constant_identifier_names
  List<CommLine>? comm_lines;
  String? crr;

  // ignore: non_constant_identifier_names
  String? data_path;
  Header? header;

  // ignore: non_constant_identifier_names
  String? last_wkt;

  // ignore: non_constant_identifier_names
  String? last_wkt_name;

  // ignore: non_constant_identifier_names
  String? last_wkt_score;

  // ignore: non_constant_identifier_names
  String? match_id;

  // ignore: non_constant_identifier_names
  OverSummary? over_summary;

  // ignore: non_constant_identifier_names
  String? overs_left;
  String? prtshp;
  int? pulltoRefreshStopRate;
  String? range;

  // ignore: non_constant_identifier_names
  String? series_id;

  // ignore: non_constant_identifier_names
  String? series_name;
  String? target;
  Venue? venue;

  PCCommentaryInProgressData(
      {this.alerts,
      // ignore: non_constant_identifier_names
      this.bat_team,
      this.batsman,
      // ignore: non_constant_identifier_names
      this.bow_team,
      this.bowler,
      // ignore: non_constant_identifier_names
      this.burst_cache,
      // ignore: non_constant_identifier_names
      this.burst_cache_id,
      // ignore: non_constant_identifier_names
      this.burst_cache_time,
      // ignore: non_constant_identifier_names
      this.comm_lines,
      this.crr,
      // ignore: non_constant_identifier_names
      this.data_path,
      this.header,
      // ignore: non_constant_identifier_names
      this.last_wkt,
      // ignore: non_constant_identifier_names
      this.last_wkt_name,
      // ignore: non_constant_identifier_names
      this.last_wkt_score,
      // ignore: non_constant_identifier_names
      this.match_id,
      // ignore: non_constant_identifier_names
      this.over_summary,
      // ignore: non_constant_identifier_names
      this.overs_left,
      this.prtshp,
      this.pulltoRefreshStopRate,
      this.range,
      // ignore: non_constant_identifier_names
      this.series_id,
      // ignore: non_constant_identifier_names
      this.series_name,
      this.target,
      this.venue});

  factory PCCommentaryInProgressData.fromJson(Map<String, dynamic> json) {
    return PCCommentaryInProgressData(
      alerts: json['alerts'],
      bat_team: json['bat_team'] != null ? BatTeam.fromJson(json['bat_team']) : null,
      batsman: json['batsman'] != null ? (json['batsman'] as List).map((i) => Batsman.fromJson(i)).toList() : null,
      bow_team: json['bow_team'] != null ? BowTeam.fromJson(json['bow_team']) : null,
      bowler: json['bowler'] != null ? (json['bowler'] as List).map((i) => Bowler.fromJson(i)).toList() : null,
      burst_cache: json['burst_cache'],
      burst_cache_id: json['burst_cache_id'],
      burst_cache_time: json['burst_cache_time'],
      comm_lines: json['comm_lines'] != null ? (json['comm_lines'] as List).map((i) => CommLine.fromJson(i)).toList() : null,
      crr: json['crr'],
      data_path: json['data_path'],
      header: json['header'] != null ? Header.fromJson(json['header']) : null,
      last_wkt: json['last_wkt'],
      last_wkt_name: json['last_wkt_name'],
      last_wkt_score: json['last_wkt_score'],
      match_id: json['match_id'],
      over_summary: json['over_summary'] != null ? OverSummary.fromJson(json['over_summary']) : null,
      overs_left: json['overs_left'],
      prtshp: json['prtshp'],
      pulltoRefreshStopRate: json['pulltoRefreshStopRate'],
      range: json['range'],
      series_id: json['series_id'],
      series_name: json['series_name'],
      target: json['target'],
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alerts'] = this.alerts;
    data['burst_cache'] = this.burst_cache;
    data['burst_cache_id'] = this.burst_cache_id;
    data['burst_cache_time'] = this.burst_cache_time;
    data['crr'] = this.crr;
    data['data_path'] = this.data_path;
    data['last_wkt'] = this.last_wkt;
    data['last_wkt_name'] = this.last_wkt_name;
    data['last_wkt_score'] = this.last_wkt_score;
    data['match_id'] = this.match_id;
    data['overs_left'] = this.overs_left;
    data['prtshp'] = this.prtshp;
    data['pulltoRefreshStopRate'] = this.pulltoRefreshStopRate;
    data['range'] = this.range;
    data['series_id'] = this.series_id;
    data['series_name'] = this.series_name;
    data['target'] = this.target;
    if (this.bat_team != null) {
      data['bat_team'] = this.bat_team!.toJson();
    }
    if (this.batsman != null) {
      data['batsman'] = this.batsman!.map((v) => v.toJson()).toList();
    }
    if (this.bow_team != null) {
      data['bow_team'] = this.bow_team!.toJson();
    }
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.map((v) => v.toJson()).toList();
    }
    if (this.comm_lines != null) {
      data['comm_lines'] = this.comm_lines!.map((v) => v.toJson()).toList();
    }
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.over_summary != null) {
      data['over_summary'] = this.over_summary!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    return data;
  }
}

class Bowler {
  String? id;
  String? m;
  String? name;
  String? o;
  String? r;
  String? w;

  Bowler({this.id, this.m, this.name, this.o, this.r, this.w});

  factory Bowler.fromJson(Map<String, dynamic> json) {
    return Bowler(
      id: json['id'],
      m: json['m'],
      name: json['name'],
      o: json['o'],
      r: json['r'],
      w: json['w'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['m'] = this.m;
    data['name'] = this.name;
    data['o'] = this.o;
    data['r'] = this.r;
    data['w'] = this.w;
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

class BowTeam {
  String? id;
  List<InningX>? innings;
  String? name;

  BowTeam({this.id, this.innings, this.name});

  factory BowTeam.fromJson(Map<String, dynamic> json) {
    return BowTeam(
      id: json['id'],
      innings: json['innings'] != null ? (json['innings'] as List).map((i) => InningX.fromJson(i)).toList() : null,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.innings != null) {
      data['innings'] = this.innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inning {
  String? id;
  String? overs;
  String? score;
  String? wkts;

  Inning({this.id, this.overs, this.score, this.wkts});

  factory Inning.fromJson(Map<String, dynamic> json) {
    return Inning(
      id: json['id'],
      overs: json['overs'],
      score: json['score'],
      wkts: json['wkts'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overs'] = this.overs;
    data['score'] = this.score;
    data['wkts'] = this.wkts;
    return data;
  }
}

class OverSummary {
  // ignore: non_constant_identifier_names
  String? ball_def;
  String? fours;
  String? over;

  // ignore: non_constant_identifier_names
  String? rem_over;
  String? runs;
  String? sixes;
  String? wickets;

  // ignore: non_constant_identifier_names
  OverSummary({this.ball_def, this.fours, this.over, this.rem_over, this.runs, this.sixes, this.wickets});

  factory OverSummary.fromJson(Map<String, dynamic> json) {
    return OverSummary(
      ball_def: json['ball_def'],
      fours: json['fours'],
      over: json['over'],
      rem_over: json['rem_over'],
      runs: json['runs'],
      sixes: json['sixes'],
      wickets: json['wickets'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ball_def'] = this.ball_def;
    data['fours'] = this.fours;
    data['over'] = this.over;
    data['rem_over'] = this.rem_over;
    data['runs'] = this.runs;
    data['sixes'] = this.sixes;
    data['wickets'] = this.wickets;
    return data;
  }
}

class BatTeam {
  String? id;
  List<Inning>? innings;
  String? name;

  BatTeam({this.id, this.innings, this.name});

  factory BatTeam.fromJson(Map<String, dynamic> json) {
    return BatTeam(
      id: json['id'],
      innings: json['innings'] != null ? (json['innings'] as List).map((i) => Inning.fromJson(i)).toList() : null,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.innings != null) {
      data['innings'] = this.innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InningX {
  String? id;
  String? overs;
  String? score;
  String? wkts;

  InningX({this.id, this.overs, this.score, this.wkts});

  factory InningX.fromJson(Map<String, dynamic> json) {
    return InningX(
      id: json['id'],
      overs: json['overs'],
      score: json['score'],
      wkts: json['wkts'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overs'] = this.overs;
    data['score'] = this.score;
    data['wkts'] = this.wkts;
    return data;
  }
}

class Batsman {
  String? fours;
  String? sixes;
  String? b;
  String? id;
  String? name;
  String? r;
  String? strike;

  Batsman({this.fours, this.sixes, this.b, this.id, this.name, this.r, this.strike});

  factory Batsman.fromJson(Map<String, dynamic> json) {
    return Batsman(
      fours: json['4s'],
      sixes: json['6s'],
      b: json['b'],
      id: json['id'],
      name: json['name'],
      r: json['r'],
      strike: json['strike'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['4s'] = this.fours;
    data['6s'] = this.sixes;
    data['b'] = this.b;
    data['id'] = this.id;
    data['name'] = this.name;
    data['r'] = this.r;
    data['strike'] = this.strike;
    return data;
  }
}

class CommLine {
  // ignore: non_constant_identifier_names
  String? bat_ns_balls;

  // ignore: non_constant_identifier_names
  String? bat_ns_name;

  // ignore: non_constant_identifier_names
  String? bat_ns_runs;

  // ignore: non_constant_identifier_names
  String? bat_s_balls;

  // ignore: non_constant_identifier_names
  String? bat_s_name;

  // ignore: non_constant_identifier_names
  String? bat_s_runs;
  String? bgcolor;

  // ignore: non_constant_identifier_names
  String? bowl_maidens;

  // ignore: non_constant_identifier_names
  String? bowl_name;

  // ignore: non_constant_identifier_names
  String? bowl_overs;

  // ignore: non_constant_identifier_names
  String? bowl_runs;

  // ignore: non_constant_identifier_names
  String? bowl_wickets;
  String? comm;
  String? evt;

  // ignore: non_constant_identifier_names
  String? i_id;
  String? img;
  String? link;

  // ignore: non_constant_identifier_names
  String? o_no;

  // ignore: non_constant_identifier_names
  String? o_summary;
  String? runs;
  String? score;
  String? timestamp;
  String? wkts;

  CommLine(
      // ignore: non_constant_identifier_names
      {this.bat_ns_balls,
      // ignore: non_constant_identifier_names
      this.bat_ns_name,
      // ignore: non_constant_identifier_names
      this.bat_ns_runs,
      // ignore: non_constant_identifier_names
      this.bat_s_balls,
      // ignore: non_constant_identifier_names
      this.bat_s_name,
      // ignore: non_constant_identifier_names
      this.bat_s_runs,
      this.bgcolor,
      // ignore: non_constant_identifier_names
      this.bowl_maidens,
      // ignore: non_constant_identifier_names
      this.bowl_name,
      // ignore: non_constant_identifier_names
      this.bowl_overs,
      // ignore: non_constant_identifier_names
      this.bowl_runs,
      // ignore: non_constant_identifier_names
      this.bowl_wickets,
      this.comm,
      this.evt,
      // ignore: non_constant_identifier_names
      this.i_id,
      this.img,
      this.link,
      // ignore: non_constant_identifier_names
      this.o_no,
      // ignore: non_constant_identifier_names
      this.o_summary,
      this.runs,
      this.score,
      this.timestamp,
      this.wkts});

  factory CommLine.fromJson(Map<String, dynamic> json) {
    return CommLine(
      bat_ns_balls: json['bat_ns_balls'],
      bat_ns_name: json['bat_ns_name'],
      bat_ns_runs: json['bat_ns_runs'],
      bat_s_balls: json['bat_s_balls'],
      bat_s_name: json['bat_s_name'],
      bat_s_runs: json['bat_s_runs'],
      bgcolor: json['bgcolor'],
      bowl_maidens: json['bowl_maidens'],
      bowl_name: json['bowl_name'],
      bowl_overs: json['bowl_overs'],
      bowl_runs: json['bowl_runs'],
      bowl_wickets: json['bowl_wickets'],
      comm: json['comm'],
      evt: json['evt'],
      i_id: json['i_id'],
      img: json['img'],
      link: json['link'],
      o_no: json['o_no'],
      o_summary: json['o_summary'],
      runs: json['runs'],
      score: json['score'],
      timestamp: json['timestamp'],
      wkts: json['wkts'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bat_ns_balls'] = this.bat_ns_balls;
    data['bat_ns_name'] = this.bat_ns_name;
    data['bat_ns_runs'] = this.bat_ns_runs;
    data['bat_s_balls'] = this.bat_s_balls;
    data['bat_s_name'] = this.bat_s_name;
    data['bat_s_runs'] = this.bat_s_runs;
    data['bgcolor'] = this.bgcolor;
    data['bowl_maidens'] = this.bowl_maidens;
    data['bowl_name'] = this.bowl_name;
    data['bowl_overs'] = this.bowl_overs;
    data['bowl_runs'] = this.bowl_runs;
    data['bowl_wickets'] = this.bowl_wickets;
    data['comm'] = this.comm;
    data['evt'] = this.evt;
    data['i_id'] = this.i_id;
    data['img'] = this.img;
    data['link'] = this.link;
    data['o_no'] = this.o_no;
    data['o_summary'] = this.o_summary;
    data['runs'] = this.runs;
    data['score'] = this.score;
    data['timestamp'] = this.timestamp;
    data['wkts'] = this.wkts;
    return data;
  }
}
