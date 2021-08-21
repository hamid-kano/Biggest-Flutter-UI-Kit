import 'package:prokit_flutter/fullApps/social/model/SocialModel.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';

List<SocialUser> addChatData() {
  List<SocialUser> mList = [];
  SocialUser model1 = SocialUser();
  model1.name = "Logan Nesser";
  model1.duration = "7.30 PM";
  model1.info = "Hy, How are your?";
  model1.image = social_ic_user1;

  SocialUser model2 = SocialUser();
  model2.name = "Logan Nesser";
  model2.duration = "5.30 PM";
  model2.info = "Hi.When you meet?";
  model2.image = social_ic_user2;

  SocialUser model3 = SocialUser();
  model3.name = "Logan Nesser";
  model3.duration = "2.30 PM";
  model3.info = "See you in LA!";
  model3.image = social_ic_user3;

  mList.add(model1);
  mList.add(model2);
  mList.add(model3);
  return mList;
}

List<SocialUser> addGroupData() {
  List<SocialUser> mList = [];
  SocialUser model1 = SocialUser();
  model1.name = "AI & Mechanism";
  model1.duration = "7.30 PM";
  model1.info = "Albert Dune: Hy,Everyone";
  model1.image = social_ic_item1;

  SocialUser model2 = SocialUser();
  model2.name = "Weight Loss";
  model2.duration = "5.30 PM";
  model2.info = "David Thomas: Haha! ";
  model2.image = social_ic_item2;

  SocialUser model3 = SocialUser();
  model3.name = "Trip";
  model3.duration = "2.30 PM";
  model3.info = "Albert Dune: See you ";
  model3.image = social_ic_item3;
  mList.add(model1);
  mList.add(model2);
  mList.add(model3);
  return mList;
}

List<SocialUser> addSeeMoreData() {
  List<SocialUser> mList = [];
  SocialUser model1 = SocialUser();
  model1.name = "Logan Nesser";
  model1.duration = "7.30 PM";
  model1.info = "Hy, How are your?";
  model1.image = social_ic_user1;

  SocialUser model2 = SocialUser();
  model2.name = "AI & Mechanism";
  model2.duration = "5.30 PM";
  model2.info = "David Thomas: Haha! You are a great..When you meet?";
  model2.image = social_ic_item1;

  SocialUser model3 = SocialUser();
  model3.name = "Logan Nesser";
  model3.duration = "2.30 PM";
  model3.info = "Haha! You are a great..When you meet?";
  model3.image = social_ic_user2;

  SocialUser model4 = SocialUser();
  model4.name = "Logan Nesser";
  model4.duration = "2.30 PM";
  model4.info = "See you in LA!";
  model4.image = social_ic_user3;

  SocialUser model5 = SocialUser();
  model5.name = "Weight Loss";
  model5.duration = "2.30 PM";
  model5.info = "David Thomas: Haha! You are a great..When you meet?";
  model5.image = social_ic_item2;

  SocialUser model6 = SocialUser();
  model6.name = "Trip";
  model6.duration = "2.30 PM";
  model6.info = "Albert Dune: See you in LA!";
  model6.image = social_ic_item3;
  mList.add(model1);
  mList.add(model2);
  mList.add(model3);
  mList.add(model4);
  mList.add(model5);
  mList.add(model6);
  return mList;
}

List<SocialUser> addStatusData() {
  List<SocialUser> mList = [];
  SocialUser model1 = SocialUser();
  model1.name = "Logan Nesser";
  model1.duration = "7.30 PM";
  model1.info = "30 minutes ago";
  model1.image = social_ic_user4;

  SocialUser model2 = SocialUser();
  model2.name = "Logan Nesser";
  model2.duration = "5.30 PM";
  model2.info = "Today,8:30 PM";
  model2.image = social_ic_user2;

  SocialUser model3 = SocialUser();
  model3.name = "Logan Nesser";
  model3.duration = "2.30 PM";
  model3.info = "Today,8:30 PM";
  model3.image = social_ic_user3;

  mList.add(model1);
  mList.add(model2);
  mList.add(model3);
  return mList;
}

