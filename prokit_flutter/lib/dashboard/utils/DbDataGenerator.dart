import 'dart:core';

import 'package:prokit_flutter/dashboard/model/db1/Db1Model.dart';
import 'package:prokit_flutter/dashboard/model/db2/Db2Model.dart';
import 'package:prokit_flutter/dashboard/model/db3/Db3Model.dart';
import 'package:prokit_flutter/dashboard/model/db4/Db4Model.dart';
import 'package:prokit_flutter/dashboard/model/db5/Db5Model.dart';
import 'package:prokit_flutter/dashboard/model/db6/Db6Model.dart';
import 'package:prokit_flutter/dashboard/model/db7/Db7Model.dart';
import 'package:prokit_flutter/dashboard/model/db8/Db8Model.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';

import 'DbColors.dart';

List<Db1CategoryModel> getFilterFavourites() {
  List<Db1CategoryModel> categoryModelArrayList = [];

  Db1CategoryModel item1 = Db1CategoryModel();
  item1.img = db1_ic_burger;
  item1.name = "Burger";
  item1.color = db1_dark_blue;

  Db1CategoryModel item2 = Db1CategoryModel();
  item2.img = db1_ic_pizza;
  item2.name = "Pizza";
  item2.color = db1_purple;

  Db1CategoryModel item3 = Db1CategoryModel();
  item3.img = db1_ic_coffee;
  item3.name = "Coffee";
  item3.color = db1_green;

  Db1CategoryModel item4 = Db1CategoryModel();
  item4.img = db1_ic_chicken;
  item4.name = "Chicken";
  item4.color = db1_orange;

  Db1CategoryModel item5 = Db1CategoryModel();
  item5.img = db1_ic_cake;
  item5.name = "Cake";
  item5.color = db1_dark_blue;

  Db1CategoryModel item6 = Db1CategoryModel();
  item6.img = db1_ic_cake;
  item6.name = "Cake";
  item6.color = db1_purple;

  categoryModelArrayList.add(item1);
  categoryModelArrayList.add(item2);
  categoryModelArrayList.add(item3);
  categoryModelArrayList.add(item4);
  categoryModelArrayList.add(item5);
  categoryModelArrayList.add(item6);
  return categoryModelArrayList;
}

List<Db1CategoryModel> getCategories() {
  List<Db1CategoryModel> categoryModelArrayList = [];
  Db1CategoryModel item1 = Db1CategoryModel();
  item1.img = db_restau_1;
  item1.name = "Morimoto";

  Db1CategoryModel item2 = Db1CategoryModel();
  item2.img = db_restau_2;
  item2.name = "Tashan";

  Db1CategoryModel item4 = Db1CategoryModel();
  item4.img = db_restau_3;
  item4.name = "Beetroot";

  Db1CategoryModel item5 = Db1CategoryModel();
  item5.img = db_restau_4;
  item5.name = "Tomato’s";

  Db1CategoryModel item6 = Db1CategoryModel();
  item6.img = db1_ic_paneer;
  item6.name = "Fast food";

  Db1CategoryModel item3 = Db1CategoryModel();
  item3.img = db1_ic_paneer;
  item3.name = "Nutmeg";
  categoryModelArrayList.add(item1);
  categoryModelArrayList.add(item2);
  categoryModelArrayList.add(item4);
  categoryModelArrayList.add(item5);
  categoryModelArrayList.add(item6);
  categoryModelArrayList.add(item3);
  return categoryModelArrayList;
}

List<DB1FoodModel> getFoodItems() {
  List<DB1FoodModel> foodModelArrayList = [];
  DB1FoodModel item1 = DB1FoodModel();
  item1.img = db1_ic_waffles;
  item1.name = "Paneer Tikka Dry";
  item1.info = "Indian Food";
  item1.duration = "20 min";

  DB1FoodModel item2 = DB1FoodModel();
  item2.img = db1_ic_biryani;
  item2.name = "Biryani";
  item2.info = "Indian, Fast food";
  item2.duration = "10 min";

  DB1FoodModel item3 = DB1FoodModel();
  item3.img = db1_ic_waffles;
  item3.name = "Burger";
  item3.info = "Indian, Fast food";
  item3.duration = "20 min";

  DB1FoodModel item4 = DB1FoodModel();
  item4.img = db1_ic_biryani;
  item4.name = "Waffles";
  item4.info = "Indian, Fast food";
  item4.duration = "20 min";

  foodModelArrayList.add(item1);
  foodModelArrayList.add(item2);
  foodModelArrayList.add(item3);
  foodModelArrayList.add(item4);
  return foodModelArrayList;
}

