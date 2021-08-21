import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

List<SubscriptionModel> getSubscriptionList() {
  List<SubscriptionModel> subscriptionList = [];
  subscriptionList.add(
    SubscriptionModel(name: 'platinum', img: t14_KingIcon, price: 15000, backgroundColor: t14_colorPink, bannerColor: t14_colorCream),
  );
  subscriptionList.add(
    SubscriptionModel(name: 'Gold', img: t14_KingIcon, price: 10000, backgroundColor: t14_colorLightBlue, bannerColor: t14_colorSkyBlue),
  );
  subscriptionList.add(
    SubscriptionModel(name: 'platinum', img: t14_KingIcon, price: 60000, backgroundColor: t14_colorLightGreen, bannerColor: t14_colorBlue),
  );
  return subscriptionList;
}

List<SubscriptionModel> getTopTravelList() {
  List<SubscriptionModel> topTravelList = [];
  topTravelList.add(SubscriptionModel(name: 'Great Wall of China', img: t14_travel1));
  topTravelList.add(SubscriptionModel(name: 'Angkor Wat, Cambodia', img: t14_travel2));
  topTravelList.add(SubscriptionModel(name: 'Kyiv ,Ukraine', img: t14_travel3));
  topTravelList.add(SubscriptionModel(name: 'Keoladeo National Park', img: t14_travel4));
  topTravelList.add(SubscriptionModel(name: 'Easter Island', img: t14_travel5));
  topTravelList.add(SubscriptionModel(name: 'Machu Picchu, Peru', img: t14_travel6));
  topTravelList.add(SubscriptionModel(name: 'Petra, Jordan', img: t14_travel7));
  topTravelList.add(SubscriptionModel(name: 'Stonehenge, England', img: t14_travel8));

  return topTravelList;
}

List<SubscriptionModel> getRecommendList() {
  List<SubscriptionModel> recommendList = [];
  recommendList.add(
    SubscriptionModel(name: 'England', img: t14_travel9),
  );
  recommendList.add(
    SubscriptionModel(name: 'Cambodia', img: t14_travel10),
  );
  recommendList.add(
    SubscriptionModel(name: 'Ukraine', img: t14_travel2),
  );
  recommendList.add(
    SubscriptionModel(name: 'USA', img: t14_travel4),
  );
  recommendList.add(
    SubscriptionModel(name: 'Island', img: t14_travel6),
  );
  recommendList.add(
    SubscriptionModel(name: 'Peru', img: t14_travel6),
  );
  recommendList.add(
    SubscriptionModel(name: 'Jordan', img: t14_travel1),
  );
  recommendList.add(
    SubscriptionModel(name: 'Tokyo', img: t14_travel3),
  );

  return recommendList;
}

List<SubscriptionModel> getTravelStoryList() {
  List<SubscriptionModel> travelStoryList = [];

  travelStoryList.add(SubscriptionModel(img: t14_profile1));
  travelStoryList.add(SubscriptionModel(img: t14_profile2));
  travelStoryList.add(SubscriptionModel(img: t14_profile3));
  travelStoryList.add(SubscriptionModel(img: t14_profile4));
  travelStoryList.add(SubscriptionModel(img: t14_profile5));
  travelStoryList.add(SubscriptionModel(img: t14_profile2));
  travelStoryList.add(SubscriptionModel(img: t14_profile4));
  travelStoryList.add(SubscriptionModel(img: t14_profile1));
  travelStoryList.add(SubscriptionModel(img: t14_profile3));
  travelStoryList.add(SubscriptionModel(img: t14_profile5));
  return travelStoryList;
}

List<SubscriptionModel> getTravelStoryDetailList() {
  List<SubscriptionModel> travelStoryDetailList = [];

  travelStoryDetailList.add(SubscriptionModel(img: t14_travel1, name: 'David Steward', userImg: t14_profile1));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel3, name: 'Burton Armstron', userImg: t14_profile3));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel5, name: 'Edwards Roberts', userImg: t14_profile5));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel7, name: 'David Steward', userImg: t14_profile2));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel9, name: 'Jenkins Lawrence', userImg: t14_profile4));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel2, name: 'Lawrence Jones', userImg: t14_profile1));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel4, name: 'Graham Murphy', userImg: t14_profile3));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel6, name: 'Burton Armstrong', userImg: t14_profile5));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel8, name: 'Cole Walsh', userImg: t14_profile2));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel10, name: 'Carter Yates', userImg: t14_profile1));
  return travelStoryDetailList;
}