List<SocialUser> addCallData() {
  List<SocialUser> mList = [];
  SocialUser model1 = SocialUser();
  model1.name = "Logan Nesser";
  model1.duration = "7.30 PM";
  model1.info = "(2) 15 december, 1:52 pm";
  model1.image = social_ic_user1;
  model1.call = 1;

  SocialUser model2 = SocialUser();
  model2.name = "Logan Nesser";
  model2.duration = "5.30 PM";
  model2.info = "13 december, 7:52 pm";
  model2.image = social_ic_user2;
  model2.call = 2;

  SocialUser model3 = SocialUser();
  model3.name = "Logan Nesser";
  model3.duration = "2.30 PM";
  model3.info = "(3) 15 April, 1:52 pm";
  model3.image = social_ic_user3;
  model3.call = 3;

  mList.add(model1);
  mList.add(model2);
  mList.add(model3);
  return mList;
}

List<SocialUser> addGroupCallData() {
  List<SocialUser> mList = [];
  SocialUser model1 = SocialUser();
  model1.name = "Logan Nesser";
  model1.duration = "7.30 PM";
  model1.info = "(2) 15 december, 1:52 pm";
  model1.image = social_ic_item1;
  model1.call = 3;

  SocialUser model2 = SocialUser();
  model2.name = "Logan Nesser";
  model2.duration = "5.30 PM";
  model2.info = "13 december, 7:52 pm";
  model2.image = social_ic_item2;
  model2.call = 1;

  mList.add(model1);
  mList.add(model2);
  return mList;
}

List<Media> addMediaData() {
  List<Media> mList = [];
  mList.add(Media(social_ic_item1));
  mList.add(Media(social_ic_item2));
  mList.add(Media(social_ic_item3));
  mList.add(Media(social_ic_item4));
  mList.add(Media(social_ic_item5));
  mList.add(Media(social_ic_item6));
  mList.add(Media(social_ic_item4));
  mList.add(Media(social_ic_item1));
  mList.add(Media(social_ic_item2));
  mList.add(Media(social_ic_item5));
  mList.add(Media(social_ic_item6));
  mList.add(Media(social_ic_item1));
  return mList;
}

//}
List<Qr> addQrData() {
  List<Qr> mList = [];
  mList.add(Qr(3005));
  mList.add(Qr(3025));
  mList.add(Qr(2408));
  mList.add(Qr(2709));
  mList.add(Qr(3708));
  mList.add(Qr(2458));
  mList.add(Qr(1809));
  mList.add(Qr(6757));
  mList.add(Qr(5247));
  mList.add(Qr(5253));
  mList.add(Qr(5224));
  mList.add(Qr(9642));
  mList.add(Qr(4836));
  mList.add(Qr(7346));
  mList.add(Qr(6972));
  mList.add(Qr(7545));
  mList.add(Qr(5876));
  mList.add(Qr(6988));
  mList.add(Qr(8752));
  return mList;
}

List<Chat> getUserChats() {
  List<Chat> mList = [];
  Chat model1 = Chat();
  model1.msg = "Hi John, how are you";
  model1.duration = "7.30 PM";
  model1.type = "Message";
  model1.isSender = true;

  Chat model2 = Chat();
  model2.msg = "Hi Matloob, I m fine";
  model2.type = "Message";
  model2.duration = "7.30 PM";

  Chat model5 = Chat();
  model5.msg = "Hii";
  model5.duration = "7.30 PM";
  model5.type = "Message";
  model5.isSender = true;

  Chat model4 = Chat();
  model4.type = "sa";
  mList.add(model1);
  mList.add(model5);
  mList.add(model2);
  mList.add(model4);
  return mList;
}
