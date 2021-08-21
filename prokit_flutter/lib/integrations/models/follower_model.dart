class FollowerModel {
  String? login;
  // ignore: non_constant_identifier_names
  String? avatar_url;

  // ignore: non_constant_identifier_names
  FollowerModel({this.login, this.avatar_url});

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
      login: json['login'],
      avatar_url: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatar_url;
    return data;
  }
}
