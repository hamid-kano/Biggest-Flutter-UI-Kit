import 'package:prokit_flutter/themes/theme12/models/T12Models.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';

List<T12Slider> getCards() {
  List<T12Slider> list = [];
  list.add(T12Slider(image: "images/theme12/t5_bg_card_2.png"));
  list.add(T12Slider(image: "images/theme12/t5_bg_card_2.png"));
  list.add(T12Slider(image: "images/theme12/t5_bg_card_2.png"));
  list.add(T12Slider(image: "images/theme12/t5_bg_card_2.png"));
  return list;
}

List<T12Category> getCategories() {
  List<T12Category> list = [];
  list.add(T12Category(name: "Cards", color: t12_cat1, icon: t12_card_1));
  list.add(T12Category(name: "Transfer", color: t12_cat2, icon: t12_transaction));
  list.add(T12Category(name: "Voucher", color: t12_cat3, icon: t12_coupon));
  list.add(T12Category(name: "Pay Bill", color: t12_cat4, icon: t12_bill));

  return list;
}

List<T12Transactions> getTransactions() {
  List<T12Transactions> list = [];
  list.add(T12Transactions(type: "Facebook", subType: "Salary", img: t12_facebook, amount: 7000, time: "12:45 am", transactionType: "credited"));
  list.add(T12Transactions(type: "Vodafone", subType: "Phone", img: t12_vodafone_icon, amount: 50, time: "08:15 pm", transactionType: "debited"));
  list.add(T12Transactions(type: "Uber Primer", subType: "Transport", img: t12_uber, amount: 8.75, time: "07:45 am"));
  list.add(T12Transactions(type: "FoodPanda", subType: "Meal", img: t12_foodpanda, amount: 15.75, time: "01:45 am"));

  return list;
}

List<T12Transactions> getAllTransactions() {
  List<T12Transactions> list = [];
  list.add(T12Transactions(type: "Facebook", subType: "Salary", img: t12_facebook, amount: 7000, time: "12:45 am", transactionType: "credited", transactionDate: "Today"));
  list.add(T12Transactions(type: "Vodafone", subType: "Phone", img: t12_vodafone_icon, amount: 50, time: "08:15 pm", transactionType: "debited", transactionDate: ""));
  list.add(T12Transactions(type: "Uber Primer", subType: "Transport", img: t12_uber, amount: 8.75, time: "07:45 am", transactionDate: ""));
  list.add(T12Transactions(type: "FoodPanda", subType: "Meal", img: t12_foodpanda, amount: 15.75, time: "01:45 am", transactionDate: ""));
  list.add(T12Transactions(type: "Uber Eats", subType: "Salary", img: t12_uber, amount: 7000, time: "12:45 am", transactionType: "credited", transactionDate: "Yesterday"));
  list.add(T12Transactions(type: "Citybank", subType: "Phone", img: t12_citybank, amount: 50, time: "08:15 pm", transactionType: "debited", transactionDate: ""));
  list.add(T12Transactions(type: "Uber Primer", subType: "Transport", img: t12_uber, amount: 8.75, time: "07:45 am", transactionDate: ""));
  list.add(T12Transactions(type: "FoodPanda", subType: "Meal", img: t12_foodpanda, amount: 15.75, time: "01:45 am", transactionDate: ""));

  return list;
}

List<T12Service> getSearchList() {
  List<T12Service> list = [];
  list.add(T12Service(img: t12_transaction, serviceName: "Money Transfer"));
  list.add(T12Service(img: t12_bill, serviceName: "Water Bill"));
  list.add(T12Service(img: t12_card, serviceName: "Credit Cards"));
  list.add(T12Service(img: t12_bill, serviceName: "Electricity bill"));
  list.add(T12Service(img: t12_money, serviceName: "Transactions"));
  list.add(T12Service(img: t12_bill, serviceName: "Pay Bill "));
  list.add(T12Service(img: t12_device, serviceName: "Mobile Recharge"));
  list.add(T12Service(img: t12_card, serviceName: "Add Card"));
  list.add(T12Service(img: t12_coupon, serviceName: "Voucher "));
  list.add(T12Service(img: t12_payment, serviceName: "Tuition Fee "));

  return list;
}
