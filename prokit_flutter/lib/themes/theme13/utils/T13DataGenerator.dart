import 'package:prokit_flutter/themes/theme13/model/T13Model.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';

List<Home> generateFeatured() {
  List<Home> featured = [];
  featured.add(Home.info("London", t13_ic_city1));
  featured.add(Home.info("Santorini", t13_ic_city2));
  featured.add(Home.info("Toronto", t13_ic_city5));
  featured.add(Home.info("Bali", t13_ic_city4));

  return featured;
}

List<Home> generatePopular() {
  List<Home> popular = [];
  popular.add(Home("Green House", t13_ic_item1, "\$1500", "20 sqm", "Toronto"));
  popular.add(Home("Lake House", t13_ic_item2, "\$1500", "20 sqm", "Bali"));
  popular.add(Home("Modern House", t13_ic_item3, "\$1500", "20 sqm", "Santorini"));
  popular.add(Home("Tree House", t13_ic_item1, "\$1500", "20 sqm", "London"));

  return popular;
}

List<Currency> generateCurrency() {
  List<Currency> currency = [];
  currency.add(Currency("Afghanistan", t13_ic_afghanistan, "AFN"));
  currency.add(Currency("India", t13_ic_india, "Inr"));
  currency.add(Currency("United State", t13_ic_usa, "dollar"));
  currency.add(Currency("germany", t13_ic_germany, "Euro"));
  currency.add(Currency("indonesia", t13_ic_indonesia, "rupiah"));
  currency.add(Currency("turkey", t13_ic_turkey, "TRY"));
  currency.add(Currency("Portugal", t13_ic_portugal, "Euro"));
  return currency;
}

List<Photos> generatePhotos() {
  List<Photos> photos = [];
  photos.add(Photos(t13_ic_item1));
  photos.add(Photos(t13_ic_item2));
  photos.add(Photos(t13_ic_item3));
  photos.add(Photos(t13_ic_item4));
  return photos;
}

List<Filter> generateFilter() {
  List<Filter> filter = [];
  filter.add(Filter("Toronto", "(50 property)"));
  filter.add(Filter("Bali", "(50 property)"));
  filter.add(Filter("Santorini", "(50 property)"));
  filter.add(Filter("London", "(50 property)"));
  return filter;
}
