import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAChangePasswordScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DALocationScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DANotificationScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAConstants.dart';

List<DatingAppModel> getInterests() {
  List<DatingAppModel> list = [];
  list.add(DatingAppModel(name: 'Movies'));
  list.add(DatingAppModel(name: 'Cooking'));
  list.add(DatingAppModel(name: 'Design'));
  list.add(DatingAppModel(name: 'Gambling'));
  list.add(DatingAppModel(name: 'Video Games'));
  list.add(DatingAppModel(name: 'Book Nerd'));
  list.add(DatingAppModel(name: 'Booting'));
  list.add(DatingAppModel(name: 'Athlete'));
  list.add(DatingAppModel(name: 'Technology'));
  list.add(DatingAppModel(name: 'Shopping'));
  list.add(DatingAppModel(name: 'Swimming'));
  list.add(DatingAppModel(name: 'Art'));
  list.add(DatingAppModel(name: 'Video graPhy'));
  list.add(DatingAppModel(name: 'Music Enthusiast'));

  return list;
}

List<DatingAppModel> getSettingData() {
  List<DatingAppModel> list = [];
  list.add(DatingAppModel(name: 'Edit your profile'));
  list.add(DatingAppModel(name: 'Change your password', widget: DAChangePasswordScreen()));
  list.add(DatingAppModel(name: 'Change your location', widget: DALocationScreen()));
  list.add(DatingAppModel(name: 'Notifications', widget: DANotificationScreen()));

  return list;
}

List<DatingAppModel> getNotificationList() {
  List<DatingAppModel> list = [];
  list.add(DatingAppModel(name: 'All Notifications', mISCheck: true));
  list.add(DatingAppModel(name: 'Message Notification', mISCheck: false));
  list.add(DatingAppModel(name: 'Match Notification', mISCheck: false));
  list.add(DatingAppModel(name: 'Receive Notification by Mail', mISCheck: false));
  list.add(DatingAppModel(name: 'Receive Notification by SMS', mISCheck: false));

  return list;
}

List<DatingAppModel> getIdealList() {
  List<DatingAppModel> list = [];
  list.add(DatingAppModel(name: 'Love', widget: Icon(Icons.favorite_border, color: white), color: redColor.withOpacity(0.7)));
  list.add(DatingAppModel(name: 'Friend', widget: Icon(Icons.person_outline, color: white), color: royalBlue.withOpacity(0.7)));
  list.add(DatingAppModel(name: 'Fling', widget: Icon(Icons.flip_camera_ios_outlined, color: white), color: mediumTurquoise.withOpacity(0.7)));
  list.add(DatingAppModel(name: 'Business', widget: Icon(Icons.business, color: white), color: goldenRod.withOpacity(0.7)));

  return list;
}

