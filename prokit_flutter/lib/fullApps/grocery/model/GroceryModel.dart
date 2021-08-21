class ProductModel {
  var name = "";
  var price = "";
  var weight = "";
  var img = "";
}

class CategoryModel {
  var name = "";
  var img = "";

  CategoryModel(this.name, this.img);
}

class NotificationModel {
  var name = "";
  var duration = "";
  var description = "";

  NotificationModel(this.name, this.duration, this.description);
}

class CategoryOptionModel {
  var name = "";

  CategoryOptionModel(this.name);
}

class ReviewModel {
  var name = "";
  var duration = "";
  var description = "";
  var img = "";

  ReviewModel(this.name, this.duration, this.description, this.img);
}

class CartModel {
  var name = "";
  var price = "";
  var totalItem = "";

  CartModel(
    this.name,
    this.price,
    this.totalItem,
  );
}

class GroceryProfileModel {
  var icon = "";
  var title = "";
  var color;
}

class GroceryPaymentModel {
  var cardImg = "";
  var color;
  var name = "";
  var cardNumber = "";
  bool isSelected = false;

  GroceryPaymentModel(this.cardImg, this.color, this.name, this.cardNumber, this.isSelected);
}
