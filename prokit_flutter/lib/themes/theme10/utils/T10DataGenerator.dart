import 'package:prokit_flutter/themes/theme10/models/T10Models.dart';

import 'T10Images.dart';

List<T10Product> getProducts() {
  List<T10Product> list = [];
  list.add(T10Product("Nike Shoes", "\$250", "\$350", Theme10Pot, "By Boots Category"));
  list.add(T10Product("Headset", "\$50", "\$100", t10_headphones, "By Headset Category"));
  list.add(T10Product("Pot", "\$20", "\$30", t10_watch, "By Pots Category"));
  list.add(T10Product("Watch", "\$250", "\$350", t10_ic_shoes, "By Watch Category"));
  return list;
}

List<T10Product> getDashboardProducts() {
  List<T10Product> list = [];
  list.add(T10Product("Nike Shoes", "\$250", "\$350", t10_slider_3, "By Boots Category"));
  list.add(T10Product("Headset", "\$50", "\$100", t10_headphones, "By Headset Category"));
  list.add(T10Product("Pot", "\$20", "\$30", Theme10Pot, "By Pots Category"));
  list.add(T10Product("Watch", "\$250", "\$350", t10_watch, "By Watch Category"));
  list.add(T10Product("Headset", "\$50", "\$100", t10_slider_3, "By Headset Category"));
  list.add(T10Product("Pot", "\$20", "\$30", t10_headphones, "By Pots Category"));
  list.add(T10Product("Watch", "\$250", "\$350", Theme10Pot, "By Watch Category"));
  list.add(T10Product("Watch", "\$250", "\$350", t10_watch, "By Watch Category"));
  return list;
}

List<T10Images> getProfile() {
  List<T10Images> list = [];
  list.add(T10Images(t10_profile_1));
  list.add(T10Images(t10_profile_2));
  list.add(T10Images(t10_profile_3));
  list.add(T10Images(t10_profile_5));
  list.add(T10Images(t10_profile_6));
  return list;
}

List<T10Images> getDashboard() {
  List<T10Images> list = [];
  list.add(T10Images(t10_slider_1));
  list.add(T10Images(t10_slider_3));
  list.add(T10Images(t10_slider_2));
  list.add(T10Images(t10_slider_1));
  list.add(T10Images(t10_slider_2));
  return list;
}
