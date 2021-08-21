import 'package:prokit_flutter/fullApps/proCricketUI/model/PCDashboardModel.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCLiveMatchesData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';

// ignore: non_constant_identifier_names
List<PCDashboardModel> CricketDashboardList() {
  List<PCDashboardModel> list = [];

  var title1 = PCDashboardModel(Cricket_ic_fixtures, Cricket_lbl_Schedules);
  list.add(title1);

  var title2 = PCDashboardModel(Cricket_ic_teams, Cricket_lbl_Teams);
  list.add(title2);

  var title3 = PCDashboardModel(Cricket_ic_venue, Cricket_lbl_Venue);
  list.add(title3);

  var title4 = PCDashboardModel(Cricket_ic_PointTable, Cricket_lbl_Point_Table);
  list.add(title4);

  var title5 = PCDashboardModel(Cricket_ic_Ranking, Cricket_lbl_ODI_Ranking);
  list.add(title5);

  var title6 = PCDashboardModel(Cricket_ic_History, Cricket_lbl_History);
  list.add(title6);

  return list;
}

List<PCDashboardModel> cricketTeamList() {
  List<PCDashboardModel> list = [];

  var title1 = PCDashboardModel(Cricket_India_Team, Cricket_lbl_India);
  list.add(title1);

  var title2 = PCDashboardModel(Cricket_New_Zealand_Team, Cricket_lbl_New_Zealand);
  list.add(title2);

  var title3 = PCDashboardModel(Cricket_Australia_Team, Cricket_lbl_Australia);
  list.add(title3);

  var title4 = PCDashboardModel(Cricket_Bangladesh_Team, Cricket_lbl_Bangladesh);
  list.add(title4);

  var title5 = PCDashboardModel(Cricket_England_Team, Cricket_lbl_England);
  list.add(title5);

  var title6 = PCDashboardModel(Cricket_Pakistan_Team, Cricket_lbl_Pakistan);
  list.add(title6);

  var title7 = PCDashboardModel(Cricket_South_Africa_Team, Cricket_lbl_South_Africa);
  list.add(title7);

  var title8 = PCDashboardModel(Cricket_Sri_Lanka_Team, Cricket_lbl_Sri_Lanka);
  list.add(title8);

  var title9 = PCDashboardModel(Cricket_Afghanistan_Team, Cricket_lbl_Afghanistan);
  list.add(title9);

  var title10 = PCDashboardModel(Cricket_Windies_Team, Cricket_lbl_Windies);
  list.add(title10);

  return list;
}

List<CricketGroundModel> cricketVenueList() {
  List<CricketGroundModel> list = [];

  var title1 = CricketGroundModel("birmingham", "India", "Edgbaston, Birmingham", "Birmingham", "25,000", "5", Cricket_ic_trent_bridge_nottingham);
  list.add(title1);

  var title2 = CricketGroundModel("Bristol", "India", "County Ground, Bristol", "Bristol", "17,500", "3", Cricket_ic_bristol);
  list.add(title2);

  var title3 = CricketGroundModel("Cardiff", "India", "Sophia Gardens, Cardiff", "Cardiff", "15,643", "4", Cricket_ic_sophia_gardens);
  list.add(title3);

  var title4 = CricketGroundModel("Chester-le-Street", "India", "Riverside Ground, Chester-le-Street", "Chester-le-Street", "20,000", "3", Cricket_ic_riverside_ground);
  list.add(title4);

  var title5 = CricketGroundModel("Leeds", "India", "Headingley, Leeds", "Leeds", "17,500", "4", Cricket_ic_headingley_leeds);
  list.add(title5);

  var title6 = CricketGroundModel("London_lords", "India", "Lord's, London", "London", "28,000", "4", Cricket_ic_lord_london);
  list.add(title6);

  var title7 = CricketGroundModel("London_oval", "India", "The Oval, London", "London", "25,500", "5", Cricket_ic_the_oval);
  list.add(title7);

  var title8 = CricketGroundModel("Manchester", "India", "Old Trafford, Manchester", "Manchester", "26,000", "6", Cricket_ic_old_trafford_manchester);
  list.add(title8);

  var title9 = CricketGroundModel("Nottingham", "India", "Trent Bridge, Nottingham", "Nottingham", "17,500", "5", Cricket_ic_trent_bridge_nottingham);
  list.add(title9);

  var title10 = CricketGroundModel("Southampton", "India", "Rose Bowl, Southampton", "Southampton", "25,000", "5", Cricket_ic_rose_bowl_southampton);
  list.add(title10);

  var title11 = CricketGroundModel("Taunton", "India", "County Ground, Taunton", "Taunton", "12,500", "3", Cricket_ic_county_ground_tauton);
  list.add(title11);

  return list;
}

// ignore: non_constant_identifier_names
List<CricketPointTableModel> CricketPointTableList() {
  List<CricketPointTableModel> list = [];

  var p1 = CricketPointTableModel("2", "India", "9", "7", "1", "0", "15", "1", "+0.809", Cricket_head_flag_Ind);
  list.add(p1);

  var p2 = CricketPointTableModel("4", "Australia", "9", "7", "2", "0", "14", "0", "+0.868", Cricket_head_flag_aus);
  list.add(p2);

  var p3 = CricketPointTableModel("9", "England", "9", "6", "3", "0", "12", "0", "+1.152", Cricket_head_flag_eng);
  list.add(p3);

  var p4 = CricketPointTableModel("13", "New Zealand", "9", "5", "3", "0", "15", "0", "+0.175", Cricket_head_flag_nz);
  list.add(p4);

  var p5 = CricketPointTableModel("2", "india", "9", "7", "1", "0", "15", "0", "+0.809", Cricket_head_flag_Ind);
  list.add(p5);
  return list;
}

// ignore: non_constant_identifier_names
List<PCLiveMatchesModel> CricketLiveMatchesList() {
  List<PCLiveMatchesModel> list = [];
  var list1 = PCLiveMatchesModel("3rd Test- The Ashes 2019", "TEST", "Headingly", "ENG", "AUS", "153-8", "179-10", "ENG need 27 runs to win", true);
  list.add(list1);
  var list2 = PCLiveMatchesModel("Qualifier 1- India tour of West Indies 2019", "ODI", "Sir Vivisn Richards Stadium", "WI", "IND", "", "", "Starts in 9 hrs 09 mins", false);
  list.add(list2);
  var list3 = PCLiveMatchesModel("28th Match - New Zealand tour of Sri Lanka 2019", "ODI", "Stanley Park", "SL", "NZ", "", "", "Startd in 9 hrs 09 mins", false);
  list.add(list3);
  var list4 = PCLiveMatchesModel("North Group . T20 Blast 2019", "ODI", "Stanley Park", "ENG", "AUS", "", "", "Startd in 10 hrs 39 mins", false);
  list.add(list4);
  var list5 = PCLiveMatchesModel("29th Match - Womens Cricket Super League 2019", "ODI", "THe Cooper Associates Country Ground", "SL", "PAK", "", "", "Startd in 13 hrs 09 mins", false);
  list.add(list5);
  var list6 = PCLiveMatchesModel("30th Match - New Zealand tour of Sri Lanka 2019", "ODI", "The Rose Bowl", "IND", "PAK", "", "", "Startd in 13 hrs 09 mins", false);
  list.add(list6);

  return list;
}
