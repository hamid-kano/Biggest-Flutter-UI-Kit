import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppColors.dart';

class AppThemeData {
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldLightColor,
    primaryColor: appColorPrimary,
    primaryColorDark: appColorPrimary,
    errorColor: Colors.red,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.nunito().fontFamily,
    appBarTheme: AppBarTheme(
      color: appLayout_background,
      iconTheme: IconThemeData(color: textPrimaryColor),
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: ColorScheme.light(primary: appColorPrimary, primaryVariant: appColorPrimary),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: TextTheme(
      button: TextStyle(color: appColorPrimary),
      headline6: TextStyle(color: textPrimaryColor),
      subtitle2: TextStyle(color: textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColorDark,
    highlightColor: appBackgroundColorDark,
    errorColor: Color(0xFFCF6676),
    appBarTheme: AppBarTheme(
      color: appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    primaryColor: color_primary_black,
    accentColor: whiteColor,
    dividerColor: Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: color_primary_black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.nunito().fontFamily,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(headline6: primaryTextStyle(color: Colors.white), overline: primaryTextStyle(color: Colors.white)),
    colorScheme: ColorScheme.dark(primary: appBackgroundColorDark, onPrimary: cardBackgroundBlackDark, primaryVariant: color_primary_black),
    cardTheme: CardTheme(color: cardBackgroundBlackDark),
    iconTheme: IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      button: TextStyle(color: color_primary_black),
      headline6: TextStyle(color: whiteColor),
      subtitle2: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
    }),
  );
}
