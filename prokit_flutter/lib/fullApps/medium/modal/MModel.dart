class MListModel {
  String? title;
  String? img;
  String? subtitle;
  String? time;
  String? date;
  String? authName;
  bool? isFav;

  MListModel({this.title, this.img, this.subtitle, this.time, this.date, this.authName, this.isFav});
}

class MTopicModel {
  String? title;
  String? img;
  bool isFollow;

  MTopicModel({this.title, this.img, this.isFollow = false});
}

class MPeopleModel {
  String? img;
  String? title;
  String? subTitle;
  bool isFollow;

  MPeopleModel({this.img, this.title, this.subTitle, this.isFollow = false});
}

class MStoriesModel {
  String? title;
  String? time;
  String? userName;
  bool isDraft;
  bool isPublic;
  bool isUnlisted;
  bool isFav;

  MStoriesModel({this.userName, this.title, this.time, this.isDraft = false, this.isPublic = false, this.isUnlisted = false, this.isFav = false});
}

class MSelectTopicModel {
  String? topicName;
  bool isSelected;

  MSelectTopicModel({this.topicName, this.isSelected = false});
}
