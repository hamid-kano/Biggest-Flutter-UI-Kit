class HomeSlider {
  String? slideImage;
  Object? title;
  bool? isHD = false;

  HomeSlider({this.slideImage, this.title, this.isHD});
}

class Movie {
  String? slideImage;
  String? title;
  String? subTitle;
  bool? isHD = false;
  double? percent;

  Movie({this.slideImage, this.title, this.isHD, this.percent});
}

class FAQ {
  String? title;
  String? subTitle;
  bool? isExpanded = false;

  FAQ({this.title, this.subTitle, this.isExpanded});
}
