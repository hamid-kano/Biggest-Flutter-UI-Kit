import 'package:flutter/material.dart';

class NBBannerItemModel {
  String? image;

  NBBannerItemModel({this.image});
}

class NBDrawerItemModel {
  String? title;
  Widget? widget;

  NBDrawerItemModel({this.title, this.widget});
}

class NBNewsDetailsModel {
  String? categoryName;
  String? title;
  String? date;
  String? image;
  String? details;
  bool isBookmark;
  String? time;

  NBNewsDetailsModel({this.categoryName, this.title, this.date, this.image, this.details, this.isBookmark = false, this.time});
}

class NBSettingsItemModel {
  String? title;
  Widget? widget;

  NBSettingsItemModel({this.title, this.widget});
}

class NBLanguageItemModel {
  String image;
  String name;

  NBLanguageItemModel(this.image, this.name);
}

class NBNotificationItemModel {
  String title;
  bool isOn;

  NBNotificationItemModel(this.title, this.isOn);
}

class NBCategoryItemModel {
  String image;
  String name;

  NBCategoryItemModel(this.image, this.name);
}

class NBMembershipPlanItemModel {
  String timePeriod;
  String price;
  String text;

  NBMembershipPlanItemModel(this.timePeriod, this.price, this.text);
}

class NBFollowersItemModel {
  String image;
  String name;
  int noOfArticle;

  NBFollowersItemModel(this.image, this.name, this.noOfArticle);
}

class NBCommentItemModel {
  String? name;
  String? image;
  String? date;
  String? time;
  String? message;

  NBCommentItemModel({this.name, this.image, this.date, this.time, this.message});
}