List<DB1FoodModel> getPopular() {
  List<DB1FoodModel> foodModelArrayList = [];
  DB1FoodModel item1 = DB1FoodModel();
  item1.img = db1_ic_waffles;
  item1.name = "Hungry Birds";
  item1.info = "North Indian, Chinese, Birayani";
  item1.duration = "20 min";

  DB1FoodModel item2 = DB1FoodModel();
  item2.img = db1_ic_paneer;
  item2.name = "US Pizza";
  item2.info = "Pizza, Garlic Bread";
  item2.duration = "10 min";

  DB1FoodModel item3 = DB1FoodModel();
  item3.img = db1_ic_biryani;
  item3.name = "Bhuvneshwari Khichadi Center";
  item3.info = "Gujarati, North Indian";
  item3.duration = "20 min";

  DB1FoodModel item4 = DB1FoodModel();
  item4.img = db1_ic_waffles;
  item4.name = "Waffles";
  item4.info = "Indian, Fast food";
  item4.duration = "20 min";

  foodModelArrayList.add(item1);
  foodModelArrayList.add(item2);
  foodModelArrayList.add(item3);
  foodModelArrayList.add(item4);
  return foodModelArrayList;
}

List<Db2ShopModel> db2getCategory() {
  List<Db2ShopModel> popularArrayList = [];
  Db2ShopModel item1 = Db2ShopModel();
  item1.img = db2_mens;
  item1.name = "Mens";

  Db2ShopModel item2 = Db2ShopModel();
  item2.img = db2_women;
  item2.name = "Womens";

  Db2ShopModel item3 = Db2ShopModel();
  item3.img = db2_kids;
  item3.name = "Kids";

  Db2ShopModel item4 = Db2ShopModel();
  item4.img = db2_decor;
  item4.name = "Decor-items";

  Db2ShopModel item5 = Db2ShopModel();
  item5.img = db2_decor1;
  item5.name = "others";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  return popularArrayList;
}

List<Db2ShopModel> db2getProduct() {
  List<Db2ShopModel> popularArrayList = [];
  Db2ShopModel item1 = Db2ShopModel();
  item1.img = db2_item2;
  item1.name = "Sunglasses";

  Db2ShopModel item2 = Db2ShopModel();
  item2.img = db2_item4;
  item2.name = "Sweater";

  Db2ShopModel item3 = Db2ShopModel();
  item3.img = db2_mens;
  item3.name = "Shirt";

  Db2ShopModel item4 = Db2ShopModel();
  item4.img = db2_decor;
  item4.name = "Box";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  return popularArrayList;
}

List<Db2ShopModel> db2getFeatured() {
  List<Db2ShopModel> popularArrayList = [];
  Db2ShopModel item1 = Db2ShopModel();
  item1.img = db2_women;
  item1.name = "Black Jacket";

  Db2ShopModel item2 = Db2ShopModel();
  item2.img = db2_item1;
  item2.name = "Denim Jacket";

  Db2ShopModel item3 = Db2ShopModel();
  item3.img = db2_item3;
  item3.name = "Blazer";

  Db2ShopModel item4 = Db2ShopModel();
  item4.img = db2_item5;
  item4.name = "T-shirt";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  return popularArrayList;
}

List<Db3FurnitureModel> db3FurnitureItems() {
  List<Db3FurnitureModel> furnitureModelArrayList = [];
  Db3FurnitureModel item1 = Db3FurnitureModel();
  item1.img = ic_chair3;
  item1.name = "Chair";
  item1.price = "\$29.0";

  Db3FurnitureModel item2 = Db3FurnitureModel();
  item2.img = ic_chair2;
  item2.name = "Nancy Chair";
  item2.price = "\$35.0";

  Db3FurnitureModel item3 = Db3FurnitureModel();
  item3.img = ic_chair3;
  item3.name = "Chair";
  item3.price = "\$20.0";

  Db3FurnitureModel item4 = Db3FurnitureModel();
  item4.img = ic_chair2;
  item4.name = "Chair";
  item4.price = "\$29.0";

  furnitureModelArrayList.add(item1);
  furnitureModelArrayList.add(item2);
  furnitureModelArrayList.add(item3);
  furnitureModelArrayList.add(item4);

  return furnitureModelArrayList;
}

