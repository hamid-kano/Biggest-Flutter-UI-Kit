import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';

List<LearnerWalk> learnerWalkImg() {
  List<LearnerWalk> list = [];

  var img1 = LearnerWalk();
  img1.img = learner_walk_1;
  list.add(img1);

  var img2 = LearnerWalk();
  img2.img = learner_walk_2;
  list.add(img2);

  var img3 = LearnerWalk();
  img3.img = learner_walk_3;
  list.add(img3);

  return list;
}

List<LearnerCategoryModel> learnerGetCategories() {
  List<LearnerCategoryModel> list = [];

  var category = LearnerCategoryModel();
  category.img = learner_ic_bag;
  category.name = "Business";

  var category2 = LearnerCategoryModel();
  category2.img = learner_ic_pencil_scale;
  category2.name = "Design";

  var category3 = LearnerCategoryModel();
  category3.img = learner_ic_crome;
  category3.name = "Economy";

  var category4 = LearnerCategoryModel();
  category4.img = learner_ic_telecope;
  category4.name = "Research";

  var category5 = LearnerCategoryModel();
  category5.img = learner_ic_medal;
  category5.name = "Polytics";

  var category6 = LearnerCategoryModel();
  category6.img = learner_ic_crown;
  category6.name = "Awards";

  var category7 = LearnerCategoryModel();
  category7.img = learner_ic_flag;
  category7.name = "Sports";

  var category8 = LearnerCategoryModel();
  category8.img = learner_ic_cup;
  category8.name = "Medals";

  list.add(category);
  list.add(category2);
  list.add(category3);
  list.add(category4);
  list.add(category5);
  list.add(category6);
  list.add(category7);
  list.add(category8);

  return list;
}

List<LearnerFeaturedModel> learnerGetFavourites() {
  List<LearnerFeaturedModel> list = [];
  LearnerFeaturedModel featured = LearnerFeaturedModel();
  featured.img = learner_walk_1;
  featured.name = "Business Management";
  featured.price = "\$19.99";
  featured.type = "Management";

  LearnerFeaturedModel featured2 = LearnerFeaturedModel();
  featured2.img = learner_walk_2;
  featured2.name = "IT & Cloud Computing";
  featured2.price = "\$16.99";
  featured2.strikePrice = "\$20.99";
  featured2.type = "Computer";

  LearnerFeaturedModel featured5 = LearnerFeaturedModel();
  featured5.img = learner_walk_3;
  featured5.name = "Learn How To Play Guitar";
  featured5.price = "\$16.99";
  featured5.strikePrice = "\$20.99";
  featured5.type = "Music";

  LearnerFeaturedModel featured6 = LearnerFeaturedModel();
  featured6.img = learner_walk_1;
  featured6.name = "Basics of baking cakes";
  featured6.price = "\$16.99";
  featured6.type = "Cooking";

  LearnerFeaturedModel featured3 = LearnerFeaturedModel();
  featured3.img = learner_walk_3;
  featured3.name = "Modern Medicines";
  featured3.price = "\$10.99";
  featured3.type = "Medicines";

  LearnerFeaturedModel featured4 = LearnerFeaturedModel();
  featured4.img = learner_walk_1;
  featured4.name = "Project Management";
  featured4.price = "\$16.99";
  featured4.type = "Management";

  list.add(featured);
  list.add(featured2);
  list.add(featured5);
  list.add(featured6);
  list.add(featured3);
  list.add(featured4);

  return list;
}

List<LearnerPeopleModel> learnerGetRecommended() {
  List<LearnerPeopleModel> list = [];

  var people = LearnerPeopleModel();
  people.img = learner_walk_1;
  list.add(people);

  var people2 = LearnerPeopleModel();
  people2.img = learner_ic_Cake;
  list.add(people2);

  var people3 = LearnerPeopleModel();
  people3.img = learner_green_image;
  list.add(people3);

  var people4 = LearnerPeopleModel();
  people4.img = learner_climb;
  list.add(people4);

  var people5 = LearnerPeopleModel();
  people5.img = learner_walk_3;
  list.add(people5);

  var people6 = LearnerPeopleModel();
  people6.img = learner_ic_Profile;
  list.add(people6);

  return list;
}

