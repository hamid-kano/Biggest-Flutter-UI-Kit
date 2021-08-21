import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MImages.dart';

List<MListModel> getSavingPostList() {
  List<MListModel> list = [];
  list.add(MListModel(title: 'Flutter Layout Basics', authName: 'Thiranjaya Munasinghe', img: mCatAndroid, time: '5 min', date: '16 Aug 2018'));
  list.add(MListModel(title: 'Netflix\'s Keeper Test\'Is the secret to a SuccessFul Workforce', subtitle: 'Reed Hastings', img: mCatHealth, time: '11 min', date: '14 Jun 2019'));
  list.add(MListModel(title: 'The Psychology of Building An Audience', authName: 'Srinivas Rao', img: mCatProductivity, time: '32 min', date: '5 Oct'));
  list.add(MListModel(title: 'Flutter Widgets-- A brief guide', authName: 'Prakash Donga', img: mCatBusiness, time: '3 min', date: '14 Jun'));
  list.add(MListModel(title: 'Image Picker in Flutter', subtitle: 'Lemmecode', img: mCatArt, time: '4 min', date: '26 June'));
  list.add(MListModel(title: '7 Things you should Never Do in the moring', subtitle: 'Sinem Gunel', img: mCatScience, time: '8 min', date: '24 Sept'));
  list.add(MListModel(title: 'I Don\'t Know How To Pronounce My Last Name', authName: 'Meghan Daum', img: mCatAndroid, time: '11 min', date: '15 Jul'));
  list.add(MListModel(title: 'How This Designer Made \$100,000 in 6 Days', authName: 'John Garg', img: mCatIosDeveloper, time: '54 min', date: '7 Oct'));
  list.add(MListModel(title: 'Login Page UI in Flutter', authName: 'Yogita Kumar', img: mCatFeminism, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: '3 Ways to Break into Data Science', subtitle: 'Elad cohen', img: mCatSocialMedia, time: '11 min', date: '14 Feb'));
  return list;
}

List<MListModel> getArchivedList() {
  List<MListModel> list = [];
  list.add(MListModel(title: '7 Things you should Never Do in the moring', subtitle: 'Sinem Gunel', img: mCatPsychological, time: '8 min', date: '24 Sept'));
  list.add(MListModel(title: 'I Don\'t Know How To Pronounce My Last Name', authName: 'Meghan Daum', img: mCatBook, time: '11 min', date: '15 Jul'));
  list.add(MListModel(title: 'How This Designer Made \$100,000 in 6 Days', authName: 'John Garg', img: mCatMentalHealth, time: '54 min', date: '7 Oct'));
  list.add(MListModel(title: 'Login Page UI in Flutter', authName: 'Yogita Kumar', img: mCatIosDeveloper, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: '3 Ways to Break into Data Science', subtitle: 'Elad cohen', img: mCatRelationship, time: '11 min', date: '14 Feb'));
  return list;
}

List<MListModel> getRecentViewList() {
  List<MListModel> list = [];
  list.add(MListModel(title: 'Netflix\'s Keeper Test\'Is the secret to a SuccessFul Workforce', subtitle: 'Reed Hastings', img: mCatSocialMedia, time: '11 min', date: '14 Jun 2019'));
  list.add(MListModel(title: 'The Psychology of Building An Audience', authName: 'Srinivas Rao', img: mCatCrypto, time: '32 min', date: '5 Oct'));
  list.add(MListModel(title: 'Image Picker in Flutter', subtitle: 'Lemmecode', img: mCatEducation, time: '4 min', date: '26 June'));
  list.add(MListModel(title: '7 Things you should Never Do in the moring', subtitle: 'Sinem Gunel', img: mCatProgramming, time: '8 min', date: '24 Sept'));
  list.add(MListModel(title: 'How This Designer Made \$100,000 in 6 Days', authName: 'John Garg', img: mCatIosDeveloper, time: '54 min', date: '7 Oct'));
  return list;
}

