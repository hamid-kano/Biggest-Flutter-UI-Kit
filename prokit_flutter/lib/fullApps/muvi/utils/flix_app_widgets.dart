import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_movie_detail_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_percent_indicator.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';

import 'dots_indicator/dots_decorator.dart';
import 'flix_constants.dart';

/*Widget text(
  var text, {
  var fontSize = ts_medium,
  textColor = muvi_textColorSecondary,
  var fontFamily = font_regular,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.1,
  var isLongText = false,
  var isJustify = false,
  var aDecoration,
}) {
  return Text(
    text,
    textAlign: isCentered
        ? TextAlign.center
        : isJustify
            ? TextAlign.justify
            : TextAlign.start,
    maxLines: isLongText ? 20 : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      decoration: aDecoration != null ? aDecoration : null,
      fontSize: double.parse(fontSize.toString()).toDouble(),
      height: 1.5,
      color: textColor == muvi_textColorSecondary
          ? muvi_textColorSecondary
          : textColor.toString().isNotEmpty
              ? textColor
              : null,
      letterSpacing: latterSpacing,
    ),
  );
}*/

Widget toolBarTitle(BuildContext context, String? title) {
  return text(title, fontSize: ts_large, textColor: muvi_textColorPrimary, fontFamily: font_bold);
}

Widget itemTitle(BuildContext context, var titleText, {var fontfamily = font_medium}) {
  return text(titleText, fontSize: ts_normal, fontFamily: fontfamily, textColor: muvi_textColorPrimary);
}

Widget itemSubTitle(BuildContext context, var titleText, {var fontFamily = font_regular, var fontsize = ts_normal, var colorThird = false, isLongText = true}) {
  return text(titleText, fontSize: fontsize, fontFamily: fontFamily, isLongText: isLongText, textColor: colorThird ? muvi_textColorThird : muvi_textColorSecondary);
}

// ignore: must_be_immutable
class MoreLessText extends StatefulWidget {
  var titleText;
  var fontFamily = font_regular;
  var fontsize = ts_normal;
  var colorThird = false;

  MoreLessText(this.titleText, {this.fontFamily = font_regular, this.fontsize = ts_normal, this.colorThird = false});

  @override
  MoreLessTextState createState() => MoreLessTextState();
}

class MoreLessTextState extends State<MoreLessText> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(
          widget.titleText,
          fontSize: widget.fontsize,
          fontFamily: widget.fontFamily,
          isLongText: isExpanded,
          maxLine: 2,
          textColor: widget.colorThird ? muvi_textColorThird : muvi_textColorSecondary,
        ),
        text(
          isExpanded ? "Read less" : "Read more",
          textColor: muvi_textColorPrimary,
          fontSize: widget.fontsize,
        ).onTap(() {
          setState(() {
            isExpanded = !isExpanded;
          });
        })
      ],
    );
  }
}

Widget headingText(BuildContext context, var titleText) {
  return text(titleText, fontSize: ts_extra_normal, fontFamily: font_bold, textColor: muvi_textColorPrimary);
}

Widget headingWidViewAll(BuildContext context, var titleText, callback) {
  return Row(
    children: <Widget>[
      Expanded(child: headingText(context, titleText)),
      InkWell(onTap: callback, child: itemSubTitle(context, "View More", fontsize: ts_medium, fontFamily: font_medium, colorThird: true).paddingAll(spacing_control_half))
    ],
  );
}

AppBar appBarLayout(context, text, {darkBackground = true}) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: muvi_colorPrimary),
    title: toolBarTitle(context, text),
    backgroundColor: darkBackground ? muvi_navigationBackground : Colors.transparent,
  );
}

Widget networkImage(String? image, {String aPlaceholder = "", double? aWidth, double? aHeight, BoxFit fit = BoxFit.fill}) {
  return CachedNetworkImage(
    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
    imageUrl: '$BaseUrl/$image',
    width: aWidth,
    height: aHeight,
    fit: fit,
  );
}

