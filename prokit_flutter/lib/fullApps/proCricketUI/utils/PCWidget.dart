import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';

// ignore: non_constant_identifier_names
BoxDecoration PCboxDecoration({double radius = 1.0, Color color = Colors.transparent, Color bgColor = Cricket_white, double borderWidth = 1.0, var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: Cricket_ShadowColor, blurRadius: 10, spreadRadius: 3)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Widget headerView(var title, BuildContext context) {
  return Container(
    //height: MediaQuery.of(context).size.width * 0.22,
    child: Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Image.asset(
              Cricket_ic_gradient,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 80,
            ),
            SafeArea(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Cricket_white,
                  ).paddingAll(6).onTap(() {
                    Navigator.of(context).pop();
                  }),
                  Text(title, style: primaryTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium), maxLines: 1, overflow: TextOverflow.ellipsis).paddingOnly(left: 8, right: 8),
                ],
              ).paddingOnly(left: 8, right: 16),
            )
          ],
        ),
      ],
    ),
  );
}

getTeamName(String? strCountry) {
  var strName = '';
  if (strCountry == 'ENG') {
    strName = "England";
  } else if (strCountry == 'RSA') {
    strName = "South Africa";
  } else if (strCountry == 'NZ') {
    strName = "New Zealand";
  } else if (strCountry == 'PAK') {
    strName = "Pakistan";
  } else if (strCountry == 'WI') {
    strName = "Windies";
  } else if (strCountry == 'AUS') {
    strName = "Australia";
  } else if (strCountry == 'BAN') {
    strName = "Bangladesh";
  } else if (strCountry == 'AFG') {
    strName = "Afghanistan";
  } else if (strCountry == 'SL') {
    strName = "Sri Lanka";
  } else if (strCountry == 'IND') {
    strName = "India";
  }
  return strName;
}

getBgFlag(String? strCountry) {
  var strFlag = '';
  if (strCountry == 'eng') {
    strFlag = Cricket_flag_eng;
  } else if (strCountry == 'rsa') {
    strFlag = Cricket_flag_rsa;
  } else if (strCountry == 'nz') {
    strFlag = Cricket_flag_nz;
  } else if (strCountry == 'pak') {
    strFlag = Cricket_flag_pak;
  } else if (strCountry == 'wi') {
    strFlag = Cricket_flag_wi;
  } else if (strCountry == 'aus') {
    strFlag = Cricket_flag_aus;
  } else if (strCountry == 'ban') {
    strFlag = Cricket_flag_ban;
  } else if (strCountry == 'afg') {
    strFlag = Cricket_flag_afg;
  } else if (strCountry == 'sl') {
    strFlag = Cricket_flag_sl;
  } else if (strCountry == 'ind') {
    strFlag = Cricket_flag_Ind;
  }
  return strFlag;
}

getLightColor(String? strCountry) {
  var strColor = '';
  if (strCountry == 'eng') {
    strColor = '#b41020';
  } else if (strCountry == 'rsa') {
    strColor = '#e51837';
  } else if (strCountry == 'nz') {
    strColor = '#cd0e24';
  } else if (strCountry == 'pak') {
    strColor = '#199b41';
  } else if (strCountry == 'wi') {
    strColor = '#7b0041';
  } else if (strCountry == 'aus') {
    strColor = '#ff0000';
  } else if (strCountry == 'ban') {
    strColor = '#f02038';
  } else if (strCountry == 'afg') {
    strColor = '#009900';
  } else if (strCountry == 'sl') {
    strColor = '#b63049';
  } else if (strCountry == 'ind') {
    strColor = '#ff9933';
  } else {
    strColor = '#232883';
  }
  return strColor;
}

getDarkColor(String? strCountry) {
  var strColor = '';
  if (strCountry == 'eng') {
    strColor = '#ce1124';
  } else if (strCountry == 'rsa') {
    strColor = '#060709';
  } else if (strCountry == 'nz') {
    strColor = '#00247d';
  } else if (strCountry == 'pak') {
    strColor = '#01411c';
  } else if (strCountry == 'wi') {
    strColor = '#7b0041';
  } else if (strCountry == 'aus') {
    strColor = '#00008b';
  } else if (strCountry == 'ban') {
    strColor = '#116903';
  } else if (strCountry == 'afg') {
    strColor = '#000000';
  } else if (strCountry == 'sl') {
    strColor = '#f0992a';
  } else if (strCountry == 'ind') {
    strColor = '#138808';
  } else {
    strColor = '#232883';
  }
  return strColor;
}

getHeaderFlag(String? strCountry) {
  var strFlag = '';
  if (strCountry == 'ENG') {
    strFlag = Cricket_head_flag_eng;
  } else if (strCountry == 'RSA') {
    strFlag = Cricket_head_flag_rsa;
  } else if (strCountry == 'NZ') {
    strFlag = Cricket_head_flag_nz;
  } else if (strCountry == 'PAK') {
    strFlag = Cricket_head_flag_pak;
  } else if (strCountry == 'WI') {
    strFlag = Cricket_head_flag_wi;
  } else if (strCountry == 'AUS') {
    strFlag = Cricket_head_flag_aus;
  } else if (strCountry == 'BAN') {
    strFlag = Cricket_head_flag_ban;
  } else if (strCountry == 'AFG') {
    strFlag = Cricket_head_flag_afg;
  } else if (strCountry == 'SL') {
    strFlag = Cricket_head_flag_sl;
  } else if (strCountry == 'IND') {
    strFlag = Cricket_head_flag_Ind;
  }
  return strFlag;
}

getHistoryTeamImg(String? strChampion) {
  var strYear = '';
  if (strChampion == '1975') {
    strYear = Cricket_history1975;
  } else if (strChampion == '1979') {
    strYear = Cricket_history1979;
  } else if (strChampion == '1983') {
    strYear = Cricket_history1983;
  } else if (strChampion == '1987') {
    strYear = Cricket_history1987;
  } else if (strChampion == '1992') {
    strYear = Cricket_history1992;
  } else if (strChampion == '1996') {
    strYear = Cricket_history1996;
  } else if (strChampion == '1999') {
    strYear = Cricket_history1999;
  } else if (strChampion == '2003') {
    strYear = Cricket_history2003;
  } else if (strChampion == '2007') {
    strYear = Cricket_history2007;
  } else if (strChampion == '2011') {
    strYear = Cricket_history2011;
  } else if (strChampion == '2015') {
    strYear = Cricket_history2015;
  }
  return strYear;
}