List<MListModel> getHighlightPostList() {
  List<MListModel> list = [];
  list.add(MListModel(title: 'Image Picker in Flutter', subtitle: 'Lemmecode', img: mCatTrueCrime, time: '4 min', date: '26 June'));
  list.add(MListModel(title: 'How This Designer Made \$100,000 in 6 Days', authName: 'John Garg', img: mCatTechnology, time: '54 min', date: '7 Oct'));
  return list;
}

List<MListModel> getDailyReadList() {
  List<MListModel> list = [];
  list.add(MListModel(title: 'Login Page UI in Flutter', authName: 'Yogita Kumar', img: mArtificial, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: 'Flutter Layout Basics', authName: 'Thiranjaya Munasinghe', img: mCatCulture, time: '5 min', date: '16 Aug 2018'));
  list.add(MListModel(title: 'Flutter Widgets-- A brief guide', authName: 'Prakash Donga', img: mCatFeminism, time: '3 min', date: '14 Jun'));
  return list;
}

List<MTopicModel> getTopicList() {
  List<MTopicModel> list = [];
  list.add(MTopicModel(img: mCatAndroid, title: 'Android Dev'));
  list.add(MTopicModel(img: mCatSoftware, title: 'Software Engineering'));
  list.add(MTopicModel(img: mCatHealth, title: 'Health'));
  list.add(MTopicModel(img: mCatJava, title: 'JavaScript'));
  list.add(MTopicModel(img: mCatProductivity, title: 'Product Management'));
  list.add(MTopicModel(img: mCatArt, title: 'Art'));
  list.add(MTopicModel(img: mArtificial, title: 'Artificial Intelligence'));
  list.add(MTopicModel(img: mCatBook, title: 'Books'));
  list.add(MTopicModel(img: mCatBusiness, title: 'Business'));
  list.add(MTopicModel(img: mCatCreativity, title: 'Creativity'));
  list.add(MTopicModel(img: mCatCrypto, title: 'Crypto currency'));
  list.add(MTopicModel(img: mCatCulture, title: 'Culture'));
  list.add(MTopicModel(img: mCatDesign, title: 'Design'));
  list.add(MTopicModel(img: mCatEducation, title: 'Education'));
  list.add(MTopicModel(img: mCatFeminism, title: 'Feminism'));
  list.add(MTopicModel(img: mCatFood, title: 'Food'));
  list.add(MTopicModel(img: mCatIosDeveloper, title: 'iOS Developer'));
  list.add(MTopicModel(img: mCatMentalHealth, title: 'Mental Health'));
  list.add(MTopicModel(img: mCatProgramming, title: 'Programming'));
  list.add(MTopicModel(img: mCatPsychological, title: 'Psychological'));
  list.add(MTopicModel(img: mCatRelationship, title: 'Relationship'));
  list.add(MTopicModel(img: mCatScience, title: 'Science'));
  list.add(MTopicModel(img: mCatSocialMedia, title: 'Social Media'));
  list.add(MTopicModel(img: mCatTechnology, title: 'Technology'));
  list.add(MTopicModel(img: mCatTrueCrime, title: 'True Crime'));
  list.add(MTopicModel(img: mCatWorld, title: 'World'));
  return list;
}

List<MPeopleModel> getPeopleFlutterList() {
  List<MPeopleModel> list = [];
  list.add(MPeopleModel(img: mCatWorld, title: 'Florina Muntenescu', subTitle: 'Flutter Developer intern at Aeologics I Teach enthusiast ready to explore new technology'));
  list.add(MPeopleModel(img: mCatPsychological, title: 'BelDev', subTitle: 'Flutter content weekly, Articles often correspond with video postings found on youtube.'));
  list.add(MPeopleModel(img: mCatMentalHealth, title: 'Dr.Smith', subTitle: 'Google Developers Expert @Flutter,Mobile Developers, Public Speaker, Technical Blogger.'));
  return list;
}