List<SubscriptionModel> getMostPopularList() {
  List<SubscriptionModel> mostPopular = [];
  mostPopular.add(
    SubscriptionModel(country: 'England', img: t14_travel1, name: 'Great Wall of Chin'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'Cambodia', img: t14_travel2, name: 'Angkor Wat, Cambodia'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'Ukraine', img: t14_travel3, name: 'Kyiv ,Ukraine'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'USA', img: t14_travel4, name: 'Keoladeo National Park'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'Island', img: t14_travel5, name: 'Easter Island'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'Peru', img: t14_travel6, name: 'Machu Picchu, Peru'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'Jordan', img: t14_travel7, name: 'Petra, Jordan'),
  );
  mostPopular.add(
    SubscriptionModel(country: 'Tokyo', img: t14_travel8, name: 'Stonehenge, England'),
  );

  return mostPopular;
}

List<SubscriptionModel> getTravel3StoryDetailList() {
  List<SubscriptionModel> travelStoryDetailList = [];

  travelStoryDetailList.add(SubscriptionModel(img: t14_travel2, name: 'David Steward', userImg: t14_profile1, country: 'England'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel4, name: 'Burton Armstrong', userImg: t14_profile2, country: 'Cambodia'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel6, name: 'Carter Yates', userImg: t14_profile3, country: 'Ukraine'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel8, name: 'Cole Walsh', userImg: t14_profile4, country: 'USA'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel10, name: 'Davies Taylor', userImg: t14_profile5, country: 'Island'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel2, name: 'Edwards Roberts', userImg: t14_profile1, country: 'Peru'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel1, name: 'Fletcher Jenkins', userImg: t14_profile2, country: 'Jordan'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel3, name: 'Graham Murphy', userImg: t14_profile4, country: 'Tokyo'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel5, name: 'Jenkins Lawrence', userImg: t14_profile5, country: 'England'));
  travelStoryDetailList.add(SubscriptionModel(img: t14_travel7, name: 'Lawrence Jones', userImg: t14_profile4, country: 'Cambodia'));
  return travelStoryDetailList;
}

List<TravelModel> getTravelList() {
  List<TravelModel> travelList = [];
  travelList.add(
    TravelModel(
      img: t14_profile2,
      name: 'Burton Armstrong',
      lastSeen: '10 min ago',
      placeImg: t14_travel1,
      totalLike: 35,
      placeName: 'Angkor Wat ',
      placeDescription: t14_txt_Travel_Detail_Des,
      totalComment: 56,
    ),
  );
  travelList.add(
    TravelModel(
      img: t14_profile3,
      name: 'David Steward',
      lastSeen: '40 min ago',
      placeImg: t14_travel3,
      totalLike: 12,
      placeName: 'Machu Picchu ',
      placeDescription: t14_txt_Travel_Detail_Des,
      totalComment: 44,
    ),
  );
  travelList.add(
    TravelModel(
      img: t14_profile5,
      name: 'Graham Murphy',
      lastSeen: '25 min ago',
      placeImg: t14_travel5,
      totalLike: 80,
      placeName: 'Stonehenge ',
      placeDescription: t14_txt_Travel_Detail_Des,
      totalComment: 100,
    ),
  );
  travelList.add(
    TravelModel(
      img: t14_profile2,
      name: 'David Steward',
      lastSeen: '47 min ago',
      placeImg: t14_travel7,
      totalLike: 100,
      placeName: 'Wall of China ',
      placeDescription: t14_txt_Travel_Detail_Des,
      totalComment: 55,
    ),
  );
  travelList.add(
    TravelModel(
      img: t14_profile4,
      name: 'Fletcher Jenkins',
      lastSeen: '55 min ago',
      placeImg: t14_travel10,
      totalLike: 70,
      placeName: 'Easter Island ',
      placeDescription: t14_txt_Travel_Detail_Des,
      totalComment: 30,
    ),
  );
  return travelList;
}

List<CheckBoxTextModel> getCheckBoxTxtList() {
  List<CheckBoxTextModel> checkBoxTxtList = [];
  checkBoxTxtList.add(CheckBoxTextModel(name: 'Unlock Over 30 courses'));
  checkBoxTxtList.add(CheckBoxTextModel(name: 'Unlock Over 30 education video'));
  checkBoxTxtList.add(CheckBoxTextModel(name: 'View more than 1000 tips'));
  return checkBoxTxtList;
}

