import 'dart:ui';

class LearnerWalk {
  String? img;
}

class LearnerCategoryModel {
  var img = "";
  var name = "";
}

class LearnerFeaturedModel {
  var img = "";
  var name = "";
  var price = "";
  var strikePrice = "";
  var type;
}

class LearnerPeopleModel {
  var img = "";
  var name = "";
  var points = "";
  var isOnline = false;
  var subject = "";
  var email = "";
  var frd = "";
}

class LearnerBadgeModel {
  var img = "";
  Color? color;

  var name = "";
  var comment = "";
  var isLocked = false;
}

class LearnerContentModel {
  var name = "";
  var subtitle = "";
  var type = "";
}

class LearnerCoursesModel {
  var name = "";
  var img = "";
}

class LearnerChatModel {
  var name = "";
  var msg = "";
  var img = "";
  var isOnline = false;
}

class LearnerLectureModel {
  var no = "";
  var title = "";
  var subtitle = "";
  var type = "";
}

class ChatModel {
  String id;
  String message;

  ChatModel(this.id, this.message);
}
