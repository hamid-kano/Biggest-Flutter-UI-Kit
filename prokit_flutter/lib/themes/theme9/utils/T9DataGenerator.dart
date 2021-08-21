import 'package:prokit_flutter/themes/theme9/models/T9Models.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Images.dart';

List<T9PeopleModel> t9GetRecommended() {
  List<T9PeopleModel> list = [];

  var people = T9PeopleModel();
  people.img = t9_walk_1;
  list.add(people);

  var people2 = T9PeopleModel();
  people2.img = t9_ic_cake;
  list.add(people2);

  var people3 = T9PeopleModel();
  people3.img = t9_green_image;
  list.add(people3);

  var people4 = T9PeopleModel();
  people4.img = t9_climb;
  list.add(people4);

  var people5 = T9PeopleModel();
  people5.img = t9_walk_3;
  list.add(people5);

  var people6 = T9PeopleModel();
  people6.img = t9_ic_profile;
  list.add(people6);

  return list;
}

List<T9PeopleModel> t9GetInstructor() {
  List<T9PeopleModel> list = [];

  T9PeopleModel people = T9PeopleModel();
  people.img = t9_ic_profile2;
  people.name = "James";
  people.subject = "Economy";
  people.isOnline = true;

  list.add(people);

  T9PeopleModel people2 = T9PeopleModel();
  people2.img = t9_ic_profile3;
  people2.name = "Anna";
  people2.subject = "Design";
  list.add(people2);

  T9PeopleModel people3 = T9PeopleModel();
  people3.img = t9_ic_profile4;
  people3.name = "Louisa";
  people3.subject = "Photography";
  people3.isOnline = true;

  list.add(people3);

  T9PeopleModel people4 = T9PeopleModel();
  people4.img = t9_ic_profile5;
  people4.name = "Walter";
  people4.subject = "Artist";
  list.add(people4);

  T9PeopleModel people5 = T9PeopleModel();
  people5.img = t9_ic_profile6;
  people5.name = "Emma Watson";
  people5.subject = "Mathematician";
  people5.isOnline = true;

  list.add(people5);

  T9PeopleModel people6 = T9PeopleModel();
  people6.img = t9_ic_profile7;
  people6.name = "Julie Gonas";
  people6.subject = "Sports";
  people6.isOnline = true;

  list.add(people6);

  return list;
}

