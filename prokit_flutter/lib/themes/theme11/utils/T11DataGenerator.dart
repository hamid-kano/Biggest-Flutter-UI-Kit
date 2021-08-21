import 'package:prokit_flutter/themes/theme11/models/T11Models.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';

List<Theme11ListProfile> theme11List() {
  List<Theme11ListProfile> list = [];

  var listProfile1 = Theme11ListProfile();
  listProfile1.img = t11_ic_Inst;
  listProfile1.count = "11 M";
  list.add(listProfile1);

  var listProfile2 = Theme11ListProfile();
  listProfile2.img = t11_ic_Youtube;
  listProfile2.count = "28";
  list.add(listProfile2);

  var listProfile3 = Theme11ListProfile();
  listProfile3.img = t11_ic_Twitter;
  listProfile3.count = "185";
  list.add(listProfile3);

  return list;
}

List<Theme11SongType> theme11songTypeList() {
  List<Theme11SongType> list = [];

  var songType1 = Theme11SongType();
  songType1.name = "K-Pop";
  list.add(songType1);

  var songType2 = Theme11SongType();
  songType2.name = "Classical";
  list.add(songType2);

  var songType3 = Theme11SongType();
  songType3.name = "Instrumental";
  list.add(songType3);

  var songType4 = Theme11SongType();
  songType4.name = "Jonas Brothers";
  list.add(songType4);

  var songType5 = Theme11SongType();
  songType5.name = "Tailor Swift";
  list.add(songType5);

  var songType6 = Theme11SongType();
  songType6.name = "Jastin";
  list.add(songType6);

  var songType7 = Theme11SongType();
  songType7.name = "Badshaah";
  list.add(songType7);

  return list;
}

List<Theme11SongsList> theme11SongList() {
  List<Theme11SongsList> list = [];

  var songList1 = Theme11SongsList();
  songList1.title = "Top Solo Artist";
  songList1.subtitle = "IU,Tayeyeon";
  songList1.img = t11_ic_Music3;
  list.add(songList1);

  var songList2 = Theme11SongsList();
  songList2.title = "Pop Mix";
  songList2.subtitle = "Shawn Mendes";
  songList2.img = t11_ic_Music2;
  list.add(songList2);

  var songList3 = Theme11SongsList();
  songList3.title = "Classical Pops";
  songList3.subtitle = "Nick Jonas";
  songList3.img = t11_ic_Music1;
  list.add(songList3);

  var songList4 = Theme11SongsList();
  songList4.title = "Ghost";
  songList4.subtitle = "Nick Jonas";
  songList4.img = t11_ic_Music4;
  list.add(songList4);

  var songList5 = Theme11SongsList();
  songList5.title = "Top Solo Artist";
  songList5.subtitle = "IU,Tayeyeon";
  songList5.img = t11_ic_Music3;
  list.add(songList5);

  var songList6 = Theme11SongsList();
  songList6.title = "Pop Mix";
  songList6.subtitle = "Shawn Mendes";
  songList6.img = t11_ic_Music2;
  list.add(songList6);

  var songList7 = Theme11SongsList();
  songList7.title = "Classical Pops";
  songList7.subtitle = "Nick Jonas";
  songList7.img = t11_ic_Music1;
  list.add(songList7);

  var songList8 = Theme11SongsList();
  songList8.title = "Ghost";
  songList8.subtitle = "Nick Jonas";
  songList8.img = t11_ic_Music4;
  list.add(songList8);

  return list;
}

// ignore: non_constant_identifier_names
List<Theme11SuggestTags> Theme11SuggestTagList() {
  List<Theme11SuggestTags> list = [];

  var suggestTag1 = Theme11SuggestTags();
  suggestTag1.name = "#K-Pop";
  list.add(suggestTag1);

  var suggestTag2 = Theme11SuggestTags();
  suggestTag2.name = "#Classical";
  list.add(suggestTag2);

  var suggestTag3 = Theme11SuggestTags();
  suggestTag3.name = "#Instrumental";
  list.add(suggestTag3);

  var suggestTag4 = Theme11SuggestTags();
  suggestTag4.name = "#Jonas Brothers";
  list.add(suggestTag4);

  var suggestTag5 = Theme11SuggestTags();
  suggestTag5.name = "#Tailor Swift";
  list.add(suggestTag5);

  var suggestTag6 = Theme11SuggestTags();
  suggestTag6.name = "#Jastin";
  list.add(suggestTag6);

  var suggestTag7 = Theme11SuggestTags();
  suggestTag7.name = "#Badshaah";
  list.add(suggestTag7);

  return list;
}

List<Theme11Albums> theme11AlbumsList() {
  List<Theme11Albums> list = [];

  var albums1 = Theme11Albums();
  albums1.name = "Sprak Fly";
  albums1.subTitle = "Tayeyeon";
  albums1.img = t11_ic_Music2;
  list.add(albums1);

  var albums2 = Theme11Albums();
  albums2.name = "Classical";
  albums2.subTitle = "Tailor Swift";
  albums2.img = t11_ic_Music1;
  list.add(albums2);

  var albums3 = Theme11Albums();
  albums3.name = "Sprak&&";
  albums3.subTitle = "Nick Jonas";
  albums3.img = t11_ic_Music4;
  list.add(albums3);

  var albums4 = Theme11Albums();
  albums4.name = "Sparken";
  albums4.subTitle = "Nick Jonas";
  albums4.img = t11_ic_Music3;
  list.add(albums4);

  return list;
}
