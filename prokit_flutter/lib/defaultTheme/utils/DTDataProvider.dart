import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTAddressListModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTChatMessageModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTChatModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTProductModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTReviewModel.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTAboutScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTAddressScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTCartScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTCategoryDetailScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTChatScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTContactUsScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDashboardScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTErrorScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTFAQScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTFilterScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTForgotPwdScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTMaintenanceScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTNoDataScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTNoResultScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTOrderSummaryScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTPaymentScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTProductDetailScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTProfileScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTReviewScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTSearchScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTSignInScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTWalkThoughScreen.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

const sender_id = 1;
const receiver_id = 2;

List<DTProductModel> getProducts() {
  List<DTProductModel> list = [];

  DTProductModel p1 = DTProductModel();
  p1.name = 'Women Pink Cosmetic Bag';
  p1.price = 300;
  p1.discountPrice = 250;
  p1.rating = 4.5;
  p1.isLiked = true;
  p1.qty = 1;
  p1.image = ProductImg1;
  list.add(p1);

  DTProductModel p2 = DTProductModel();
  p2.name = 'Nilkamal Plastic Outdoor Chair  (dark brown)';
  p2.price = 384;
  p2.discountPrice = 290;
  p2.rating = 4.0;
  p2.isLiked = false;
  p2.qty = 1;
  p2.image = ProductImg2;
  list.add(p2);

  DTProductModel p3 = DTProductModel();
  p3.name = 'Ice Cream Chocolate';
  p3.price = 1082;
  p3.discountPrice = 999;
  p3.rating = 3.5;
  p3.isLiked = true;
  p3.qty = 1;
  p3.image = ProductImg3;
  list.add(p3);

  DTProductModel p4 = DTProductModel();
  p4.name = 'Star X PVC Dumbbells Set COMBO Gym & Fitness Kit';
  p4.price = 575;
  p4.discountPrice = 440;
  p4.rating = 4.5;
  p4.isLiked = true;
  p4.qty = 1;
  p4.image = ProductImg4;
  list.add(p4);

  DTProductModel p6 = DTProductModel();
  p6.name = 'Bluetooth Headset';
  p6.price = 379;
  p6.discountPrice = 119;
  p6.rating = 3.0;
  p6.qty = 1;
  p6.isLiked = false;
  p6.image = ProductImg5;
  list.add(p6);

  DTProductModel p5 = DTProductModel();
  p5.name = 'Alloy Jewel Set';
  p5.price = 999;
  p5.discountPrice = 870;
  p5.rating = 5.0;
  p5.isLiked = false;
  p5.qty = 1;
  p5.image = ProductImg6;
  list.add(p5);

  return list;
}

List<DTProductModel> getCartProducts() {
  List<DTProductModel> list = [];

  DTProductModel p1 = DTProductModel();
  p1.name = 'Women Pink Cosmetic Bag';
  p1.price = 300;
  p1.discountPrice = 250;
  p1.rating = 4.5;
  p1.isLiked = true;
  p1.qty = 1;
  p1.image = ProductImg1;
  list.add(p1);

  DTProductModel p2 = DTProductModel();
  p2.name = 'Nilkamal Plastic Outdoor Chair  (dark brown)';
  p2.price = 384;
  p2.discountPrice = 290;
  p2.rating = 4.0;
  p2.isLiked = false;
  p2.qty = 1;
  p2.image = ProductImg2;
  list.add(p2);

  DTProductModel p6 = DTProductModel();
  p6.name = 'Ice Cream Chocolate';
  p6.price = 379;
  p6.discountPrice = 119;
  p6.rating = 3.0;
  p6.qty = 1;
  p6.isLiked = false;
  p6.image = ProductImg3;
  list.add(p6);

  return list;
}

int getDTWidgetIndex(Widget widget) {
  getDrawerItems().asMap().entries.map((e) {
    int index = e.key;

    if (e.value.widget == widget) {
      return index;
    }
    return -1;
  });
  return -1;
  //return getDrawerItems().indexWhere((element) => element.widget.key == widget.key);
}

