import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBAudioArticleScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBBookmarkScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBChangePasswordScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBCreateNewArticleScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBEditProfileScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBLanguageScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBMembershipScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBNotificationSettingScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBSettingScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';

String details = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.';

List<NBBannerItemModel> nbGetBannerItems() {
  List<NBBannerItemModel> bannerList = [];
  bannerList.add(NBBannerItemModel(image: NBNewsImage1));
  bannerList.add(NBBannerItemModel(image: NBNewsImage2));
  bannerList.add(NBBannerItemModel(image: NBNewsImage3));
  return bannerList;
}

List<NBDrawerItemModel> nbGetDrawerItems() {
  List<NBDrawerItemModel> drawerItems = [];
  drawerItems.add(NBDrawerItemModel(title: 'Home'));
  drawerItems.add(NBDrawerItemModel(title: 'Audio', widget: NBAudioArticleScreen()));
  drawerItems.add(NBDrawerItemModel(title: 'Create New Article', widget: NBCreateNewArticleScreen()));
  drawerItems.add(NBDrawerItemModel(title: 'Bookmark', widget: NBBookmarkScreen()));
  drawerItems.add(NBDrawerItemModel(title: 'Membership', widget: NBMembershipScreen()));
  drawerItems.add(NBDrawerItemModel(title: 'Setting', widget: NBSettingScreen()));
  return drawerItems;
}

List<NBNewsDetailsModel> nbGetNewsDetails() {
  List<NBNewsDetailsModel> newsDetailsList = [];
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Sports',
    title: 'NHL roundup: Mika Zibanejad\'s record night powers Rangers',
    date: '20 jan 2021',
    image: NBSportSNews1,
    details: details,
    time: '40:18',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Technology',
    title: 'Amazfit T-Rex Pro review: This fitness watch is in a league of its own',
    date: '20 jan 2021',
    image: NBTechNews1,
    details: details,
    time: '1:40:18',
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Fashion',
    title: 'Amazfit T-Rex Pro review: This fitness watch is in a league of its own',
    date: '20 jan 2021',
    image: NBTechNews1,
    details: details,
    time: '40:00',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Science',
    title: 'NHL roundup: Mika Zibanejad\'s record night powers Rangers',
    date: '20 jan 2021',
    image: NBSportSNews1,
    details: details,
    time: '15:00',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Sports',
    title: 'Spring training roundup: Braves get past Rays',
    date: '20 Nov 2020',
    image: NBSportSNews2,
    details: details,
    time: '1:9:30',
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Technology',
    title: 'Micromax In 1 review: Clean software gives this budget smartphone an edge',
    date: '20 Nov 2020',
    image: NBTechNews2,
    details: details,
    time: '1:9:30',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Fashion',
    title: 'Micromax In 1 review: Clean software gives this budget smartphone an edge',
    date: '20 Nov 2020',
    image: NBTechNews2,
    details: details,
    time: '40:00',
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Science',
    title: 'Spring training roundup: Braves get past Rays',
    date: '20 Nov 2020',
    image: NBSportSNews2,
    details: details,
    time: '20:00',
  ));
  return newsDetailsList;
}

List<NBSettingsItemModel> nbGetSettingItems() {
  List<NBSettingsItemModel> settingList = [];
  settingList.add(NBSettingsItemModel(title: 'Language', widget: NBLanguageScreen()));
  settingList.add(NBSettingsItemModel(title: 'Edit Profile', widget: NBEditProfileScreen()));
  settingList.add(NBSettingsItemModel(title: 'Change Password', widget: NBChangePasswordScreen()));
  settingList.add(NBSettingsItemModel(title: 'Notification Setting', widget: NBNotificationSettingScreen()));
  settingList.add(NBSettingsItemModel(title: 'Help and Support'));
  settingList.add(NBSettingsItemModel(title: 'Terms and Conditions'));
  return settingList;
}

List<NBLanguageItemModel> nbGetLanguageItems() {
  List<NBLanguageItemModel> languageList = [];
  languageList.add(NBLanguageItemModel(NBChineseFlag, 'Chinese'));
  languageList.add(NBLanguageItemModel(NBEnglishFlag, 'English'));
  languageList.add(NBLanguageItemModel(NBFrenchFlag, 'French'));
  languageList.add(NBLanguageItemModel(NBMelayuFlag, 'Melayu'));
  languageList.add(NBLanguageItemModel(NBSpainFlag, 'Spain'));
  return languageList;
}

List<NBNotificationItemModel> nbGetNotificationItems() {
  List<NBNotificationItemModel> notificationList = [];
  notificationList.add(NBNotificationItemModel('App Notification', true));
  notificationList.add(NBNotificationItemModel('Recommended Article', true));
  notificationList.add(NBNotificationItemModel('Promotion', false));
  notificationList.add(NBNotificationItemModel('Latest News', true));
  return notificationList;
}

List<NBCategoryItemModel> nbGetCategoryItems() {
  List<NBCategoryItemModel> categoryList = [];
  categoryList.add(NBCategoryItemModel(NBTechnologyCategory, 'Technology'));
  categoryList.add(NBCategoryItemModel(NBFashionCategory, 'Fashion'));
  categoryList.add(NBCategoryItemModel(NBSportsCategory, 'Sports'));
  categoryList.add(NBCategoryItemModel(NBScienceCategory, 'Science'));
  return categoryList;
}

List<NBMembershipPlanItemModel> nbGetMembershipPlanItems() {
  List<NBMembershipPlanItemModel> planList = [];
  planList.add(NBMembershipPlanItemModel('Monthly', '\$9.99', 'Billed every month'));
  planList.add(NBMembershipPlanItemModel('Yearly', '\$4.99/month', 'Billed every month'));
  return planList;
}

List<NBFollowersItemModel> nbGetFollowers() {
  List<NBFollowersItemModel> followersList = [];
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Jones Hawkins', 13));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Frederick Rodriquez', 8));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'John Jordan', 37));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Cameron Williamson', 16));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Cody Fisher', 13));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Carla Hamilton', 21));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Fannie Townsend', 25));
  followersList.add(NBFollowersItemModel(NBProfileImage, 'Viola Lloyd', 13));
  return followersList;
}

List<NBCommentItemModel> nbGetCommentList() {
  List<NBCommentItemModel> commentList = [];
  commentList.add(NBCommentItemModel(
    image: NBProfileImage,
    name: 'Jones Hawkins',
    date: 'Jan 18,2021',
    time: '12:15',
    message: 'This is Very Helpful,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: NBProfileImage,
    name: 'Frederick Rodriquez',
    date: 'Jan 19,2021',
    time: '01:15',
    message: 'This is very Important for me,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: NBProfileImage,
    name: 'John Jordan',
    date: 'Feb 18,2021',
    time: '03:15',
    message: 'This is Very Helpful,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: NBProfileImage,
    name: 'Cameron Williamson',
    date: 'Jan 21,2021',
    time: '12:15',
    message: 'This is very Important for me,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: NBProfileImage,
    name: 'Cody Fisher',
    date: 'Jan 28,2021',
    time: '12:15',
    message: 'This is very helpful,thanks',
  ));
  return commentList;
}