List<T9FeaturedModel> t9GetFavourites() {
  List<T9FeaturedModel> list = [];
  T9FeaturedModel featured = T9FeaturedModel();
  featured.img = t9_walk_1;
  featured.name = "Business Management";
  featured.price = "\$19.99";
  featured.type = "Management";

  T9FeaturedModel featured2 = T9FeaturedModel();
  featured2.img = t9_walk_2;
  featured2.name = "IT & Cloud Computing";
  featured2.price = "\$16.99";
  featured2.strikePrice = "\$20.99";
  featured2.type = "Computer";

  T9FeaturedModel featured5 = T9FeaturedModel();
  featured5.img = t9_walk_3;
  featured5.name = "Learn How To Play Guitar";
  featured5.price = "\$16.99";
  featured5.strikePrice = "\$20.99";
  featured5.type = "Music";

  T9FeaturedModel featured6 = T9FeaturedModel();
  featured6.img = t9_walk_1;
  featured6.name = "Basics of baking cakes";
  featured6.price = "\$16.99";
  featured6.type = "Cooking";

  T9FeaturedModel featured3 = T9FeaturedModel();
  featured3.img = t9_walk_3;
  featured3.name = "Modern Medicines";
  featured3.price = "\$10.99";
  featured3.type = "Medicines";

  T9FeaturedModel featured4 = T9FeaturedModel();
  featured4.img = t9_walk_1;
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

List<T9ContentModel> t9GetContents() {
  List<T9ContentModel> list = [];
  var content = T9ContentModel();
  content.name = "Introduction";
  content.subtitle = "About this course and overview";
  content.type = "Video";
  list.add(content);

  var content2 = T9ContentModel();
  content2.name = "What is management?";
  content2.subtitle = "Basics and introduction";
  content2.type = "Article";
  list.add(content2);

  var content3 = T9ContentModel();
  content3.name = "How does your decision effect your project?";
  content3.subtitle = "Learn the  decision effect";
  content3.type = "Presentation";
  list.add(content3);
  return list;
}

List<T9CategoryModel> t9GetCategories() {
  List<T9CategoryModel> list = [];
  var category = T9CategoryModel();
  category.img = t9_ic_bag;
  category.name = "Business";

  var category2 = T9CategoryModel();
  category2.img = t9_ic_pencil_scale;
  category2.name = "Design";

  var category3 = T9CategoryModel();
  category3.img = t9_ic_crome;
  category3.name = "Economy";

  var category4 = T9CategoryModel();
  category4.img = t9_ic_telecope;
  category4.name = "Research";

  var category5 = T9CategoryModel();
  category5.img = t9_ic_medal;
  category5.name = "Polytics";

  var category6 = T9CategoryModel();
  category6.img = t9_ic_crown;
  category6.name = "Awards";

  var category7 = T9CategoryModel();
  category7.img = t9_ic_flag;
  category7.name = "Sports";

  var category8 = T9CategoryModel();
  category8.img = t9_ic_cup;
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

List<T9PeopleModel> t9GetPending() {
  List<T9PeopleModel> list = [];

  T9PeopleModel people = T9PeopleModel();
  people.img = t9_ic_profile;
  people.name = "Alice Smith";
  people.isOnline = true;
  people.points = "109565 Points";
  list.add(people);

  T9PeopleModel people2 = T9PeopleModel();
  people2.img = t9_ic_profile1;
  people2.name = "Hennah Tran";
  people2.points = "206598 Points";
  list.add(people2);

  T9PeopleModel people3 = T9PeopleModel();
  people3.img = t9_ic_profile2;
  people3.name = "Louisa MacGee";
  people3.points = "896531 Points";
  list.add(people3);

  T9PeopleModel people4 = T9PeopleModel();
  people4.img = t9_ic_profile3;
  people4.name = "Walter James";
  people4.points = "106532 Points";
  people4.isOnline = true;
  list.add(people4);

  T9PeopleModel people5 = T9PeopleModel();
  people5.img = t9_ic_profile4;
  people5.name = "Nia Scott";
  people5.points = "236585 Points";
  list.add(people5);

  T9PeopleModel people6 = T9PeopleModel();
  people6.img = t9_ic_profile5;
  people6.name = "Hennah Tran";
  people6.points = "569432 Points";
  list.add(people6);
  return list;
}

List<T9BadgeModel> t9GetBadges() {
  List<T9BadgeModel> list = [];

  T9BadgeModel badge = T9BadgeModel();
  badge.img = t9_ic_medal;
  badge.name = "Quick Learner";
  badge.comment = "Completed 1 course";
  badge.color = t9_colorPrimary;
  list.add(badge);

  T9BadgeModel badge1 = T9BadgeModel();
  badge1.img = t9_ic_crown;
  badge1.name = "Master Mind!";
  badge1.comment = "Got 1st place on leaderboard";
  badge1.color = t9_light_green;
  list.add(badge1);

  T9BadgeModel badge2 = T9BadgeModel();
  badge2.img = t9_ic_cup;
  badge2.name = "Super Learner";
  badge2.comment = "Completed more than 5 courses";
  badge2.color = t9_light_pink;
  list.add(badge2);

  T9BadgeModel badge3 = T9BadgeModel();
  badge3.img = t9_ic_flag;
  badge3.name = "The Achiever";
  badge3.comment = "Logged in everyday for a month";
  badge3.color = t9_light_red;
  list.add(badge3);

  T9BadgeModel badge4 = T9BadgeModel();
  badge4.isLocked = true;
  list.add(badge4);

  T9BadgeModel badge5 = T9BadgeModel();
  badge5.isLocked = true;
  list.add(badge5);

  var badge6 = T9BadgeModel();
  badge6.isLocked = true;
  list.add(badge6);

  return list;
}