List<DAMessageModel> getChatMsgData() {
  List<DAMessageModel> list = [];

  DAMessageModel c1 = DAMessageModel();
  c1.senderId = DASender_id;
  c1.receiverId = DAReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  DAMessageModel c2 = DAMessageModel();
  c2.senderId = DASender_id;
  c2.receiverId = DAReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  DAMessageModel c3 = DAMessageModel();
  c3.senderId = DAReceiver_id;
  c3.receiverId = DASender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  DAMessageModel c4 = DAMessageModel();
  c4.senderId = DASender_id;
  c4.receiverId = DAReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  DAMessageModel c5 = DAMessageModel();
  c5.senderId = DASender_id;
  c5.receiverId = DAReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  DAMessageModel c6 = DAMessageModel();
  c6.senderId = DAReceiver_id;
  c6.receiverId = DASender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  DAMessageModel c7 = DAMessageModel();
  c7.senderId = DASender_id;
  c7.receiverId = DAReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  DAMessageModel c8 = DAMessageModel();
  c8.senderId = DAReceiver_id;
  c8.receiverId = DASender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  DAMessageModel c9 = DAMessageModel();
  c9.senderId = DASender_id;
  c9.receiverId = DAReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  DAMessageModel c10 = DAMessageModel();
  c10.senderId = DAReceiver_id;
  c10.receiverId = DASender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  DAMessageModel c11 = DAMessageModel();
  c11.senderId = DAReceiver_id;
  c11.receiverId = DASender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  DAMessageModel c12 = DAMessageModel();
  c12.senderId = DASender_id;
  c12.receiverId = DAReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  DAMessageModel c13 = DAMessageModel();
  c13.senderId = DASender_id;
  c13.receiverId = DAReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  DAMessageModel c14 = DAMessageModel();
  c14.senderId = DAReceiver_id;
  c14.receiverId = DASender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  DAMessageModel c15 = DAMessageModel();
  c15.senderId = DASender_id;
  c15.receiverId = DAReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  DAMessageModel c16 = DAMessageModel();
  c16.senderId = DAReceiver_id;
  c16.receiverId = DASender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  DAMessageModel c17 = DAMessageModel();
  c17.senderId = DASender_id;
  c17.receiverId = DAReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  DAMessageModel c18 = DAMessageModel();
  c18.senderId = DAReceiver_id;
  c18.receiverId = DASender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<DatingAppModel> getInboxData() {
  List<DatingAppModel> list = [];
  list.add(DatingAppModel(name: 'Arlene McCoy', subTitle: 'Student', image: 'images/dating/Image.1.jpg'));
  list.add(DatingAppModel(name: 'Jerome Bell', subTitle: 'Student', image: 'images/dating/Image.2.jpg'));
  list.add(DatingAppModel(name: 'Wade Warren', subTitle: 'Student', image: 'images/dating/Image.14.jpg'));
  list.add(DatingAppModel(name: 'Darlene', subTitle: 'Student', image: 'images/dating/Image.3.jpg'));
  list.add(DatingAppModel(name: 'Leslie Alexander', subTitle: 'Student', image: 'images/dating/Image.4.jpg'));
  list.add(DatingAppModel(name: 'Jacob Jones', subTitle: 'Student', image: 'images/dating/Image.5.jpg'));
  list.add(DatingAppModel(name: 'Wade Warren', subTitle: 'Student', image: 'images/dating/Image.6.jpg'));
  list.add(DatingAppModel(name: 'Cameron', subTitle: 'Wade Warren', image: 'images/dating/Image.7.jpg'));
  list.add(DatingAppModel(name: 'Eleanor Pena', subTitle: 'Wade Warren', image: 'images/dating/Image.8.jpg'));
  list.add(DatingAppModel(name: 'Jacob Jones', subTitle: 'Student', image: 'images/dating/Image.9.jpg'));
  list.add(DatingAppModel(name: 'Leslie Alexander', subTitle: 'Student', image: 'images/dating/Image.10.jpg'));
  list.add(DatingAppModel(name: 'Darlene', subTitle: 'Student', image: 'images/dating/Image.11.jpg'));
  list.add(DatingAppModel(name: 'Wade Warren', subTitle: 'Student', image: 'images/dating/Image.12.jpg'));
  list.add(DatingAppModel(name: 'Darlene', subTitle: 'Student', image: 'images/dating/Image.13.jpg'));

  return list;
}

List<DatingAppModel> getAllListData() {
  List<DatingAppModel> list = [];
  list.add(DatingAppModel(subTitle1: 'Was great hanging out', name: 'Eleanor Pena', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',age: 27,education: 'Bachelor of Arts'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Arlene McCoy', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',age: 25,education: 'Software Developer'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Jerome Bell', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg',age: 28,education: 'B.Sc in Physiology'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Wade Warren', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg',age: 23,education: 'Instrument Mechanic'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Darlene', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg',age: 24,education: 'Stenography English'));
  list.add(
      DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Leslie Alexander', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.5.jpg',age: 26,education: 'Insurance Agent'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Jacob Jones', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.6.jpg',age: 21,education: 'Basic Cosmetology'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Wade Warren', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.7.jpg',age: 24,education: 'Marketing Executive'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Cameron', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.8.jpg',age: 22,education: 'Architectural Assistant'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Jacob Jones', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.10.jpg',age: 24,education: 'Software Developer'));
  list.add(
      DatingAppModel(subTitle1: 'Was great hanging out', name: 'Leslie Alexander', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.11.jpg',age: 22,education: 'B.Sc inin Physiology'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Darlene', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.12.jpg',age: 21,education: 'Instrument Mechanic'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Wade Warren', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.13.jpg',age: 25,education: 'Stenography English'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Jerome Bell', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.15.jpg',age: 24,education: 'Insurance Agent'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Wade Warren', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.16.jpg',age: 23,education: 'Basic Cosmetology'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Darlene', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.17.jpg',age: 25,education: 'Marketing Executive'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Leslie Alexander', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.18.jpg',age: 26,education: 'Architectural Assistant'));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Jacob Jones', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.19.jpg',age: 26,education: 'Bachelor of Arts'));
  list.add(DatingAppModel(subTitle1: 'Was great hanging out!', name: 'Wade Warren', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.20.jpg',age: 22,education:'Insurance Agent' ));
  list.add(DatingAppModel(subTitle1: 'Wade Warren', name: 'Cameron', subTitle: 'Student', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.21.jpg',age: 24,education: 'Basic Cosmetology'));
  list.add(DatingAppModel(name: 'Ayush Mehra ', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.22.jpg', subTitle1: 'Was great hanging out!', subTitle: 'Student',age: 22,education:'Marketing Executive' ));
  list.add(DatingAppModel(name: 'Barkha Singh', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.23.jpg', subTitle1: 'Wade Warren', subTitle: 'Student',age: 26,education:'Architectural Assistant'));
  list.add(DatingAppModel(name: 'Barkha Singh', image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.24.jpg', subTitle1: 'Wade Warren', subTitle: 'Student',age: 23,education: 'Basic Cosmetology'));

  return list;
}

List<DatingAppModel> get getDatingAppUser => getAllListData()..shuffle();
