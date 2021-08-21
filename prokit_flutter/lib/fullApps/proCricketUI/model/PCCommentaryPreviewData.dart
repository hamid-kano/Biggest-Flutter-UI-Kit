class PCCommentaryPreviewData {
  String? alerts;
  // ignore: non_constant_identifier_names
  bool? burst_cache;
  // ignore: non_constant_identifier_names
  int? burst_cache_id;
  // ignore: non_constant_identifier_names
  int? burst_cache_time;
  // ignore: non_constant_identifier_names
  List<CommLine>? comm_lines;
  // ignore: non_constant_identifier_names
  String? data_path;
  Header? header;
  // ignore: non_constant_identifier_names
  String? match_id;
  int? pulltoRefreshStopRate;
  String? range;
  // ignore: non_constant_identifier_names
  String? series_id;
  // ignore: non_constant_identifier_names
  String? series_name;
  Venue? venue;

  PCCommentaryPreviewData(
      {this.alerts,
      // ignore: non_constant_identifier_names
      this.burst_cache,
      // ignore: non_constant_identifier_names
      this.burst_cache_id,
      // ignore: non_constant_identifier_names
      this.burst_cache_time,
      // ignore: non_constant_identifier_names
      this.comm_lines,
      // ignore: non_constant_identifier_names
      this.data_path,
      this.header,
      // ignore: non_constant_identifier_names
      this.match_id,
      this.pulltoRefreshStopRate,
      this.range,
      // ignore: non_constant_identifier_names
      this.series_id,
      // ignore: non_constant_identifier_names
      this.series_name,
      this.venue});

  factory PCCommentaryPreviewData.fromJson(Map<String, dynamic> json) {
    return PCCommentaryPreviewData(
      alerts: json['alerts'],
      burst_cache: json['burst_cache'],
      burst_cache_id: json['burst_cache_id'],
      burst_cache_time: json['burst_cache_time'],
      comm_lines: json['comm_lines'] != null ? (json['comm_lines'] as List).map((i) => CommLine.fromJson(i)).toList() : null,
      data_path: json['data_path'],
      header: json['header'] != null ? Header.fromJson(json['header']) : null,
      match_id: json['match_id'],
      pulltoRefreshStopRate: json['pulltoRefreshStopRate'],
      range: json['range'],
      series_id: json['series_id'],
      series_name: json['series_name'],
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alerts'] = this.alerts;
    data['burst_cache'] = this.burst_cache;
    data['burst_cache_id'] = this.burst_cache_id;
    data['burst_cache_time'] = this.burst_cache_time;
    data['data_path'] = this.data_path;
    data['match_id'] = this.match_id;
    data['pulltoRefreshStopRate'] = this.pulltoRefreshStopRate;
    data['range'] = this.range;
    data['series_id'] = this.series_id;
    data['series_name'] = this.series_name;
    if (this.comm_lines != null) {
      data['comm_lines'] = this.comm_lines!.map((v) => v.toJson()).toList();
    }
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    return data;
  }
}

class Header {
  int? dn;
  // ignore: non_constant_identifier_names
  String? end_time;
  // ignore: non_constant_identifier_names
  String? match_desc;
  // ignore: non_constant_identifier_names
  String? start_time;
  String? state;
  // ignore: non_constant_identifier_names
  String? state_title;
  String? status;
  String? timeDiff;
  String? toss;
  String? type;

  // ignore: non_constant_identifier_names
  Header({this.dn, this.end_time, this.match_desc, this.start_time, this.state, this.state_title, this.status, this.timeDiff, this.toss, this.type});

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      dn: json['dn'],
      end_time: json['end_time'],
      match_desc: json['match_desc'],
      start_time: json['start_time'],
      state: json['state'],
      state_title: json['state_title'],
      status: json['status'],
      timeDiff: json['timeDiff'],
      toss: json['toss'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dn'] = this.dn;
    data['end_time'] = this.end_time;
    data['match_desc'] = this.match_desc;
    data['start_time'] = this.start_time;
    data['state'] = this.state;
    data['state_title'] = this.state_title;
    data['status'] = this.status;
    data['timeDiff'] = this.timeDiff;
    data['toss'] = this.toss;
    data['type'] = this.type;
    return data;
  }
}

class CommLine {
  String? comm;
  String? timestamp;

  CommLine({this.comm, this.timestamp});

  factory CommLine.fromJson(Map<String, dynamic> json) {
    return CommLine(
      comm: json['comm'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comm'] = this.comm;
    data['timestamp'] = this.timestamp;
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
