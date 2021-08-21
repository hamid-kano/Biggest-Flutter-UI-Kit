class ShReview {
  // ignore: non_constant_identifier_names
  String? date_created;
  // ignore: non_constant_identifier_names
  String? date_created_gmt;
  String? email;
  int? id;
  String? name;
  // ignore: non_constant_identifier_names
  int? product_id;
  int? rating;
  String? review;
  bool? verified;

  // ignore: non_constant_identifier_names
  ShReview({this.date_created, this.date_created_gmt, this.email, this.id, this.name, this.product_id, this.rating, this.review, this.verified});

  factory ShReview.fromJson(Map<String, dynamic> json) {
    return ShReview(
      date_created: json['date_created'],
      date_created_gmt: json['date_created_gmt'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
      product_id: json['product_id'],
      rating: json['rating'],
      review: json['review'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_created'] = this.date_created;
    data['date_created_gmt'] = this.date_created_gmt;
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.product_id;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['verified'] = this.verified;
    return data;
  }
}