List<Db3FurnitureModel> db3SellerItems() {
  List<Db3FurnitureModel> furnitureModelArrayList = [];
  Db3FurnitureModel item1 = Db3FurnitureModel();
  item1.img = ic_chair3;
  item1.name = "Houndstooth Side Zipper";
  item1.price = "\$29.0";

  Db3FurnitureModel item2 = Db3FurnitureModel();
  item2.img = ic_chair2;
  item2.name = "Table Wood Pine";
  item2.price = "\$35.0";

  Db3FurnitureModel item3 = Db3FurnitureModel();
  item3.img = ic_chair3;
  item3.name = "Houndstooth Side Zipper";
  item3.price = "\$20.0";

  Db3FurnitureModel item4 = Db3FurnitureModel();
  item4.img = ic_chair2;
  item4.name = "Table Wood Pine";
  item4.price = "\$29.0";

  furnitureModelArrayList.add(item1);
  furnitureModelArrayList.add(item2);
  furnitureModelArrayList.add(item3);
  furnitureModelArrayList.add(item4);

  return furnitureModelArrayList;
}

List<Db4Category> db5GetCategoryItems() {
  List<Db4Category> list = [];

  var category1 = Db4Category();
  category1.name = "Transfer";
  category1.color = db4_cat_1;
  category1.icon = db4_paperplane;
  list.add(category1);
  var category2 = Db4Category();
  category2.name = "Wallet";
  category2.color = db4_cat_2;
  category2.icon = db4_wallet;
  list.add(category2);
  var category3 = Db4Category();
  category3.name = "Voucher";
  category3.color = db4_cat_3;
  category3.icon = db4_coupon;
  list.add(category3);
  var category4 = Db4Category();
  category4.name = "Pay Bill";
  category4.color = db4_cat_4;
  category4.icon = db4_invoice;
  list.add(category4);

  var category5 = Db4Category();
  category5.name = "Exchange";
  category5.color = db4_cat_5;
  category5.icon = db4_dollar_exchange;
  list.add(category5);

  var category = Db4Category();
  category.name = "More";
  category.color = db4_cat_6;
  category.icon = db4_circle;
  list.add(category);
  return list;
}

List<Db4Slider> db4GetSliders() {
  List<Db4Slider> list = [];
  Db4Slider model1 = Db4Slider();
  model1.balance = "\$150000";
  model1.accountNo = "145 250 230 120 150";
  model1.image = db4_bg_card_2;
  Db4Slider model2 = Db4Slider();
  model2.balance = "\$150000";
  model2.accountNo = "145 250 230 120 150";
  model2.image = db4_bg_card_1;
  Db4Slider model3 = Db4Slider();
  model3.balance = "\$150000";
  model3.accountNo = "145 250 230 120 150";
  model3.image = db4_bg_card_3;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  return list;
}

List<Db5CategoryData> generateCategories() {
  List<Db5CategoryData> categories = [];

  Db5CategoryData model = Db5CategoryData();
  model.name = "Hotels";
  model.image = d5_ic_bed;

  Db5CategoryData model1 = Db5CategoryData();
  model1.name = "Flights";
  model1.image = d5_ic_flight;

  Db5CategoryData model2 = Db5CategoryData();
  model2.name = "Foods";
  model2.image = d5_ic_food;

  Db5CategoryData model3 = Db5CategoryData();
  model3.name = "Events";
  model3.image = d5_ic_event;

  categories.add(model);
  categories.add(model1);
  categories.add(model2);
  categories.add(model3);
  return categories;
}

List<Db6BestDestinationData> generateBestDestination() {
  List<Db6BestDestinationData> bestDestinationData = [];

  Db6BestDestinationData model = Db6BestDestinationData();
  model.name = "Malawi";
  model.rating = "4";
  model.image = db5_item1;

  Db6BestDestinationData model2 = Db6BestDestinationData();
  model2.name = "Japan";
  model2.rating = "2";
  model2.image = db5_item2;

  Db6BestDestinationData model3 = Db6BestDestinationData();
  model3.name = "London";
  model3.rating = "1";
  model3.image = db5_item3;

  Db6BestDestinationData model4 = Db6BestDestinationData();
  model4.name = "San Fransisco";
  model4.rating = "5";
  model4.image = db5_item4;

  bestDestinationData.add(model);
  bestDestinationData.add(model2);
  bestDestinationData.add(model3);
  bestDestinationData.add(model4);
  bestDestinationData.add(model);
  bestDestinationData.add(model);
  return bestDestinationData;
}

