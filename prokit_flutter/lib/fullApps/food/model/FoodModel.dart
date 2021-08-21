class Restaurants {
  var name;
  var image;
  var rating;
  var review;

  Restaurants(this.name, this.rating, this.image, this.review);
}

class DashboardCollections {
  var name;
  var image;
  var info;

  DashboardCollections(this.name, this.image, this.info);
}

class ViewRestaurants {
  var name;
  List<images> image;
  var rating;
  var review;
  var rs;
  var sector;
  var kms;
  var offer;
  var info;

  ViewRestaurants(this.name,
      this.image,
      this.rating,
      this.review,
      this.rs,
      this.sector,
      this.kms,
      this.offer,
      this.info,);
}

// ignore: camel_case_types
class images {
  var image;

  images(this.image);
}

class FoodDish {
  var name;
  var type;
  var category;
  var image;
  var price;

  FoodDish(this.name, this.type, this.category, this.image, this.price);
}

class ReviewModel {
  var review;
  var rate;
  var image;
  var duration;

  ReviewModel(this.image, this.review, this.rate, this.duration);
}

class Coupons {
  var couponsName;
  var info;
  var offer;

  Coupons(this.couponsName, this.info, this.offer);
}

class Filter {
  var name;
  var isSelected;

  Filter(this.name);
}

class DataFilter {
  String? name;
  String? title;
  bool isCheck;

  DataFilter({this.name = '', this.title, this.isCheck = false});
}