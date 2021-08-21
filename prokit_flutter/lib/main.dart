//region imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/main/screens/AppSplashScreen.dart';
import 'package:prokit_flutter/main/store/AppStore.dart';
import 'package:prokit_flutter/main/utils/AppTheme.dart';
import 'package:prokit_flutter/routes.dart';

import 'main/utils/AppConstant.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

List<CSDataModel> getCloudboxList = getCloudboxData();
List<CSDrawerModel> getCSDrawerList = getCSDrawer();
int currentIndex = 0;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  if (isMobile) {
    await Firebase.initializeApp();
    MobileAds.instance.initialize();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    await  OneSignal.shared.setAppId(OneSignalId);

    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent? event) {
      return event?.complete(event.notification);
    });

    OneSignal.shared.disablePush(false);
    OneSignal.shared.consentGranted(true);
    OneSignal.shared.requiresUserPrivacyConsent();
  }

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
        home: AppSplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        routes: routes(),
        scrollBehavior: SBehavior(),
      ),
    );
  }
}
