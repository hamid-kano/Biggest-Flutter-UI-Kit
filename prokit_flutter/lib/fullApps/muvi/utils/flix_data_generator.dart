import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';

List<HomeSlider> getSliders() {
  List<HomeSlider> list = [];
  list.add(HomeSlider(slideImage: "images/muvi/items/element___image___square_copy_ek1.jpg", isHD: true));
  list.add(HomeSlider(slideImage: "images/muvi/items/element___image___square_copy_ek3.jpg", isHD: false));
  return list;
}

List<Movie> getMovie() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/poster_ek27.jpg", isHD: true));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek29.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek31.jpg", isHD: true));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek33.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek35.jpg", isHD: true));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek27.jpg", isHD: false));

  return list;
}

List<Movie> getTrendingOnMovie() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/poster_ek27.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek29.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek31.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek33.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek35.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/poster_ek27.jpg", isHD: false));

  return list;
}

List<Movie> getMadeForYouMovie() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/poster_ek27.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/Images6.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/Images9.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/Images10.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/Images14.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/Images10.jpg", isHD: false));

  return list;
}

List<Movie> getHorizontalMovie() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/rectangle_ek9.jpg", isHD: true));
  list.add(Movie(slideImage: "images/muvi/items/rectangle_ek11.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/rectangle_ek13.jpg", isHD: true));
  list.add(Movie(slideImage: "images/muvi/items/rectangle_ek24.jpg", isHD: false));
  list.add(Movie(slideImage: "images/muvi/items/rectangle_ek26.jpg", isHD: false));

  return list;
}

List<Movie> getContinueMovies() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek1.jpg", isHD: true, percent: 0.2, title: "Joker"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek7.jpg", isHD: false, percent: 0.8, title: "The Scorch Trials"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek1.jpg", isHD: true, percent: 0.4, title: "Fantastic Four"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek11.jpg", isHD: false, percent: 0.5, title: "Itaewon Class"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek17.jpg", isHD: false, percent: 0.1, title: "The Cars"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek21.jpg", isHD: false, percent: 0.9, title: "Coco"));

  return list;
}

List<Movie> getMyListMovies() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek11.jpg", isHD: false, percent: 0.5, title: "Itaewon Class"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek17.jpg", isHD: true, percent: 0.4, title: "Conjuring 3"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek21.jpg", isHD: false, percent: 0.9, title: "Coco"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek11.jpg", isHD: false, percent: 0.1, title: "The Cars"));

  return list;
}

List<Movie> getDownloadedMovies() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek23.jpg", isHD: false, percent: 0.5, title: "Frozen 2"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek25.jpg", isHD: true, percent: 0.4, title: "Ip Man 4"));
  list.add(Movie(slideImage: "images/muvi/items/thumbnail_ek27.jpg", isHD: false, percent: 0.9, title: "Man of Steel"));

  return list;
}

List<FAQ> getFaq() {
  List<FAQ> list = [];
  list.add(FAQ(
      title: "How to delete conitnue watching",
      subTitle:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
      isExpanded: false));
  list.add(FAQ(
      title: "How to delete conitnue watching",
      subTitle:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
      isExpanded: false));
  list.add(FAQ(
      title: "How to delete conitnue watching",
      subTitle:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
      isExpanded: false));
  list.add(FAQ(
      title: "How to delete conitnue watching",
      subTitle:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
      isExpanded: false));
  list.add(FAQ(
      title: "How to delete conitnue watching",
      subTitle:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
      isExpanded: false));

  return list;
}

List<Movie> getActors() {
  List<Movie> list = [];
  list.add(Movie(slideImage: "$BaseUrl/images/muvi/items/t3_ic_profile1.png", isHD: true, percent: 0.2, title: "Rajiv Kapoor"));
  list.add(Movie(slideImage: "$BaseUrl/images/muvi/items/t3_ic_profile2.png", isHD: false, percent: 0.8, title: "John doe"));
  list.add(Movie(slideImage: "$BaseUrl/images/muvi/items/t3_ic_profile3.png", isHD: true, percent: 0.4, title: "Alice Denial"));
  list.add(Movie(slideImage: "$BaseUrl/images/muvi/items/t3_ic_profile5.png", isHD: false, percent: 0.5, title: "John Vinaas"));
  list.add(Movie(slideImage: "$BaseUrl/images/muvi/items/t3_ic_profile6.png", isHD: false, percent: 0.1, title: "Alexender Cinah"));
  list.add(Movie(slideImage: "$BaseUrl/images/muvi/items/t3_ic_profile7.png", isHD: false, percent: 0.9, title: "Tim Svages"));

  return list;
}
