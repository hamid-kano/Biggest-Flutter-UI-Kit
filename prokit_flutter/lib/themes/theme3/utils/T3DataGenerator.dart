import 'dart:core';

import 'package:prokit_flutter/themes/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3Images.dart';

List<T3DashboardSliderModel> getDashboardSlider() {
  List<T3DashboardSliderModel> list = [];
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));

  return list;
}

List<Theme3Dish> getDashboardList() {
  List<Theme3Dish> list = [];
  Theme3Dish model1 = Theme3Dish();
  model1.dishName = "Cheese roll Recipe by";
  model1.name = "Rajiv Kapoor";
  model1.dishImage = t3_dish3;

  Theme3Dish model2 = Theme3Dish();
  model2.dishName = "Masala Dhosa Recipe by";
  model2.name = "John doe";
  model2.dishImage = t3_ic_dish2;

  Theme3Dish model3 = Theme3Dish();
  model3.dishName = "Butter Dhosa Recipe by";
  model3.name = "Alice Denial";
  model3.dishImage = t3_ic_dish2;
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  return list;
}

List<Theme3Dish> getList() {
  List<Theme3Dish> list = [];
  Theme3Dish model1 = Theme3Dish();
  model1.dishName = "Cheese roll Recipe by Jon Doe";
  model1.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  model1.dishImage = t3_dish3;

  Theme3Dish model2 = Theme3Dish();
  model2.dishName = "Masala Dhosa Recipe by Jon Doe";
  model2.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  model2.dishImage = t3_ic_dish2;

  Theme3Dish model3 = Theme3Dish();
  model3.dishName = "Masala Dhosa Recipe by Jon Doe";
  model3.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  model3.dishImage = t3_ic_dish2;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<Theme3Dish> getSearchData() {
  List<Theme3Dish> list = [];
  Theme3Dish model1 = Theme3Dish();
  model1.dishName = "Cheese roll";
  model1.description = "Total 21 Hours";
  model1.dishImage = t3_dish3;

  Theme3Dish model2 = Theme3Dish();
  model2.dishName = "Masala Dhosa";
  model2.description = "Total 21 Hours";
  model2.dishImage = t3_ic_dish2;

  Theme3Dish model3 = Theme3Dish();
  model3.dishName = "Pizza";
  model3.description = "Total 21 Hours";
  model3.dishImage = t3_ic_dish1;

  Theme3Dish model4 = Theme3Dish();
  model4.dishName = "Pizza";
  model4.description = "Total 21 Hours";
  model4.dishImage = t3_ic_dish1;

  Theme3Dish model5 = Theme3Dish();
  model5.dishName = "Pizza";
  model5.description = "Total 21 Hours";
  model5.dishImage = t3_ic_dish1;

  Theme3Dish model6 = Theme3Dish();
  model6.dishName = "Pizza";
  model6.description = "Total 21 Hours";
  model6.dishImage = t3_ic_dish1;

  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model6);
  list.add(model1);

  return list;
}

List<Theme3Follower> getFollowers() {
  List<Theme3Follower> list = [];

  Theme3Follower model1 = Theme3Follower();
  model1.location = "California";
  model1.name = "John Vinaa";
  model1.userImg = t3_ic_profile1;

  Theme3Follower model2 = Theme3Follower();
  model2.location = "California";
  model2.name = "John doe";
  model2.userImg = t3_ic_profile6;

  Theme3Follower model3 = Theme3Follower();
  model3.location = "California";
  model3.name = "Alexender Cinah";
  model3.userImg = t3_ic_profile2;

  Theme3Follower model4 = Theme3Follower();
  model4.location = "California";
  model4.name = "Tim Svages";
  model4.userImg = t3_ic_profile3;

  Theme3Follower model5 = Theme3Follower();
  model5.location = "California";
  model5.name = "Brust Var";
  model5.userImg = t3_ic_profile5;

  list.add(model2);
  list.add(model1);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}
