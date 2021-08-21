import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class GoogleSignInScreen extends StatefulWidget {
  static String tag = '/GoogleSignInScreen';

  @override
  GoogleSignInScreenState createState() => GoogleSignInScreenState();
}

class GoogleSignInScreenState extends State<GoogleSignInScreen> {
  var isSuccess = false;
  String? name = 'UserName';
  var email = 'Email id';
  String? photoUrl = '';

  void onSignInTap() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'email',
    ]);
    await googleSignIn.signIn().then((res) async {
      await res!.authentication.then((accessToken) async {
        setState(() {
          isSuccess = true;
          name = res.displayName;
          email = res.email;
          photoUrl = res.photoUrl;
        });

        print('Access Token: ${accessToken.accessToken.toString()}');
      }).catchError((error) {
        isSuccess = false;
        toast(error.toString());
        setState(() {});
        throw (error.toString());
      });
    }).catchError((error) {
      isSuccess = false;
      toast(error.toString());
      setState(() {});
      throw (error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      appBar: appBar(context, 'Google Sign In'),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 24),
                  decoration: BoxDecoration(color: thirdColor, shape: BoxShape.circle),
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundImage: Image.network(photoUrl!).image,
                    radius: 50,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(name, fontSize: textSizeLargeMedium, fontFamily: fontSemibold, textColor: isSuccess ? greenColor : appStore.textPrimaryColor),
                      text(email, fontSize: textSizeLargeMedium, textColor: isSuccess ? greenColor : appStore.textPrimaryColor),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () => onSignInTap(),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "images/integrations/icons/ic_google.png",
                        width: 30,
                        color: whiteColor,
                      ),
                      Center(child: text('Sign In with google', textColor: whiteColor, isCentered: true, fontFamily: fontRegular, fontSize: textSizeMedium)),
                    ],
                  )))
        ],
      ),
    );
  }
}
