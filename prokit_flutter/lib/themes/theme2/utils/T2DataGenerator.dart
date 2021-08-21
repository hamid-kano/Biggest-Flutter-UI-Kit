import 'package:prokit_flutter/themes/theme2/models/models.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

import 'T2Images.dart';

List<T2Favourite> getFavourites() {
  List<T2Favourite> list = [];
  T2Favourite model1 = T2Favourite();
  model1.name = "Best Jogging tips in the world";
  model1.duration = "5 min ago";
  model1.image = t2_ic_img1;

  T2Favourite model2 = T2Favourite();
  model2.name = "Best Yoga guide for better Health in the world";
  model2.duration = "15 min ago";
  model2.image = t2_ic_img2;

  T2Favourite model3 = T2Favourite();
  model3.name = "Best Exercise tips in the world";
  model3.duration = "an hour ago";
  model3.image = t2_img3;

  T2Favourite model4 = T2Favourite();
  model4.name = "Best Diet tips for the good Health";
  model4.duration = "5 hour ago";
  model4.image = t2_img4;

  T2Favourite model5 = T2Favourite();
  model5.name = "Healty food tips in the world";
  model5.duration = "7 hour ago";
  model5.image = t2_ic_img1;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  return list;
}

List<T2Slider> getSliders() {
  List<T2Slider> list = [];
  T2Slider model1 = T2Slider();
  model1.title = t2_usable_flower_for_health;
  model1.subTitle = t2_sample_text;
  model1.image = t2Slider1;
  T2Slider model2 = T2Slider();
  model2.title = t2_usable_flower_for_health;
  model2.subTitle = t2_sample_text;
  model2.image = t2Slider2;
  T2Slider model3 = T2Slider();
  model3.title = t2_usable_flower_for_health;
  model3.subTitle = t2_sample_text;
  model3.image = t2Slider3;

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<T2ListModel> getListData() {
  List<T2ListModel> mData = [];

  T2ListModel model1 = T2ListModel();
  model1.name = "Flower Tips";
  model1.duration = "12 min ago";
  model1.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text.";
  model1.type = "New";
  model1.icon = t2_list_1;

  T2ListModel model2 = T2ListModel();
  model2.name = "Health Tips";
  model2.duration = "12 min ago";
  model2.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text.";
  model2.type = "Popular";
  model2.icon = t2_list_2;

  T2ListModel model3 = T2ListModel();
  model3.name = "Food Tips";
  model3.duration = "12 min ago";
  model3.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text.";
  model3.type = "New";
  model3.icon = t2_list_3;

  T2ListModel model4 = T2ListModel();
  model4.name = "Health Tips";
  model4.duration = "12 min ago";
  model4.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text.";
  model4.type = "New";
  model4.icon = t2_list_1;

  mData.add(model1);
  mData.add(model2);
  mData.add(model3);
  mData.add(model4);
  mData.add(model1);
  mData.add(model2);
  mData.add(model3);
  mData.add(model4);
  mData.add(model1);
  mData.add(model2);
  mData.add(model3);
  mData.add(model4);
  mData.add(model1);
  mData.add(model2);
  mData.add(model3);
  mData.add(model4);
  mData.add(model1);
  mData.add(model2);
  mData.add(model3);
  mData.add(model4);
  mData.add(model1);
  mData.add(model2);
  mData.add(model3);
  mData.add(model4);
  return mData;
}
/*
List<T2DrawerItem> getDrawerItems() {
  List<T2DrawerItem> list = List<T2DrawerItem>();
  T2DrawerItem model1 = T2DrawerItem();
  model1.title = t2_lbl_profile;
  model1.image = Icons.person_outline;
  T2DrawerItem model2 = T2DrawerItem();
  model2.title = t2_lbl_message;
  model2.image = Icons.chat_bubble_outline;
  T2DrawerItem model3 = T2DrawerItem();
  model3.title = t2_lbl_profile;
  model3.image = Icons.char;
  T2DrawerItem model4 = T2DrawerItem();
  model4.title = t2_lbl_profile;
  model4.image = Icons.person_outline;
  T2DrawerItem model5 = T2DrawerItem();
  model5.title = t2_lbl_profile;
  model5.image = Icons.person_outline;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  return list;
}
*/
