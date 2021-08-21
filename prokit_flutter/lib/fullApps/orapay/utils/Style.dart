import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Colors.dart';

BoxDecoration boxDecoration({double radius = 80.0, Color? backGroundColor = opPrimaryColor, double blurRadius = 8.0, double spreadRadius = 8.0, shadowColor = Colors.black12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: shadowColor,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ],
    color: backGroundColor,
  );
}

const dot = CircleAvatar(
  radius: 2.5,
  backgroundColor: Color(0xFF343EDB),
);

Widget applogo() {
  return Image.asset(
    'images/orapay/opsplash.png',
    width: 36,
    height: 36,
    fit: BoxFit.fill,
  );
}

// ignore: non_constant_identifier_names
Widget ButtonBars({required String title, Size? size, IconData? icon, Color? color, VoidCallback? onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Container(
      height: 50,
      width: 110,
      decoration: boxDecoration(backGroundColor: color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(title, style: primaryTextStyle(color: Colors.white))
        ],
      ),
    ),
  );
}

Widget profileCard() {
  return Container(
    decoration: boxDecoration(radius: 16, shadowColor: opPrimaryColor.withAlpha(30)),
    padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('images/orapay/opprofile.jpg'),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Richard Beck',
                  style: primaryTextStyle(color: Colors.white),
                ),
                Text(
                  'Vice President of Google',
                  style: primaryTextStyle(size: 14, color: Colors.white54),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white),
          child: Text(
            'Edit',
            style: primaryTextStyle(color: opPrimaryColor, size: 16),
          ),
        ),
      ],
    ),
  );
}

Widget profileSetting({IconData? icon, required String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
    child: Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: opSecondaryColor.withOpacity(0.6),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: primaryTextStyle(),
        ),
      ],
    ),
  );
}

Widget indicator({required bool isActive}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 4.0),
    height: isActive ? 6.0 : 4.0,
    width: isActive ? 6.0 : 4.0,
    decoration: BoxDecoration(
      color: isActive ? Colors.white : Color(0xFF929794),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
}

Widget textField({
  String? title,
  IconData? image,
  TextInputType? textInputType,
}) {
  return TextField(
    keyboardType: textInputType,
    decoration: InputDecoration(
      hintText: title,
      hintStyle: secondaryTextStyle(size: 16),
      fillColor: Colors.grey,
      suffixIcon: Icon(
        image,
        color: Colors.grey,
        size: 20,
      ),
    ),
  );
}

Widget textField2({
  String? title,
  IconData? image,
  TextInputType? textInputType,
}) {
  return TextField(
    keyboardType: textInputType,
    autocorrect: true,
    style: TextStyle(color: Colors.white, fontSize: 18),
    decoration: InputDecoration(
      hintText: title,
      enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
      fillColor: Colors.white54,
      prefixIcon: Icon(image, color: Colors.white54),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget VerifyCards({final Size? size, required String title, required String subtitle, required String image, Color? color}) {
  return Container(
    decoration: boxDecoration(backGroundColor: color, radius: 24, spreadRadius: 2, blurRadius: 4),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: boldTextStyle(size: 18, color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: primaryTextStyle(size: 16, color: Colors.white54),
                ),
              ],
            ),
          ),
          Image.asset(
            image,
            height: 80,
            width: 80,
          ),
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget CardDetails({
  required String visaTitle,
  required Color color,
  required String creditNumber,
  required String expire,
  required String name,
}) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 16),
    decoration: boxDecoration(radius: 20, backGroundColor: color, spreadRadius: 4.0, blurRadius: 10.0, shadowColor: color.withAlpha(50)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'images/orapay/opchip.png',
                  height: 40,
                  width: 40,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    visaTitle,
                    style: boldTextStyle(size: 22, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text(
                "**** **** **** " + creditNumber,
                style: boldTextStyle(size: 20, color: Colors.white, letterSpacing: 3, wordSpacing: 2),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      'CARDHOLDER',
                      style: secondaryTextStyle(color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                    child: Text(
                      name,
                      style: primaryTextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      'EXPIRES',
                      style: secondaryTextStyle(color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                    child: Text(
                      expire,
                      style: primaryTextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
        ),
      ],
    ),
  );
}

getAppBar(title, {showBack = true, GestureTapCallback? pressed}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
//        showBack
//            ? InkWell(
//          onTap: pressed,
//          child: Container(
//            margin: EdgeInsets.only(left: 16),
//            height: 45,
//            width: 45,
//            decoration: BoxDecoration(
//              color: Color(0xFFE7E6F3),
//              borderRadius: BorderRadius.all(
//                Radius.circular(16),
//              ),
//            ),
//            child: Icon(
//              Icons.keyboard_backspace,
//              color: opPrimaryColor,
//            ),
//          ),
//        )
//            : SizedBox(),
        SizedBox(
          width: 16.0,
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

getAppBar1(title, {actions, leading}) {
  return AppBar(
    leading: leading,
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: fontBold),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    automaticallyImplyLeading: false,
    actions: actions,
  );
}

// ignore: non_constant_identifier_names
Widget DashboardList({
  String name = "",
  String status = "",
  String amount = "",
  VoidCallback? onPressed,
  IconData icon = Icons.call_received,
  Color colors = Colors.green,
  Color iconcolor = Colors.green,
  Color? color,
}) {
  return GestureDetector(
    onTap: onPressed,
//      onPressed: pressed,
    child: Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: colors.withOpacity(0.2),
                    radius: 20,
                    child: Icon(
                      icon,
                      color: iconcolor,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: primaryTextStyle(fontFamily: fontMedium, size: 18),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        status,
                        style: secondaryTextStyle(size: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      amount,
                      style: boldTextStyle(
                        color: color,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            indent: 6.0,
          ),
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SliderButton({Color? color, String title = '', VoidCallback? onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.only(left: 16, right: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        onPressed!();
      });
}

Widget oPDotIndicator({required bool isActive}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 4.0),
    height: isActive ? 10.0 : 8.0,
    width: isActive ? 10.0 : 8.0,
    decoration: BoxDecoration(
      color: isActive ? opPrimaryColor : Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SliderPage({required final Size size, required String image, required String title, required String description}) {
  return Column(
    children: <Widget>[
      Container(
        child: Image(
          image: AssetImage(image),
          height: size.width,
          width: size.height,
        ),
      ),
      SizedBox(height: 4),
      Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(title, textAlign: TextAlign.center, style: boldTextStyle(size: 18)),
        ),
      ),
      SizedBox(height: 15.0),
      Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: Text(description, textAlign: TextAlign.center, style: secondaryTextStyle()),
      )
    ],
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}