List<LearnerPeopleModel> learnerGetInstructor() {
  List<LearnerPeopleModel> list = [];

  LearnerPeopleModel people = LearnerPeopleModel();
  people.img = learner_ic_profile2;
  people.name = "James";
  people.subject = "Economy";
  people.isOnline = true;

  list.add(people);

  LearnerPeopleModel people2 = LearnerPeopleModel();
  people2.img = learner_ic_profile3;
  people2.name = "Anna";
  people2.subject = "Design";
  list.add(people2);

  LearnerPeopleModel people3 = LearnerPeopleModel();
  people3.img = learner_ic_profile4;
  people3.name = "Louisa";
  people3.subject = "Photography";
  people3.isOnline = true;

  list.add(people3);

  LearnerPeopleModel people4 = LearnerPeopleModel();
  people4.img = learner_ic_profile5;
  people4.name = "Walter";
  people4.subject = "Artist";
  list.add(people4);

  LearnerPeopleModel people5 = LearnerPeopleModel();
  people5.img = learner_ic_profile6;
  people5.name = "Emma Watson";
  people5.subject = "Mathematician";
  people5.isOnline = true;

  list.add(people5);

  LearnerPeopleModel people6 = LearnerPeopleModel();
  people6.img = learner_ic_profile7;
  people6.name = "Julie Gonas";
  people6.subject = "Sports";
  people6.isOnline = true;

  list.add(people6);

  return list;
}

List<LearnerBadgeModel> learnerGetBadges() {
  List<LearnerBadgeModel> list = [];

  LearnerBadgeModel badge = LearnerBadgeModel();
  badge.img = learner_ic_medal;
  badge.name = "Quick Learner";
  badge.comment = "Completed 1 course";
  badge.color = learner_colorPrimary;
  list.add(badge);

  LearnerBadgeModel badge1 = LearnerBadgeModel();
  badge1.img = learner_ic_crown;
  badge1.name = "Master Mind!";
  badge1.comment = "Got 1st place on leaderboard";
  badge1.color = learner_light_green;
  list.add(badge1);

  LearnerBadgeModel badge2 = LearnerBadgeModel();
  badge2.img = learner_ic_cup;
  badge2.name = "Super Learner";
  badge2.comment = "Completed more than 5 courses";
  badge2.color = learner_light_pink;
  list.add(badge2);

  LearnerBadgeModel badge3 = LearnerBadgeModel();
  badge3.img = learner_ic_flag;
  badge3.name = "The Achiever";
  badge3.comment = "Logged in everyday for a month";
  badge3.color = learner_light_red;
  list.add(badge3);

  return list;
}

List<LearnerPeopleModel> learnerGetPending() {
  List<LearnerPeopleModel> list = [];

  LearnerPeopleModel people = LearnerPeopleModel();
  people.img = learner_ic_Profile;
  people.name = "Alice Smith";
  people.isOnline = true;
  people.points = "109565 Points";
  people.email = "alicesmith@gmail.com";
  people.frd = "12 mutual Friends";
  list.add(people);

  LearnerPeopleModel people2 = LearnerPeopleModel();
  people2.img = learner_ic_profile1;
  people2.name = "Hennah Tran";
  people2.points = "206598 Points";
  people2.email = "hennahTran@gmail.com";
  people2.frd = "3 mutual Friends";
  list.add(people2);

  LearnerPeopleModel people3 = LearnerPeopleModel();
  people3.img = learner_ic_profile2;
  people3.name = "Louisa MacGee";
  people3.points = "896531 Points";
  people3.email = "Louisamacgee@gmail.com";
  people3.frd = "7 mutual Friends";
  list.add(people3);

  LearnerPeopleModel people4 = LearnerPeopleModel();
  people4.img = learner_ic_profile3;
  people4.name = "Walter James";
  people4.points = "106532 Points";
  people4.email = "WalterJames@gmail.com";
  people4.frd = "6 mutual Friends";
  people4.isOnline = true;
  list.add(people4);

  LearnerPeopleModel people5 = LearnerPeopleModel();
  people5.img = learner_ic_profile4;
  people5.name = "Nia Scott";
  people5.points = "236585 Points";
  people5.email = "niaScott@gmail.com";
  people5.frd = "16 mutual Friends";
  list.add(people5);

  LearnerPeopleModel people6 = LearnerPeopleModel();
  people6.img = learner_ic_profile5;
  people6.name = "Hennah Tran";
  people6.points = "569432 Points";
  people6.email = "hennahTran@gmail.com";
  people6.frd = "12 mutual Friends";
  list.add(people6);
  return list;
}

