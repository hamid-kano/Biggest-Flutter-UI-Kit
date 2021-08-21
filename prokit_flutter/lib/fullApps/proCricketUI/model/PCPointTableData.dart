class PCPointTableData {
  // ignore: non_constant_identifier_names
  bool? consider_group;
  Group? group;
  List<String>? header;
  // ignore: non_constant_identifier_names
  MinQual? min_qual;
  List<String>? order;
  // ignore: non_constant_identifier_names
  String? series_id;
  // ignore: non_constant_identifier_names
  String? series_name;
  List<String>? title;

  // ignore: non_constant_identifier_names
  PCPointTableData({this.consider_group, this.group, this.header, this.min_qual, this.order, this.series_id, this.series_name, this.title});

  factory PCPointTableData.fromJson(Map<String, dynamic> json) {
    return PCPointTableData(
      consider_group: json['consider_group'],
      group: json['group'] != null ? Group.fromJson(json['group']) : null,
      header: json['header'] != null ? new List<String>.from(json['header']) : null,
      min_qual: json['min_qual'] != null ? MinQual.fromJson(json['min_qual']) : null,
      order: json['order'] != null ? new List<String>.from(json['order']) : null,
      series_id: json['series_id'],
      series_name: json['series_name'],
      title: json['title'] != null ? new List<String>.from(json['title']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consider_group'] = this.consider_group;
    data['series_id'] = this.series_id;
    data['series_name'] = this.series_name;
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.header != null) {
      data['header'] = this.header;
    }
    if (this.min_qual != null) {
      data['min_qual'] = this.min_qual!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    return data;
  }
}

class MinQual {
  String? teams;

  MinQual({this.teams});

  factory MinQual.fromJson(Map<String, dynamic> json) {
    return MinQual(
      teams: json['teams'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teams'] = this.teams;
    return data;
  }
}

class Group {
  List<Team>? teams;

  Group({this.teams});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      teams: json['teams'] != null ? (json['teams'] as List).map((i) => Team.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String? id;
  String? l;
  String? name;
  String? sName;
  String? nr;
  String? nrr;
  String? p;
  String? points;
  String? t;
  String? w;

  Team({this.id, this.l, this.name, this.sName, this.nr, this.nrr, this.p, this.points, this.t, this.w});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      l: json['l'],
      name: json['name'],
      sName: json['sName'],
      nr: json['nr'],
      nrr: json['nrr'],
      p: json['p'],
      points: json['points'],
      t: json['t'],
      w: json['w'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['l'] = this.l;
    data['name'] = this.name;
    data['sName'] = this.sName;
    data['nr'] = this.nr;
    data['nrr'] = this.nrr;
    data['p'] = this.p;
    data['points'] = this.points;
    data['t'] = this.t;
    data['w'] = this.w;
    return data;
  }
}
