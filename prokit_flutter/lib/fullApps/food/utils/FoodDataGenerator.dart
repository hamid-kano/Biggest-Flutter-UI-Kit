import 'package:prokit_flutter/fullApps/food/model/FoodModel.dart';

import 'FoodImages.dart';

List<DashboardCollections> addCollectionData() {
  List<DashboardCollections> collectionData = [];
  collectionData.add(DashboardCollections("Gym Lover", food_ic_item4, "Starts from @E123"));
  collectionData.add(DashboardCollections("Live Music", food_ic_item11, "Starts from @E123"));
  collectionData.add(DashboardCollections("Friends", food_ic_item6, "Starts from @E123"));
  collectionData.add(DashboardCollections("Gym Lover", food_ic_item4, "Starts from @E123"));
  return collectionData;
}

List<Restaurants> addBakeryData() {
  List<Restaurants> bakeryData = [];
  bakeryData.add(Restaurants("Live Cake & Bakery Shop", 4, food_ic_popular2, "50 Reviews"));
  bakeryData.add(Restaurants("Richie Rich Cake Shop", 2, food_ic_item12, "50 Reviews"));
  bakeryData.add(Restaurants("American Dry Fruit Ice Cream", 5, food_ic_item1, "50 Reviews"));
  bakeryData.add(Restaurants("Cake & Bakery Shop", 4, food_ic_item13, "50 Reviews"));
  return bakeryData;
}

List<Restaurants> addDeliveryRestaurantsData() {
  List<Restaurants> deliveryRestaurantsData = [];
  deliveryRestaurantsData.add(Restaurants("American Chinese cuisine", 4, food_ic_popular4, "50 Reviews"));
  deliveryRestaurantsData.add(Restaurants("Bread", 2, food_ic_popular3, "50 Reviews"));
  deliveryRestaurantsData.add(Restaurants("Restro Bistro", 5, food_ic_item1, "50 Reviews"));
  deliveryRestaurantsData.add(Restaurants("Hugs with mugs", 4, food_ic_item6, "50 Reviews"));
  return deliveryRestaurantsData;
}

List<Restaurants> addDineOutRestaurantsData() {
  List<Restaurants> dineOutRestaurantsData = [];
  dineOutRestaurantsData.add(Restaurants("Raise The Bar \nRooftTop", 4, food_ic_item13, "50 Reviews"));
  dineOutRestaurantsData.add(Restaurants("Destination Restro & Cafe", 2, food_ic_item14, "50 Reviews"));
  dineOutRestaurantsData.add(Restaurants("Apple Dine", 5, food_ic_item15, "50 Reviews"));

  return dineOutRestaurantsData;
}

List<Restaurants> addCafeData() {
  List<Restaurants> cafeData = [];
  cafeData.add(Restaurants("Domesticated turkey", 4, food_ic_item2, "50 Reviews"));
  cafeData.add(Restaurants("Germen Chocolate Cake", 2, food_ic_item6, "50 Reviews"));
  cafeData.add(Restaurants("Tihar", 5, food_ic_item10, "50 Reviews"));
  cafeData.add(Restaurants("Cafe klatch", 5, food_ic_item1, "50 Reviews"));

  return cafeData;
}

List<DashboardCollections> addCuisineData() {
  List<DashboardCollections> cuisineData = [];
  cuisineData.add(DashboardCollections("Italian", food_ic_item6, "100+ Experience"));
  cuisineData.add(DashboardCollections("Goan", food_ic_item4, "50+ Experience"));
  cuisineData.add(DashboardCollections("Chines", food_ic_item11, "20+ Experience"));
  cuisineData.add(DashboardCollections("Indian", food_ic_item6, "100+ Experience"));

  return cuisineData;
}

List<ViewRestaurants> addViewRestaurantsData() {
  List<ViewRestaurants> viewData = [];
  viewData.add(ViewRestaurants("Domesticated turkey", addViewImagesData(), "4", "50 Reviews", "\$1200 for 2 people", "Sector 19", "7 kms", 1, "your first order & application above 199"));
  viewData.add(ViewRestaurants("Germen Chocolate Cake", addViewImagesData(), "4", "50 Reviews", "\$1200 for 2 people", "Sector 19", "7 kms", 1, "your first order & application above 199"));
  viewData.add(ViewRestaurants("Tihar", addViewImagesData(), "4", "50 Reviews", "\$1200 for 2 people", "Sector 19", "7 kms", 1, "your first order & application above 199"));

  return viewData;
}

//
List<images> addViewImagesData() {
  List<images> viewData = [];
  viewData.add(images(food_ic_item10));
  viewData.add(images(food_ic_item2));
  viewData.add(images(food_ic_item15));
  viewData.add(images(food_ic_item12));
  return viewData;
}