List<LearnerCoursesModel> learnerGetCourses() {
  List<LearnerCoursesModel> list = [];
  LearnerCoursesModel courses = LearnerCoursesModel();
  courses.img = learner_walk_1;
  courses.name = "Business Management";

  LearnerCoursesModel courses2 = LearnerCoursesModel();
  courses2.img = learner_walk_2;
  courses2.name = "It & Cloud Computing";

  LearnerCoursesModel courses3 = LearnerCoursesModel();
  courses3.img = learner_walk_3;
  courses3.name = "Learn How To Play Guitar";

  LearnerCoursesModel courses4 = LearnerCoursesModel();
  courses4.img = learner_walk_1;
  courses4.name = "Basic of baking cakes";

  LearnerCoursesModel courses5 = LearnerCoursesModel();
  courses5.img = learner_walk_2;
  courses5.name = "Modren Medicines";

  LearnerCoursesModel courses6 = LearnerCoursesModel();
  courses6.img = learner_walk_3;
  courses6.name = "Project Management";

  list.add(courses);
  list.add(courses2);
  list.add(courses3);
  list.add(courses4);
  list.add(courses5);
  list.add(courses6);
  return list;
}

List<LearnerContentModel> learnerGetContents() {
  List<LearnerContentModel> list = [];
  var content = LearnerContentModel();
  content.name = "Introduction";
  content.subtitle = "About this course and overview";
  content.type = "Video";
  list.add(content);

  var content2 = LearnerContentModel();
  content2.name = "What is management?";
  content2.subtitle = "Basics and introduction";
  content2.type = "Article";
  list.add(content2);

  var content3 = LearnerContentModel();
  content3.name = "How does your decision effect your project?";
  content3.subtitle = "Learn the  decision effect";
  content3.type = "Presentation";
  list.add(content3);
  return list;
}

List<LearnerChatModel> learnerGetChatData() {
  List<LearnerChatModel> list = [];
  var content1 = LearnerChatModel();
  content1.name = "Alice Smith";
  content1.msg = "Hi Alice How are you";
  content1.img = learner_ic_profile3;
  content1.isOnline = true;
  list.add(content1);

  var content2 = LearnerChatModel();
  content2.name = "Hennah Tran";
  content2.msg = "Hi can u explain me this topic?";
  content2.img = learner_ic_profile4;
  list.add(content2);

  var content3 = LearnerChatModel();
  content3.name = "Hennah Tran";
  content3.msg = "Hi can u explain me this topic?";
  content3.img = learner_ic_profile6;
  list.add(content3);

  var content4 = LearnerChatModel();
  content4.name = "Hennah Tran";
  content4.msg = "Hi can u explain me this topic?";
  content4.img = learner_ic_profile2;
  content4.isOnline = true;
  list.add(content4);

  return list;
}

List<LearnerLectureModel> learnerGetLectureData() {
  List<LearnerLectureModel> list = [];
  var content1 = LearnerLectureModel();
  content1.no = "1";
  content1.title = "Introducation";
  content1.subtitle = "About this course and overview.";
  content1.type = "video";
  list.add(content1);

  var content2 = LearnerLectureModel();
  content2.no = "2";
  content2.title = "What is management?";
  content2.subtitle = "Basics and introducation";
  content2.type = "Article";
  list.add(content2);

  var content3 = LearnerLectureModel();
  content3.no = "3";
  content3.title = "How does your decision effect your project?";
  content3.subtitle = "Learner the most importanted asp..";
  content3.type = "video";
  list.add(content3);

  return list;
}

List<ChatModel> getMessages() {
  List<ChatModel> list = [];

  ChatModel model1 = ChatModel('1', 'Hello Nimisha');
  ChatModel model2 = ChatModel('1', 'I am Revision Bot, here to help you study your ongoing courses.');
  ChatModel model3 = ChatModel('1', 'select a course to begin Business Management Cloud Computing Moden Medicine');
  ChatModel model4 = ChatModel('2', 'Modren Medicine');

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);

  return list;
}