List<ListModel> getDrawerItems() {
  List<ListModel> drawerItems = [];

  drawerItems.add(ListModel(name: 'WalkThrough', widget: DTWalkThoughScreen()));
  drawerItems.add(ListModel(name: 'Sign In', widget: DTSignInScreen()));
  drawerItems.add(ListModel(name: 'Forgot Password', widget: DTForgotPwdScreen()));
  drawerItems.add(ListModel(name: 'Sign Up', widget: DTSignUpScreen()));
  drawerItems.add(ListModel(name: 'Dashboard', widget: DTDashboardScreen()));
  drawerItems.add(ListModel(name: 'Detail', widget: DTProductDetailScreen()));
  drawerItems.add(ListModel(name: 'Profile', widget: DTProfileScreen()));
  drawerItems.add(ListModel(name: 'Cart', widget: DTCartScreen()));
  drawerItems.add(ListModel(name: 'Payment', widget: DTPaymentScreen()));
  drawerItems.add(ListModel(name: 'Filter', widget: DTFilterScreen()));
  drawerItems.add(ListModel(name: 'About', widget: DTAboutScreen()));
  drawerItems.add(ListModel(name: 'Chat', widget: DTChatScreen()));

  if (isMobile) drawerItems.add(ListModel(name: 'Contact Us', widget: DTContactUsScreen()));

  drawerItems.add(ListModel(name: 'Review & Rating', widget: DTReviewScreen()));
  drawerItems.add(ListModel(name: 'FAQ', widget: DTFAQScreen()));
  //drawerItems.add(ListModel(name: 'No Internet', widget: DTNoInternetScreen()));
  drawerItems.add(ListModel(name: 'No Data', widget: DTNoDataScreen()));
  drawerItems.add(ListModel(name: 'Error', widget: DTErrorScreen()));
  drawerItems.add(ListModel(name: 'Maintenance', widget: DTMaintenanceScreen()));
  drawerItems.add(ListModel(name: 'Grid View', widget: DTCategoryDetailScreen()));
  drawerItems.add(ListModel(name: 'Order Summary', widget: DTOrderSummaryScreen(getCartProducts())));
  drawerItems.add(ListModel(name: 'Address Manager', widget: DTAddressScreen()));
  drawerItems.add(ListModel(name: 'Search', widget: DTSearchScreen()));
  drawerItems.add(ListModel(name: 'No Result', widget: DTNoResultScreen()));
  return drawerItems;
}

List<DTChatModel> getChatData() {
  List<DTChatModel> list = [];

  DTChatModel c1 = DTChatModel();
  c1.name = 'William';
  c1.img = SampleImageUrl;
  c1.time = '1:43 AM';
  c1.lastMsg = LoremText;
  c1.unreadCount = Random().nextInt(20);
  list.add(c1);

  DTChatModel c2 = DTChatModel();
  c2.name = 'Benjamin';
  c2.img = SampleImageUrl2;
  c2.time = '4:43 AM';
  c2.lastMsg = LoremText;
  c2.unreadCount = Random().nextInt(20);
  list.add(c2);

  DTChatModel c3 = DTChatModel();
  c3.name = 'Emma';
  c3.img = SampleImageUrl4;
  c3.time = '7:03 PM';
  c3.lastMsg = LoremText;
  c3.unreadCount = Random().nextInt(20);
  list.add(c3);

  DTChatModel c4 = DTChatModel();
  c4.name = 'Isabella';
  c4.img = SampleImageUrl2;
  c4.time = '2:43 PM';
  c4.lastMsg = LoremText;
  c4.unreadCount = Random().nextInt(20);
  list.add(c4);

  DTChatModel c5 = DTChatModel();
  c5.name = 'John Smith';
  c5.img = SampleImageUrl4;
  c5.time = '2:43 PM';
  c5.lastMsg = LoremText;
  c5.unreadCount = Random().nextInt(20);
  list.add(c5);

  return list;
}