Widget button(BuildContext context, buttonText, VoidCallback callback) {
  return MaterialButton(
    textColor: muvi_colorPrimary,
    color: muvi_colorPrimary,
    splashColor: Colors.grey.withOpacity(0.2),
    padding: EdgeInsets.only(top: 12, bottom: 12),
    child: text(buttonText, fontSize: ts_normal, fontFamily: font_medium, textColor: Colors.black),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(spacing_control),
      side: BorderSide(color: muvi_colorPrimary),
    ),
    onPressed: callback,
  );
}

Widget iconButton(context, buttonText, icon, callBack, {backgroundColor, borderColor, buttonTextColor, iconColor, padding = 12.0}) {
  return MaterialButton(
    color: backgroundColor == null ? muvi_colorPrimary : backgroundColor,
    splashColor: Colors.grey.withOpacity(0.2),
    padding: EdgeInsets.only(top: padding, bottom: padding),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        iconColor == null ? Image.asset(icon, width: 16, height: 16) : Image.asset(icon, width: 16, height: 16, color: iconColor),
        text(buttonText, fontSize: ts_normal, fontFamily: font_medium, textColor: buttonTextColor == null ? Colors.black : buttonTextColor).paddingLeft(spacing_standard),
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_control), side: BorderSide(width: 0.8, color: borderColor == null ? muvi_colorPrimary : borderColor)),
    onPressed: callBack,
  );
}

DotsDecorator dotsDecorator(context) {
  return DotsDecorator(color: Colors.grey.withOpacity(0.5), activeColor: muvi_colorPrimary, activeSize: Size.square(5.0), size: Size.square(5.0), spacing: EdgeInsets.all(spacing_control_half));
}

Widget flixTitle(context) {
  return Image.asset(
    ic_logo,
    width: MediaQuery.of(context).size.width * 0.3,
    height: 53,
  );
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: spacing_control,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}

Widget notificationIcon(context, cartCount) {
  return InkWell(
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.notifications_none, color: muvi_textColorPrimary, size: 24),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(top: spacing_standard),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: text(cartCount.toString(), fontSize: 12.0, textColor: muvi_white),
          ).visible(cartCount != 0),
        )
      ],
    ),
    onTap: () {},
  );
}

// ignore: must_be_immutable
class ItemHorizontalList extends StatelessWidget {
  List<Movie> list = [];
  var isHorizontal = false;

  ItemHorizontalList(this.list, {this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return !isHorizontal
        ? Container(
            height: (width * 0.28) * 8.8 / 6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard_new),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: spacing_standard),
                  width: width * 0.28,
                  child: InkWell(
                    child: AspectRatio(
                      aspectRatio: 6 / 8.8,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          networkImage(list[index].slideImage, aWidth: double.infinity, aHeight: double.infinity).cornerRadiusWithClipRRect(8),
                          hdWidget(context).paddingRight(spacing_standard).visible(list[index].isHD!).paddingAll(spacing_standard),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
                    },
                    radius: spacing_control,
                  ),
                );
              },
            ),
          )
        : Container(
            height: ((width / 2) - 36) * (2.5 / 4),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard_new),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: spacing_standard),
                  width: (width / 2) - 36,
                  child: InkWell(
                    child: AspectRatio(
                      aspectRatio: 4 / 2.5,
                      child: networkImage(list[index].slideImage, aWidth: double.infinity, aHeight: double.infinity).cornerRadiusWithClipRRect(8),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
                    },
                    radius: spacing_control,
                  ),
                );
              },
            ),
          );
  }
}

// ignore: must_be_immutable
class ItemProgressHorizontalList extends StatelessWidget {
  List<Movie> list = [];