List<CheckBoxTextModel> getSubscription4CheckBoxTxtList() {
  List<CheckBoxTextModel> subscription4checkBoxTxtList = [];
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Sentiment analyze and score'));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Highlights report'));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Data history'));
  return subscription4checkBoxTxtList;
}

List<ChoosePlanModel> getChoosePlanList() {
  List<ChoosePlanModel> choosePlanList = [];
  choosePlanList.add(ChoosePlanModel(title: 'Free', subTitle: '7 days'));
  choosePlanList.add(ChoosePlanModel(title: '\$ 8', subTitle: '30 days'));
  choosePlanList.add(ChoosePlanModel(title: '\$ 14', subTitle: '3 monthes'));
  choosePlanList.add(ChoosePlanModel(title: '\$ 199', subTitle: 'one time'));

  return choosePlanList;
}

List<ChoosePlanModel> getSelectDayList() {
  List<ChoosePlanModel> selectDayList = [];
  selectDayList.add(ChoosePlanModel(title: 'Day'));
  selectDayList.add(ChoosePlanModel(title: 'Week'));
  selectDayList.add(ChoosePlanModel(title: 'Month'));
  selectDayList.add(ChoosePlanModel(title: 'Yearly'));

  return selectDayList;
}

List<ChoosePlanModel> getSubscription4ChoosePlanList() {
  List<ChoosePlanModel> subscription4choosePlanList = [];
  subscription4choosePlanList.add(ChoosePlanModel(title: 'Monthly', subTitle: '4,99\$ /month'));
  subscription4choosePlanList.add(ChoosePlanModel(title: 'Annual', subTitle: '2,99\$ /month'));
  subscription4choosePlanList.add(ChoosePlanModel(title: 'Free Trial', subTitle: '7 free days '));

  return subscription4choosePlanList;
}

List<ChoosePlanModel> getSubscription5ChoosePlanList() {
  List<ChoosePlanModel> subscription5choosePlanList = [];
  subscription5choosePlanList.add(ChoosePlanModel(title: 'Monthly', subTitle: '4,99\$ /month'));
  subscription5choosePlanList.add(ChoosePlanModel(title: 'Annual', subTitle: '2,99\$ /month'));
  subscription5choosePlanList.add(ChoosePlanModel(title: 'Free Trial', subTitle: '7 free days '));

  return subscription5choosePlanList;
}

List<ChoosePlanModel> getSubscription7DiscountList() {
  List<ChoosePlanModel> subscription5choosePlanList = [];
  subscription5choosePlanList.add(ChoosePlanModel(title: 'Higher yields', subTitle: 'up to 6%'));
  subscription5choosePlanList.add(ChoosePlanModel(title: 'More Case Backs', subTitle: 'up to 2%'));

  return subscription5choosePlanList;
}

List<MessageListModel> getUserList() {
  List<MessageListModel> userList = [];
  userList.add(MessageListModel(img: t14_profile1, name: 'Fletcher', isActive: true));
  userList.add(MessageListModel(img: t14_profile2, name: 'Jenkins', isActive: false));
  userList.add(MessageListModel(img: t14_profile3, name: 'David', isActive: true));
  userList.add(MessageListModel(img: t14_profile4, name: 'Graham', isActive: false));
  userList.add(MessageListModel(img: t14_profile5, name: 'Edwards', isActive: true));
  userList.add(MessageListModel(img: t14_profile1, name: 'Burton', isActive: true));
  userList.add(MessageListModel(img: t14_profile3, name: 'Fletcher', isActive: false));
  userList.add(MessageListModel(img: t14_profile5, name: 'Edwards', isActive: true));
  return userList;
}

