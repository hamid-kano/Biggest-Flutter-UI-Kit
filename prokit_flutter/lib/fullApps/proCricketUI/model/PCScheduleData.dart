class PCScheduleData {
  List<Schedule>? schedule;

  PCScheduleData({this.schedule});

  factory PCScheduleData.fromJson(Map<String, dynamic> json) {
    return PCScheduleData(
      schedule: json['schedule'] != null ? (json['schedule'] as List).map((i) => Schedule.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? alert;
  // ignore: non_constant_identifier_names
  String? created_at;
  String? ddt;
  String? ddtcode;
  String? desc;
  String? dt;
  int? id;
  String? isTest;
  String? matchTypeId;
  String? matchid;
  String? mchState;
  // ignore: non_constant_identifier_names
  String? mnth_yr;
  String? mom;
  // ignore: non_constant_identifier_names
  String? nxt_day;
  String? result;
  String? seriesid;
  int? start;
  String? strtdt;
  String? strttm;
  String? team1;
  String? team1Key;
  String? team2;
  String? team2Key;
  String? tr;
  int? tw;
  // ignore: non_constant_identifier_names
  String? updated_at;
  String? vnu;
  int? win;

  Schedule(
      {this.alert,
      // ignore: non_constant_identifier_names
      this.created_at,
      this.ddt,
      this.ddtcode,
      this.desc,
      this.dt,
      this.id,
      this.isTest,
      this.matchTypeId,
      this.matchid,
      this.mchState,
      // ignore: non_constant_identifier_names
      this.mnth_yr,
      this.mom,
      // ignore: non_constant_identifier_names
      this.nxt_day,
      this.result,
      this.seriesid,
      this.start,
      this.strtdt,
      this.strttm,
      this.team1,
      this.team1Key,
      this.team2,
      this.team2Key,
      this.tr,
      this.tw,
      // ignore: non_constant_identifier_names
      this.updated_at,
      this.vnu,
      this.win});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      alert: json['alert'],
      created_at: json['created_at'],
      ddt: json['ddt'],
      ddtcode: json['ddtcode'],
      desc: json['desc'],
      dt: json['dt'],
      id: json['id'],
      isTest: json['isTest'],
      matchTypeId: json['matchTypeId'],
      matchid: json['matchid'],
      mchState: json['mchState'],
      mnth_yr: json['mnth_yr'],
      mom: json['mom'],
      nxt_day: json['nxt_day'],
      result: json['result'],
      seriesid: json['seriesid'],
      start: json['start'],
      strtdt: json['strtdt'],
      strttm: json['strttm'],
      team1: json['team1'],
      team1Key: json['team1Key'],
      team2: json['team2'],
      team2Key: json['team2Key'],
      tr: json['tr'],
      tw: json['tw'],
      updated_at: json['updated_at'],
      vnu: json['vnu'],
      win: json['win'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alert'] = this.alert;
    data['created_at'] = this.created_at;
    data['ddt'] = this.ddt;
    data['ddtcode'] = this.ddtcode;
    data['desc'] = this.desc;
    data['dt'] = this.dt;
    data['id'] = this.id;
    data['isTest'] = this.isTest;
    data['matchTypeId'] = this.matchTypeId;
    data['matchid'] = this.matchid;
    data['mchState'] = this.mchState;
    data['mnth_yr'] = this.mnth_yr;
    data['mom'] = this.mom;
    data['nxt_day'] = this.nxt_day;
    data['result'] = this.result;
    data['seriesid'] = this.seriesid;
    data['start'] = this.start;
    data['strtdt'] = this.strtdt;
    data['strttm'] = this.strttm;
    data['team1'] = this.team1;
    data['team1Key'] = this.team1Key;
    data['team2'] = this.team2;
    data['team2Key'] = this.team2Key;
    data['tr'] = this.tr;
    data['tw'] = this.tw;
    data['updated_at'] = this.updated_at;
    data['vnu'] = this.vnu;
    data['win'] = this.win;
    return data;
  }
}
