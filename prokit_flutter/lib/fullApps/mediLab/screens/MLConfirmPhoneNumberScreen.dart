import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCountryPIckerComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLUpdateProfileScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLConfirmPhoneNumberScreen extends StatefulWidget {
  static String tag = '/MLConfirmPhoneNumberScreen';

  @override
  _MLConfirmPhoneNumberScreenState createState() => _MLConfirmPhoneNumberScreenState();
}

class _MLConfirmPhoneNumberScreenState extends State<MLConfirmPhoneNumberScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mlPrimaryColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24.0),
            decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
            padding: EdgeInsets.all(16.0),
            height: context.height(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  56.height,
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Image.asset(ml_ic_verifyindicator!, alignment: Alignment.centerLeft, width: 200, height: 200),
                  ),
                  32.height,
                  Text(mlContact_msg!, style: boldTextStyle(size: 24)),
                  8.height,
                  Text(mlContact_sub_msg!, style: secondaryTextStyle(size: 16)),
                  16.height,
                  Row(
                    children: [
                      MLCountryPickerComponent(),
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        decoration: InputDecoration(
                          labelText: mlPhoneNumber,
                          labelStyle: secondaryTextStyle(size: 16),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mlColorLightGrey),
                          ),
                        ),
                      ).expand(),
                    ],
                  ),
                  24.height,
                  AppButton(
                    width: double.infinity,
                    color: mlColorDarkBlue,
                    onTap: () => MLUpdateProfileScreen().launch(context),
                    child: Text(mlSend!, style: boldTextStyle(color: white)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: mlBackToPrevious(context, blackColor),
          ),
        ],
      ),
    );
  }
}