List<MessageListModel> getTransactionList() {
  List<MessageListModel> transactionList = [];
  transactionList.add(MessageListModel(img: '22.07', name: 'Remittance', message: '+\$20,000.00', isActive: true));
  transactionList.add(MessageListModel(img: '12.09', name: 'Utility costs', message: '-\$2,622.00', isActive: false));
  transactionList.add(MessageListModel(img: '54.10', name: 'Subsciptions', message: '+\$20,000.00', isActive: true));
  transactionList.add(MessageListModel(img: '65.12', name: 'payroll', message: '+\$203,000.00', isActive: true));
  transactionList.add(MessageListModel(img: '45.04', name: 'Purchase of equipment', message: '-\$20,255.00', isActive: false));
  transactionList.add(MessageListModel(img: '12.16', name: 'Utility costs', message: '+\$10,500.00', isActive: true));
  transactionList.add(MessageListModel(img: '55.14', name: 'Remittance', message: '+\$20,000.00', isActive: false));
  transactionList.add(MessageListModel(img: '85.15', name: 'Subsciptions', message: '-\$08,080.00', isActive: true));
  transactionList.add(MessageListModel(img: '55.18', name: 'Remittance', message: '+\$20,000.00', isActive: true));
  transactionList.add(MessageListModel(img: '16.20', name: 'Purchase of equipment', message: '-\$11,000.00', isActive: false));

  return transactionList;
}

List<MessageListModel> getMonthViseTransactionList() {
  List<MessageListModel> monthViseTransactionList = [];
  monthViseTransactionList.add(MessageListModel(img: 'January', name: '23 transaction', message: '+\$20,000.00', isActive: false));
  monthViseTransactionList.add(MessageListModel(img: 'February', name: '50 transaction', message: '-\$2,622.00', isActive: true));
  monthViseTransactionList.add(MessageListModel(img: 'March', name: '11 transaction', message: '+\$20,000.00', isActive: false));
  monthViseTransactionList.add(MessageListModel(img: 'April', name: '22 transaction', message: '+\$203,000.00', isActive: false));
  monthViseTransactionList.add(MessageListModel(img: 'May', name: '18 transaction', message: '-\$20,255.00', isActive: true));
  monthViseTransactionList.add(MessageListModel(img: 'May', name: '66 transaction', message: '+\$10,500.00', isActive: false));
  monthViseTransactionList.add(MessageListModel(img: 'June', name: '44 transaction', message: '+\$20,000.00', isActive: false));
  monthViseTransactionList.add(MessageListModel(img: 'July', name: '27 transaction', message: '-\$08,080.00', isActive: true));
  monthViseTransactionList.add(MessageListModel(img: 'August', name: '32 transaction', message: '+\$20,000.00', isActive: true));
  monthViseTransactionList.add(MessageListModel(img: 'September', name: '46 transaction', message: '-\$11,000.00', isActive: true));

  return monthViseTransactionList;
}

List<MessageListModel> getAtmCardList() {
  List<MessageListModel> atmCardList = [];
  atmCardList.add(MessageListModel(img: t14_visa, name: '2155', isActive: true));
  atmCardList.add(MessageListModel(img: t14_visa, name: '6578', isActive: false));
  atmCardList.add(MessageListModel(img: t14_visa, name: '7812', isActive: true));
  atmCardList.add(MessageListModel(img: t14_visa, name: '1456', isActive: true));
  atmCardList.add(MessageListModel(img: t14_visa, name: '9823', isActive: false));
  atmCardList.add(MessageListModel(img: t14_visa, name: '1023', isActive: true));
  atmCardList.add(MessageListModel(img: t14_visa, name: '0325', isActive: false));
  atmCardList.add(MessageListModel(img: t14_visa, name: '7700', isActive: true));
  atmCardList.add(MessageListModel(img: t14_visa, name: '0799', isActive: true));
  atmCardList.add(MessageListModel(img: t14_visa, name: '1289', isActive: false));

  return atmCardList;
}

List<CheckBoxTextModel> getFinance1CheckBoxTxtList() {
  List<CheckBoxTextModel> subscription4checkBoxTxtList = [];
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Fletcher Jenkins', img: t14_profile1));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'David Steward', img: t14_profile2));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Graham Murphy', img: t14_profile3));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Burton Armstrong', img: t14_profile4));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Edwards Roberts', img: t14_profile5));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Jenkins Lawrence', img: t14_profile1));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Graham Murphy', img: t14_profile3));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Fletcher Jenkins', img: t14_profile5));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'David Steward', img: t14_profile2));
  subscription4checkBoxTxtList.add(CheckBoxTextModel(name: 'Burton Armstrong', img: t14_profile4));

  return subscription4checkBoxTxtList;
}