List<DTChatMessageModel> getChatMsgData() {
  List<DTChatMessageModel> list = [];

  DTChatMessageModel c1 = DTChatMessageModel();
  c1.Sender_id = sender_id;
  c1.Recevier_id = receiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  DTChatMessageModel c2 = DTChatMessageModel();
  c2.Sender_id = sender_id;
  c2.Recevier_id = receiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  DTChatMessageModel c3 = DTChatMessageModel();
  c3.Sender_id = receiver_id;
  c3.Recevier_id = sender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  DTChatMessageModel c4 = DTChatMessageModel();
  c4.Sender_id = sender_id;
  c4.Recevier_id = receiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  DTChatMessageModel c5 = DTChatMessageModel();
  c5.Sender_id = sender_id;
  c5.Recevier_id = receiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  DTChatMessageModel c6 = DTChatMessageModel();
  c6.Sender_id = receiver_id;
  c6.Recevier_id = sender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  DTChatMessageModel c7 = DTChatMessageModel();
  c7.Sender_id = sender_id;
  c7.Recevier_id = receiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  DTChatMessageModel c8 = DTChatMessageModel();
  c8.Sender_id = receiver_id;
  c8.Recevier_id = sender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  DTChatMessageModel c9 = DTChatMessageModel();
  c9.Sender_id = sender_id;
  c9.Recevier_id = receiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  DTChatMessageModel c10 = DTChatMessageModel();
  c10.Sender_id = receiver_id;
  c10.Recevier_id = sender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  DTChatMessageModel c11 = DTChatMessageModel();
  c11.Sender_id = receiver_id;
  c11.Recevier_id = sender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  DTChatMessageModel c12 = DTChatMessageModel();
  c12.Sender_id = sender_id;
  c12.Recevier_id = receiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  DTChatMessageModel c13 = DTChatMessageModel();
  c13.Sender_id = sender_id;
  c13.Recevier_id = receiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  DTChatMessageModel c14 = DTChatMessageModel();
  c14.Sender_id = receiver_id;
  c14.Recevier_id = sender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  DTChatMessageModel c15 = DTChatMessageModel();
  c15.Sender_id = sender_id;
  c15.Recevier_id = receiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  DTChatMessageModel c16 = DTChatMessageModel();
  c16.Sender_id = receiver_id;
  c16.Recevier_id = sender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  DTChatMessageModel c17 = DTChatMessageModel();
  c17.Sender_id = sender_id;
  c17.Recevier_id = receiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  DTChatMessageModel c18 = DTChatMessageModel();
  c18.Sender_id = receiver_id;
  c18.Recevier_id = sender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

String getMonth(int month) {
  if (month == 1) return 'January';
  if (month == 2) return 'February';
  if (month == 3) return 'March';
  if (month == 4) return 'April';
  if (month == 5) return 'May';
  if (month == 6) return 'Jun';
  if (month == 7) return 'July';
  if (month == 8) return 'August';
  if (month == 9) return 'September';
  if (month == 10) return 'October';
  if (month == 11) return 'November';
  if (month == 12) return 'December';
  return '';
}

List<DTAddressListModel> getAddressList() {
  List<DTAddressListModel> list = [];

  DTAddressListModel a1 = DTAddressListModel();
  a1.name = "Smith Jones";
  a1.type = "Home";
  a1.addressLine1 = '381, Shirley St. Munster, New York';
  a1.addressLine2 = 'United States - 10005';
  a1.phoneNo = '+913972847376';
  list.add(a1);

  DTAddressListModel a2 = DTAddressListModel();
  a2.name = "Micheal Doe";
  a2.type = "Office";
  a2.addressLine1 = '4046  Fleming Street, Montgomery';
  a2.addressLine2 = 'Alabama 36109';
  a2.phoneNo = '334-318-6649';
  list.add(a2);

  return list;
}

List<DTReviewModel> getReviewList() {
  List<DTReviewModel> list = [];

  DTReviewModel r1 = DTReviewModel();
  r1.name = "John smith";
  r1.comment = LoremText;
  r1.ratting = 2.0;
  list.add(r1);
  DTReviewModel r2 = DTReviewModel();
  r2.name = "Lora";
  r2.comment = LoremText;
  r2.ratting = 4.0;
  list.add(r2);
  DTReviewModel r3 = DTReviewModel();
  r3.name = "Isabella";
  r3.comment = LoremText;
  r3.ratting = 5.0;
  list.add(r3);
  DTReviewModel r4 = DTReviewModel();
  r4.name = "Emma";
  r4.comment = LoremText;
  r4.ratting = 3.0;
  list.add(r4);
  DTReviewModel r5 = DTReviewModel();
  r5.name = "John";
  r5.comment = LoremText;
  r5.ratting = 5.0;
  list.add(r5);
  DTReviewModel r6 = DTReviewModel();
  r6.name = "Nora";
  r6.comment = LoremText;
  r6.ratting = 3.0;
  list.add(r6);
  DTReviewModel r7 = DTReviewModel();
  r7.name = "Nora";
  r7.comment = LoremText;
  r7.ratting = 3.0;
  list.add(r7);
  DTReviewModel r8 = DTReviewModel();
  r8.name = "John";
  r8.comment = LoremText;
  r8.ratting = 5.0;
  list.add(r8);

  return list;
}