List<MPeopleModel> getPublicationList() {
  List<MPeopleModel> list = [];
  list.add(MPeopleModel(img: mCatEducation, title: 'Florina Muntenescu', subTitle: 'Flutter Developer intern at Aeologics I Teach enthusiast ready to explore new technology'));
  list.add(MPeopleModel(img: mCatFeminism, title: 'BelDev', subTitle: 'Flutter content weekly, Articles often correspond with video postings found on youtube.'));
  list.add(MPeopleModel(img: mCatEducation, title: 'Dr.Smith', subTitle: 'Google Developers Expert @Flutter,Mobile Developers, Public Speaker, Technical Blogger.'));
  return list;
}

List<MPeopleModel> getPublicationPeopleList() {
  List<MPeopleModel> list = [];
  list.add(MPeopleModel(img: mCatSoftware, title: 'OneZero', subTitle: 'The undercurrents of the future A Medium publication about technology and people.'));
  list.add(MPeopleModel(img: mCatTechnology, title: 'Elemental', subTitle: 'Your life,sourced by science.A publication from Medium about health and wellness'));
  list.add(MPeopleModel(img: mCatBook, title: 'Human parts', subTitle: 'A Publication about humanity from Medium: yours,mine and ours.'));
  return list;
}

List<MPeopleModel> getPublicationPickList() {
  List<MPeopleModel> list = [];
  list.add(MPeopleModel(img: mCatArt, title: 'Dart', subTitle: 'Dart is a client-optimized language for fast apps on any platform. Learn more at https://dart.dev.'));
  list.add(MPeopleModel(img: mCatAndroid, title: 'Elemental', subTitle: 'Your life,sourced by science.A publication from Medium about health and wellness'));
  list.add(MPeopleModel(img: mCatHealth, title: 'Human parts', subTitle: 'A Publication about humanity from Medium: yours,mine and ours.'));
  return list;
}

List<MListModel> getAudioArticlesHorizontalList() {
  List<MListModel> list = [];
  list.add(MListModel(title: 'Login Page UI in Flutter', authName: 'Yogita Kumar', img: mCatFeminism, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: 'Flutter Layout Basics', authName: 'Thiranjaya Munasinghe', img: mCatProgramming, time: '5 min', date: '16 Aug 2018'));
  list.add(MListModel(title: 'Flutter Widgets-- A brief guide', authName: 'Prakash Donga', img: mCatPsychological, time: '3 min', date: '14 Jun'));
  return list;
}

List<MListModel> getAudioArticlesVerticalList() {
  List<MListModel> list = [];
  list.add(MListModel(title: 'Login Page UI in Flutter', subtitle: "This is the flutter ui and really great", authName: 'Yogita Kumar', img: mCatFeminism, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: 'Flutter Widgets-- A brief guide', subtitle: "In the flutter everything is widget", authName: 'Prakash Donga', img: mCatPsychological, time: '3 min', date: '14 Jun'));
  list.add(
      MListModel(title: 'Flutter Layout Basics', subtitle: "This is the flutter ui and really great", authName: 'Thiranjaya Munasinghe', img: mCatProgramming, time: '5 min', date: '16 Aug 2018'));
  list.add(MListModel(title: 'Login Page UI in Flutter', subtitle: "This is the flutter ui and really great", authName: 'Yogita Kumar', img: mCatFeminism, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: 'Flutter Widgets-- A brief guide', subtitle: "In the flutter everything is widget", authName: 'Prakash Donga', img: mCatPsychological, time: '3 min', date: '14 Jun'));
  list.add(
      MListModel(title: 'Flutter Layout Basics', subtitle: "This is the flutter ui and really great", authName: 'Thiranjaya Munasinghe', img: mCatProgramming, time: '5 min', date: '16 Aug 2018'));
  list.add(MListModel(title: 'Login Page UI in Flutter', subtitle: "This is the flutter ui and really great", authName: 'Yogita Kumar', img: mCatFeminism, time: '4 min', date: '22 Jan'));
  list.add(MListModel(title: 'Flutter Widgets-- A brief guide', subtitle: "In the flutter everything is widget", authName: 'Prakash Donga', img: mCatPsychological, time: '3 min', date: '14 Jun'));
  list.add(
      MListModel(title: 'Flutter Layout Basics', subtitle: "This is the flutter ui and really great", authName: 'Thiranjaya Munasinghe', img: mCatProgramming, time: '5 min', date: '16 Aug 2018'));
  return list;
}