List<MessageListModel> getMessageCountList() {
  List<MessageListModel> messageCountList = [];

  messageCountList.add(
    MessageListModel(img: t14_profile1, name: 'Fletcher Jenkins', message: 'I like these sweet morning of', lastSeen: "3", isActive: true),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile2, name: 'David Steward', message: 'I am alone feel the good', lastSeen: "1", isActive: false),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile3, name: 'Graham Murphy', message: 'I enjoy with whole heart', lastSeen: "6", isActive: true),
  );

  messageCountList.add(
    MessageListModel(img: t14_profile4, name: 'Burton Armstrong', message: 'I am so happy', lastSeen: "10", isActive: true),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile5, name: 'Edwards Roberts', message: 'my dear friends', lastSeen: "5", isActive: false),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile2, name: 'Jenkins Lawrence', message: 'I enjoy with whole heart', lastSeen: "13", isActive: false),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile4, name: 'Graham Murphy', message: 'I like these sweet morning of', lastSeen: "5", isActive: true),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile1, name: 'David Steward', message: 'I enjoy with whole heart', lastSeen: "7", isActive: false),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile3, name: 'Fletcher Jenkins', message: 'I am alone feel the good', lastSeen: "18", isActive: true),
  );
  messageCountList.add(
    MessageListModel(img: t14_profile5, name: 'Jenkins Lawrence', message: 'I am so happy', lastSeen: "22", isActive: true),
  );

  return messageCountList;
}

List<MessageListModel> getMessageList() {
  List<MessageListModel> messageList = [];
  messageList.add(
    MessageListModel(img: t14_profile1, name: 'Fletcher Jenkins', message: 'I like these sweet morning of', lastSeen: "12:10", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile2, name: 'David Steward', message: 'I am alone feel the good', lastSeen: "Yesterday", isActive: false),
  );
  messageList.add(
    MessageListModel(img: t14_profile3, name: 'Graham Murphy', message: 'I enjoy with whole heart', lastSeen: "06:55", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile4, name: 'Burton Armstrong', message: 'I am so happy', lastSeen: "Today", isActive: false),
  );
  messageList.add(
    MessageListModel(img: t14_profile5, name: 'Edwards Roberts', message: 'my dear friends', lastSeen: "10:17", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile5, name: 'Edwards Roberts', message: 'I like these sweet morning of', lastSeen: "10:17", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile4, name: 'Fletcher Jenkins', message: 'I am so happy', lastSeen: "05:22", isActive: false),
  );

  messageList.add(
    MessageListModel(img: t14_profile1, name: 'Fletcher Jenkins', message: 'I like these sweet morning of', lastSeen: "12:10", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile2, name: 'David Steward', message: 'I enjoy with whole heart', lastSeen: "Yesterday", isActive: false),
  );
  messageList.add(
    MessageListModel(img: t14_profile3, name: 'Graham Murphy', message: 'My dear friends', lastSeen: "06:55", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile4, name: 'Burton Armstrong', message: 'I am alone feel the good', lastSeen: "Today", isActive: false),
  );
  messageList.add(
    MessageListModel(img: t14_profile5, name: 'Edwards Roberts', message: 'I enjoy with whole heart', lastSeen: "10:17", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile2, name: 'Jenkins Lawrence', message: 'My dear friend', lastSeen: "Yesterday", isActive: true),
  );
  messageList.add(
    MessageListModel(img: t14_profile4, name: 'Fletcher Jenkins', message: 'I am so happy', lastSeen: "05:22", isActive: false),
  );

  return messageList;
}

