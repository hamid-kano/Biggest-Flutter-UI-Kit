class FBUserModel {
  String? name;
  String? email;
  int? age;
  String? id;

  FBUserModel({this.id, this.email, this.name, this.age, });

  factory FBUserModel.fromJson(Map<String, dynamic> json) {
    return FBUserModel(
      name: json['name'],
      email: json['email'],
      age: json['age'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}