List<images> addAmbiencePhotosData() {
  List<images> viewData = [];
  viewData.add(images(food_ic_item2));
  viewData.add(images(food_ic_item4));
  viewData.add(images(food_ic_item10));
  viewData.add(images(food_ic_item12));
  return viewData;
}

//
List<images> addFoodPhotosData() {
  List<images> viewData = [];
  viewData.add(images(food_ic_item4));
  viewData.add(images(food_ic_item15));
  viewData.add(images(food_ic_item11));
  viewData.add(images(food_ic_item6));
  return viewData;
}

List<images> addUserPhotosData() {
  List<images> viewData = [];
  viewData.add(images(food_ic_user1));
  viewData.add(images(food_ic_user3));
  viewData.add(images(food_ic_user4));
  viewData.add(images(food_ic_user5));
  return viewData;
}

//
List<FoodDish> addFoodDishData() {
  List<FoodDish> dishData = [];
  dishData.add(FoodDish("American Chinese cuisine", "Italian", "Veg", food_ic_item6, "\$50"));
  dishData.add(FoodDish("NonVeg", "Goan", "NonVeg", food_ic_popular2, "\$50"));
  dishData.add(FoodDish("Biscuit", "Chines", "Veg", food_ic_popular3, "\$50"));
  dishData.add(FoodDish("Cold Coffee", "Indian", "Veg", food_ic_item10, "\$50"));

  return dishData;
}

List<FoodDish> orderData() {
  List<FoodDish> dishData = [];
  dishData.add(FoodDish("American Chinese cuisine", "25 Jan 2019, 10:00 PM", "Veg", food_ic_item6, "\$50"));
  dishData.add(FoodDish("Bread", "20 May 2019, 08:00 PM, 10:00 PM", "Veg", food_ic_item10, "\$50"));
  dishData.add(FoodDish("Biscuit", "25 Jan 2019, 10:00 PM", "Veg", food_ic_item1, "\$50"));

  return dishData;
}

List<ReviewModel> addReviewData() {
  List<ReviewModel> reviewData = [];
  reviewData.add(ReviewModel(food_ic_user1, "Very nice..", "3.0", "20 Aug 2019"));
  reviewData.add(ReviewModel(food_ic_user2, "Nice Dish ", "3.0", "20 Aug 2019"));

  return reviewData;
}

//
List<Coupons> addCouponsData() {
  List<Coupons> couponsData = [];
  couponsData.add(Coupons("Get 40% caseback using HDFC card", "Use code TVBH8932 upto Rs.150 on your first order and Rs. 50 to your second order.", "TVBH8932"));
  couponsData.add(Coupons("Get 20% caseback using Google wallet", "Use code AB46323 upto 25% on your first order and Rs. 50 to your second order.", "AB46323"));
  couponsData.add(Coupons("Get 40% caseback using HDFC card", "Use code BGHYJE34 upto Rs.150 on your first order and Rs. 50 to your second order.", "BGHYJE34"));
  return couponsData;
}

//
List<Filter> addCuisine() {
  List<Filter> filterData = [];

  filterData.add(Filter("South Indian"));
  filterData.add(Filter("American"));
  filterData.add(Filter("BBQ"));
  filterData.add(Filter("Bakery"));
  filterData.add(Filter("Biryani"));
  filterData.add(Filter("Burger"));
  filterData.add(Filter("Cafe"));
  filterData.add(Filter("Charcoal Chicken"));
  filterData.add(Filter("Chiness"));
  filterData.add(Filter("Fast Food"));
  filterData.add(Filter("Juice"));
  filterData.add(Filter("Gujarati"));
  filterData.add(Filter("Salad"));
  return filterData;
}

List<Filter> addOtherFilter() {
  List<Filter> filterData = [];
  filterData.add(Filter("Pure Veg Places"));
  filterData.add(Filter("Express Delivery"));
  filterData.add(Filter("Great Offer"));
  return filterData;
}

List<DataFilter> getAllData() {
  List<DataFilter> list = [];
  list.add(DataFilter(name: "South Indian"));
  list.add(DataFilter(name: "American"));
  list.add(DataFilter(name: "BBQ"));
  list.add(DataFilter(name: "Bakery"));
  list.add(DataFilter(name: "Biryani"));
  list.add(DataFilter(name: "Burger"));
  list.add(DataFilter(name: "Cafe"));
  list.add(DataFilter(name: "Charcoal Chicken"));
  list.add(DataFilter(name: "Chiness"));
  list.add(DataFilter(name: "Fast Food"));
  list.add(DataFilter(name: "Juice"));
  list.add(DataFilter(name: "Gujarati"));
  list.add(DataFilter(name: "Salad"));

  return list;
}

List<DataFilter> getFilterData() {
  List<DataFilter> filterData = [];
  filterData.add(DataFilter(title: "Pure Veg Places"));
  filterData.add(DataFilter(title: "Express Delivery"));
  filterData.add(DataFilter(title: "Great Offer"));
  return filterData;
}
