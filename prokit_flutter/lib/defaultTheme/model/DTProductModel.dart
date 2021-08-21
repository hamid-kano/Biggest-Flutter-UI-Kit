class DTProductModel {
  String? image;
  String? name;
  double? rating;
  bool? isLiked;
  int? price;
  int? discountPrice;
  int? qty;

  DTProductModel({this.image, this.name, this.rating, this.isLiked, this.price, this.discountPrice, this.qty});

  factory DTProductModel.fromJson(Map<String, dynamic> json) {
    return DTProductModel(
      image: json['image'],
      name: json['name'],
      rating: json['rating'],
      isLiked: json['isLiked'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      qty: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['isLiked'] = this.isLiked;
    data['price'] = this.price;
    data['discountPrice'] = this.discountPrice;
    data['qty'] = this.qty;
    return data;
  }
}
