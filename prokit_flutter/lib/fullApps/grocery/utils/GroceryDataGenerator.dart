import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';

import 'GeoceryStrings.dart';
import 'GroceryColors.dart';
import 'GroceryImages.dart';

List<ProductModel> storeMemberItems() {
  List<ProductModel> mProductList = [];
  ProductModel item1 = ProductModel();
  item1.img = grocery_ic_ginger;
  item1.name = "Ginger";
  item1.price = "\$60.00";
  item1.weight = "100G";

  ProductModel item2 = ProductModel();
  item2.img = grocery_ic_graps;
  item2.name = "Grapes";
  item2.price = "\$40.0";
  item2.weight = "100G";

  ProductModel item3 = ProductModel();
  item3.img = grocery_ic_bell_paper;
  item3.name = "Red Onion";
  item3.price = "\$200.0";
  item3.weight = "1KG";

  ProductModel item4 = ProductModel();
  item4.img = grocery_ic_apple;
  item4.name = "Apples";
  item4.price = "\$300.0";
  item4.weight = "1KG";

  ProductModel item5 = ProductModel();
  item5.img = grocery_ic_carrot;
  item5.name = "Carrots";
  item5.price = "\$200.0";
  item5.weight = "1KG";

  mProductList.add(item5);
  mProductList.add(item4);
  mProductList.add(item1);
  mProductList.add(item3);
  mProductList.add(item2);

  return mProductList;
}

List<CategoryModel> storeCategoryItem() {
  List<CategoryModel> mList = [];
  mList.add(CategoryModel("HouseHold", Grocery_ic_Home));
  mList.add(CategoryModel("Grocery", grocery_ic_grocery));
  mList.add(CategoryModel("Liquor", grocery_ic_liquor));
  mList.add(CategoryModel("Chilled", grocery_ic_chilled));
  mList.add(CategoryModel("Beverages", grocery_ic_liquor));
  mList.add(CategoryModel("Pharmacy", grocery_ic_pharmacy));
  mList.add(CategoryModel("Frozen Food", grocery_ic_frozen));
  mList.add(CategoryModel("Vegetables", grocery_ic_vegetables));
  mList.add(CategoryModel("Meat", grocery_ic_meat));
  mList.add(CategoryModel("Fish", grocery_ic_fish));
  mList.add(CategoryModel("Homeware", grocery_ic_homeware));
  mList.add(CategoryModel("Fruits", grocery_ic_fruit));
  return mList;
}

List<NotificationModel> notificationItem() {
  List<NotificationModel> mList = [];
  mList.add(NotificationModel("HouseHold", "now", "Lorem Ipsum is simply dummy text of the printing and typesetting industry."));
  mList.add(NotificationModel("Grocery", "4 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry."));
  mList.add(NotificationModel("Chilled", "30 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry."));
  return mList;
}

List<CategoryOptionModel> categoryOptionItem() {
  List<CategoryOptionModel> mList = [];
  mList.add(CategoryOptionModel("Chocalte Drink"));
  mList.add(CategoryOptionModel("Coffee"));
  mList.add(CategoryOptionModel("Concentrated Fruit Drinks"));
  mList.add(CategoryOptionModel("Juices & Carbonates"));
  mList.add(CategoryOptionModel("Malt Drink"));
  mList.add(CategoryOptionModel("Milks & Creamers"));
  mList.add(CategoryOptionModel("RTD & Beverages"));
  mList.add(CategoryOptionModel("Sport & Energy Drinks"));
  mList.add(CategoryOptionModel("Tea"));
  mList.add(CategoryOptionModel("Waters"));
  return mList;
}

List<ReviewModel> reviewsItem() {
  List<ReviewModel> mList = [];
  mList.add(ReviewModel("Ella White", "Today", "Greate quality & Fresh", grocery_ic_user1));
  mList.add(ReviewModel("Lily Williams", "Yesterday", "Good Quality", grocery_ic_user2));
  mList.add(ReviewModel("John", "2 day ago", "Fresh", grocery_ic_user3));
  return mList;
}

List<CartModel> saveCartItem() {
  List<CartModel> mList = [];
  mList.add(CartModel("Vegetables", "1,820.00", "04"));
  mList.add(CartModel("Groceries", "5,300.00", "04"));
  return mList;
}

List<GroceryProfileModel> groceryProfileList() {
  List<GroceryProfileModel> list = [];

  var list1 = GroceryProfileModel();
  list1.title = grocery_lbl_Recipient_Details;
  list1.icon = Grocery_ic_User;
  list1.color = grocery_purpleLightColor;
  list.add(list1);

  var list2 = GroceryProfileModel();
  list2.title = grocery_lbl_Delivery_Address;
  list2.icon = Grocery_ic_DeliveryTruck;
  list2.color = grocery_orangeLight_Color;
  list.add(list2);

  var list3 = GroceryProfileModel();
  list3.title = grocery_lbl_Payment_Methods;
  list3.icon = Grocery_ic_Dollar;
  list3.color = grocery_orangeColor;
  list.add(list3);

  var list4 = GroceryProfileModel();
  list4.title = grocery_lbl_Change_Password;
  list4.icon = Grocery_ic_Lock;
  list4.color = grocery_RedLight_Color;
  list.add(list4);

  var list5 = GroceryProfileModel();
  list5.title = grocery_lbl_Logout;
  list5.icon = Grocery_ic_Logout;
  list5.color = grocery_Red_Color;
  list.add(list5);

  return list;
}

List<GroceryPaymentModel> groceryPaymentMethodList() {
  List<GroceryPaymentModel> list = [];

  var list1 = GroceryPaymentModel(grocery_ic_visa, grocery_blue, "Ishan Maduskha", "**** **** **** 4567", true);
  list.add(list1);

  var list2 = GroceryPaymentModel(grocery_ic_masterCard, grocery_orangeLight_Color, "Ishan Maduskha", "**** **** **** 2345", false);
  list.add(list2);

  return list;
}