  ItemProgressHorizontalList(this.list);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: (((width / 2) - 36) * (2.5 / 4) + 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard_new),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: spacing_standard),
            width: (width / 2) - 36,
            child: InkWell(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 4 / 2.5,
                    child: networkImage(list[index].slideImage, aWidth: double.infinity, aHeight: double.infinity).cornerRadiusWithClipRRect(8),
                  ).paddingBottom(spacing_control),
                  Expanded(
                    child: LinearPercentIndicator(
                      width: (width / 2) - 40,
                      lineHeight: 1.5,
                      percent: list[index].percent,
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.only(left: 2),
                      progressColor: muvi_colorPrimary,
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
              },
              radius: spacing_control,
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MovieGridList extends StatelessWidget {
  List<Movie> list = [];
  var isHorizontal = false;

  MovieGridList(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 12, right: 12),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 9 / 13),
        scrollDirection: Axis.vertical,
        controller: ScrollController(keepScrollOffset: false),
        itemBuilder: (context, index) {
          Movie bookDetail = list[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: spacing_control_half,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(spacing_control)),
              child: networkImage(bookDetail.slideImage),
            ),
          ).paddingAll(spacing_control);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class AllMovieGridList extends StatelessWidget {
  List<Movie> list = [];
  var isHorizontal = false;

  AllMovieGridList(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 11, right: 11, top: spacing_standard_new),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 9 / 15),
        scrollDirection: Axis.vertical,
        controller: ScrollController(keepScrollOffset: false),
        itemBuilder: (context, index) {
          Movie bookDetail = list[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: networkImage(bookDetail.slideImage, aWidth: double.infinity, aHeight: double.infinity, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                ),
                itemTitle(context, "Crank- High Voltage"),
                itemSubTitle(context, "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", isLongText: false),
              ],
            ),
          ).paddingOnly(left: 5, right: 5, bottom: spacing_standard_new);
        },
      ),
    );
  }
}

Widget subType(context, key, VoidCallback callback, icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      icon != null
          ? Image.asset(
              icon,
              width: 20,
              height: 20,
              color: muvi_textColorPrimary,
            ).paddingRight(spacing_standard)
          : SizedBox(),
      Expanded(child: itemTitle(context, key)),
      Icon(Icons.arrow_forward_ios, size: 16, color: muvi_textColorThird)
    ],
  ).paddingOnly(left: spacing_standard_new, right: 12, top: spacing_standard_new, bottom: spacing_standard_new).onTap(callback);
}

Widget hdWidget(context) {
  return Container(
    decoration: BoxDecoration(color: muvi_colorPrimary, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(spacing_control_half))),
    padding: EdgeInsets.only(top: 0, bottom: 0, left: spacing_control, right: spacing_control),
    child: text("HD", textColor: Colors.black, fontSize: ts_medium, fontFamily: font_bold),
  );
}

Widget formField(
  context,
  hint, {
  isEnabled = true,
  isDummy = false,
  controller,
  isPasswordVisible = false,
  isPassword = false,
  keyboardType = TextInputType.text,
  FormFieldValidator<String>? validator,
  onSaved,
  textInputAction = TextInputAction.next,
  FocusNode? focusNode,
  FocusNode? nextFocus,
  IconData? suffixIcon,
  maxLine = 1,
  suffixIconSelector,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword && isPasswordVisible,
    cursorColor: muvi_colorPrimary,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_colorPrimary)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: muvi_textColorPrimary)),
      labelText: hint,
      labelStyle: TextStyle(fontSize: ts_normal, color: muvi_textColorPrimary),
      suffixIcon: isPassword && isPasswordVisible
          ? GestureDetector(onTap: suffixIconSelector, child: Icon(suffixIcon, color: muvi_colorPrimary, size: 20))
          : Icon(suffixIcon, color: muvi_colorPrimary, size: 20),
      contentPadding: EdgeInsets.only(bottom: 2.0),
    ),
    style: TextStyle(fontSize: ts_normal, color: isDummy ? Colors.transparent : muvi_textColorPrimary, fontFamily: font_regular),
  );
}