List<BHMessageModel> getChatMsgData() {
  List<BHMessageModel> list = [];

  BHMessageModel c1 = BHMessageModel();
  c1.senderId = BHSender_id;
  c1.receiverId = BHReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  BHMessageModel c2 = BHMessageModel();
  c2.senderId = BHSender_id;
  c2.receiverId = BHReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  BHMessageModel c3 = BHMessageModel();
  c3.senderId = BHReceiver_id;
  c3.receiverId = BHSender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  BHMessageModel c4 = BHMessageModel();
  c4.senderId = BHSender_id;
  c4.receiverId = BHReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  BHMessageModel c5 = BHMessageModel();
  c5.senderId = BHSender_id;
  c5.receiverId = BHReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  BHMessageModel c6 = BHMessageModel();
  c6.senderId = BHReceiver_id;
  c6.receiverId = BHSender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  BHMessageModel c7 = BHMessageModel();
  c7.senderId = BHSender_id;
  c7.receiverId = BHReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  BHMessageModel c8 = BHMessageModel();
  c8.senderId = BHReceiver_id;
  c8.receiverId = BHSender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  BHMessageModel c9 = BHMessageModel();
  c9.senderId = BHSender_id;
  c9.receiverId = BHReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  BHMessageModel c10 = BHMessageModel();
  c10.senderId = BHReceiver_id;
  c10.receiverId = BHSender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  BHMessageModel c11 = BHMessageModel();
  c11.senderId = BHReceiver_id;
  c11.receiverId = BHSender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  BHMessageModel c12 = BHMessageModel();
  c12.senderId = BHSender_id;
  c12.receiverId = BHReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  BHMessageModel c13 = BHMessageModel();
  c13.senderId = BHSender_id;
  c13.receiverId = BHReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  BHMessageModel c14 = BHMessageModel();
  c14.senderId = BHReceiver_id;
  c14.receiverId = BHSender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  BHMessageModel c15 = BHMessageModel();
  c15.senderId = BHSender_id;
  c15.receiverId = BHReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  BHMessageModel c16 = BHMessageModel();
  c16.senderId = BHReceiver_id;
  c16.receiverId = BHSender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  BHMessageModel c17 = BHMessageModel();
  c17.senderId = BHSender_id;
  c17.receiverId = BHReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  BHMessageModel c18 = BHMessageModel();
  c18.senderId = BHReceiver_id;
  c18.receiverId = BHSender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<SpendingModel> getSpendingList() {
  List<SpendingModel> spendingList = [];
  spendingList.add(SpendingModel(color: t14_finance3_spending1, icon: MaterialCommunityIcons.food, name: 'Food & Bav.', rate: '\$8'));
  spendingList.add(SpendingModel(color: t14_TextField_BgColor, icon: FontAwesome.shopping_cart, name: 'Shopping', rate: '\$56'));
  spendingList.add(SpendingModel(color: t14_OppsColor, icon: MaterialCommunityIcons.ticket_confirmation, name: 'Subscription', rate: '\$12'));
  spendingList.add(SpendingModel(color: t14_SuccessBgColor1, icon: Foundation.dollar_bill, name: 'Bills', rate: '\$25'));
  spendingList.add(SpendingModel(color: t14_colorCream, icon: Icons.wallet_travel, name: 'Travelling', rate: '\$30'));
  spendingList.add(SpendingModel(color: t14_txt_trasactionColor, icon: Entypo.dots_three_horizontal, name: 'Other', rate: '\$40'));

  return spendingList;
}

List<CardTransactionModel> getCardTransactionList() {
  List<CardTransactionModel> cardTransactionList = [];
  cardTransactionList.add(CardTransactionModel(
    color: t14_finance3_spending1,
    icon: Icons.emoji_transportation_outlined,
    transactionType: 'Transportation',
    totalTransaction: '26 Transactions',
    offer: ' 24% of budget',
    rate: '\$8',
    percentage: 0.5,
  ));
  cardTransactionList.add(CardTransactionModel(
    color: t14_TextField_BgColor,
    icon: FontAwesome.shopping_cart,
    transactionType: 'Shopping',
    totalTransaction: '40 Transactions',
    offer: ' 28% of budget',
    rate: '\$1500',
    percentage: 0.3,
  ));
  cardTransactionList.add(CardTransactionModel(
    color: t14_OppsColor,
    icon: MaterialCommunityIcons.ticket_confirmation,
    transactionType: 'Travelling',
    totalTransaction: '26 Transactions',
    offer: ' 31% of budget',
    rate: '\$250',
    percentage: 0.7,
  ));
  cardTransactionList.add(CardTransactionModel(
    color: t14_SuccessBgColor1,
    icon: Foundation.dollar_bill,
    transactionType: 'Entertainment',
    totalTransaction: '14 Transactions',
    offer: ' 45% of budget',
    rate: '\$860',
    percentage: 0.9,
  ));
  cardTransactionList.add(CardTransactionModel(
    color: t14_colorCream,
    icon: Icons.sports_cricket,
    transactionType: 'Sports',
    totalTransaction: '66 Transactions',
    offer: ' 55% of budget',
    rate: '\$920',
    percentage: 0.3,
  ));

  cardTransactionList.add(CardTransactionModel(
    color: t14_txt_trasactionColor,
    icon: Entypo.book,
    transactionType: 'Reading',
    totalTransaction: '42 Transactions',
    offer: ' 35% of budget',
    rate: '\$920',
    percentage: 0.6,
  ));

  return cardTransactionList;
}