List<MStoriesModel> getStoriesList() {
  List<MStoriesModel> list = [];
  list.add(MStoriesModel(title: "Hello", isDraft: true, time: "Edited 15 min ago"));
  list.add(MStoriesModel(title: "Flutter is used to develop mobile app", isDraft: true, time: "Edited 10 min ago"));
  list.add(MStoriesModel(title: "Everything is a widget", isPublic: true, time: "Edited 5 min ago"));
  list.add(MStoriesModel(title: "Dart is programming language", isPublic: true, time: "Edited 2 min ago"));
  list.add(MStoriesModel(title: "Flutter is a language", isDraft: true, time: "Edited 1 min ago"));
  return list;
}

List<MStoriesModel> getProfileListData() {
  List<MStoriesModel> list = [];
  list.add(MStoriesModel(title: "Hello", userName: "John", time: "Edited 15 min ago"));
  list.add(MStoriesModel(title: "Dart is programming language", userName: "Jugal", time: "Edited 2 min ago"));
  return list;
}

List<MSelectTopicModel> getSelectTopicList() {
  List<MSelectTopicModel> list = [];

  list.add((MSelectTopicModel(topicName: "Art")));
  list.add((MSelectTopicModel(topicName: "World")));
  list.add((MSelectTopicModel(topicName: "Humor")));
  list.add((MSelectTopicModel(topicName: "Creativity")));
  list.add((MSelectTopicModel(topicName: "Leadership")));
  list.add((MSelectTopicModel(topicName: "History")));
  list.add((MSelectTopicModel(topicName: "CoronaVirus")));
  list.add((MSelectTopicModel(topicName: "Money")));
  list.add((MSelectTopicModel(topicName: "Sports")));
  list.add((MSelectTopicModel(topicName: "Books")));
  list.add((MSelectTopicModel(topicName: "Cities")));
  list.add((MSelectTopicModel(topicName: "Software Engineering")));
  list.add((MSelectTopicModel(topicName: "Product Management")));
  list.add((MSelectTopicModel(topicName: "JavaScript")));
  list.add((MSelectTopicModel(topicName: "Gaming")));
  list.add((MSelectTopicModel(topicName: "Society")));
  list.add((MSelectTopicModel(topicName: "Design")));
  list.add((MSelectTopicModel(topicName: "Writing")));
  list.add((MSelectTopicModel(topicName: "UX")));
  list.add((MSelectTopicModel(topicName: "Comics")));
  list.add((MSelectTopicModel(topicName: "Race")));
  list.add((MSelectTopicModel(topicName: "Outdoors")));
  list.add((MSelectTopicModel(topicName: "Film")));
  list.add((MSelectTopicModel(topicName: "Language")));
  list.add((MSelectTopicModel(topicName: "Health")));
  list.add((MSelectTopicModel(topicName: "Economy")));
  list.add((MSelectTopicModel(topicName: "Android Dev")));
  list.add((MSelectTopicModel(topicName: "Science")));
  list.add((MSelectTopicModel(topicName: "Self")));
  list.add((MSelectTopicModel(topicName: "Sexuality")));
  list.add((MSelectTopicModel(topicName: "politics")));
  list.add((MSelectTopicModel(topicName: "Cultural")));
  list.add((MSelectTopicModel(topicName: "Gun Control")));
  list.add((MSelectTopicModel(topicName: "Gadgets")));
  list.add((MSelectTopicModel(topicName: "Transportation")));
  list.add((MSelectTopicModel(topicName: "Justice")));

  return list;
}