List<DB6Service> getTopLaundryService() {
  List<DB6Service> categories = [];

  DB6Service model = DB6Service();
  model.name = "Wash & Fold";
  model.img = db6_towels;

  DB6Service model1 = DB6Service();
  model1.name = "Wash & Iron";
  model1.img = db6_shirt;

  DB6Service model2 = DB6Service();
  model2.name = "Dry Clean";
  model2.img = db6_suit;

  DB6Service model3 = DB6Service();
  model3.name = "Premium Wash";
  model3.img = db6_washing_machine;

  categories.add(model);
  categories.add(model1);
  categories.add(model2);
  categories.add(model3);
  return categories;
}

List<DB6Laundry> getLaundry() {
  List<DB6Laundry> categories = [];

  DB6Laundry model = DB6Laundry();
  model.name = "My Laundry";
  model.img = db6_water_supply;
  model.rating = "5";
  model.location = "1810,Camino Real ,Newyork";

  DB6Laundry model1 = DB6Laundry();
  model1.name = "Dhobi Laundry";
  model1.img = db6_van;
  model1.rating = "2";
  model1.location = "1810,Camino Real ,Newyork";

  DB6Laundry model2 = DB6Laundry();
  model2.name = "Quick Laundry";
  model2.img = db6_water_supply;
  model2.rating = "4.5";
  model2.location = "1810,Camino Real ,Newyork";

  DB6Laundry model3 = DB6Laundry();
  model3.name = "Your Laundry";
  model3.img = db6_water_supply;
  model3.rating = "5.0";
  model3.location = "1810,Camino Real ,Newyork";
  categories.add(model);
  categories.add(model1);
  categories.add(model2);
  categories.add(model3);
  return categories;
}

List<DB6Offer> getOffer() {
  List<DB6Offer> categories = [];
  DB6Offer model = DB6Offer();
  model.img = db6_washing_clothes;
  model.subTitle = "Get 50% off";
  model.title = "For a limited time";

  DB6Offer model1 = DB6Offer();
  model1.img = db6_wash_service;
  model1.subTitle = "Get 50% off";
  model1.title = "For a limited time";

  DB6Offer model2 = DB6Offer();
  model2.img = db6_shirt;
  model2.subTitle = "Get 50% off";
  model2.title = "For a limited time";

  DB6Offer model3 = DB6Offer();
  model3.img = db6_shirt;
  model3.subTitle = "Get 50% off";
  model3.title = "For a limited time";
  categories.add(model);
  categories.add(model1);
  categories.add(model2);
  categories.add(model3);
  return categories;
}

List<DB7Topic> getDB7TodayData() {
  List<DB7Topic> data = [];
  data.add(DB7Topic("Participation in Extracurricular Activities", db7_item4, "Civil Hospital", 200, 20));
  data.add(DB7Topic("Depression", db7_item5, "Orange Hospital", 200, 20));
  data.add(DB7Topic("illnesses", db7_item3, "Fudan University Hospital", 200, 20));
  data.add(DB7Topic("Participation in Extracurricular Activities", db7_item2, "Parsi Hospital", 200, 20));
  return data;
}

List<DB8Scene> getScene() {
  List<DB8Scene> categories = [];
  categories.add(DB8Scene(db8_ic_home, "Home"));
  categories.add(DB8Scene(db8_ic_door, "Away"));
  categories.add(DB8Scene(db8_ic_sleep, "Sleep"));
  categories.add(DB8Scene(db8_ic_alarm, "Get up"));

  return categories;
}

List<DB8Rooms> getRooms() {
  List<DB8Rooms> categories = [];
  categories.add(DB8Rooms("Living Room", db8_ic_item6, "6 device"));
  categories.add(DB8Rooms("Bed Rooms", db8_ic_item5, "1 device"));
  categories.add(DB8Rooms("Rest Room", db8_ic_item7, "3 device"));

  return categories;
}
