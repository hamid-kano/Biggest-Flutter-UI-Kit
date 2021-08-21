import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingTransferSuccessful.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingSlider.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

class BankingTransfer extends StatefulWidget {
  static var tag = "/BankingTransfer";

  @override
  _BankingTransferState createState() => _BankingTransferState();
}

class _BankingTransferState extends State<BankingTransfer> {
  bool isSwitch = false;
  bool isGetOtp = false;
  var tapCount = 0;

  void tappedConfirm() {
    if (tapCount != 1) {
      BankingTransferSuccessful().launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              Text(
                isSwitch == true ? Banking_lbl_Confirm_Transfer : Banking_lbl_Transfer,
                style: primaryTextStyle(color: Banking_TextColorPrimary, size: 26, fontFamily: fontBold),
              ),
              10.height,
              Text("Choose Account to Transfer", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 14, fontFamily: fontBold)),
              16.height,
              BankingSliderWidget().visible(isSwitch == false),
              Container(
                margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                child: Stack(
                  children: [
                    Image.asset(Banking_ic_CardImage, fit: BoxFit.cover, height: 200),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Laura Smith", style: boldTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)).paddingOnly(top: spacing_large, left: spacing_standard_new),
                            Text(Banking_lbl_app_Name, style: boldTextStyle(color: Banking_whitePureColor, size: 16, fontFamily: fontMedium))
                                .paddingOnly(top: spacing_large, right: spacing_standard_new)
                          ],
                        ),
                        Text("The Same Bank", style: boldTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)).paddingOnly(top: spacing_large, left: spacing_standard_new),
                        Text('1121 *** ** *** 5555', style: boldTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium))
                            .paddingOnly(left: spacing_standard_new, top: spacing_control),
                        Text("\$" + "12,500", style: boldTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)).paddingOnly(top: spacing_standard, left: spacing_standard_new),
                      ],
                    ),
                    10.height,
                  ],
                ),
              ).visible(isSwitch == true),
              16.height,
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Choose Bank Name", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Row(
                        children: [
                          Text("The Same Bank", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                          Icon(Icons.keyboard_arrow_right, size: 30, color: Banking_greyColor),
                        ],
                      ).onTap(
                        () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(),
                          );
                        },
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Choose Beneficiery", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Row(
                        children: [
                          Text("John Smith", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                          Icon(Icons.keyboard_arrow_right, size: 30, color: Banking_greyColor),
                        ],
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Account Number", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Text("123 456 789", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                  Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bank", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Text(Banking_lbl_app_Name, style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                  Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Branch", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Text("New York City", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                  Divider(height: 24),
                  Text("Transfer Info", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 14, fontFamily: fontRegular)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Text("\$1000", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                  Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Message", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Text("Rental Car Fee", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                  Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee Transaction", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Text("\$10", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                  Divider(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("A OTP code has been send to your phone", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 14, fontFamily: fontRegular)),
                      EditText(text: "Enter OTP", isPassword: false),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(Banking_lbl_Resend, style: primaryTextStyle(size: 18, fontFamily: fontRegular)).onTap(() {}),
                      ),
                      8.height,
                      Text("Use Face ID to verify transaction", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 14, fontFamily: fontRegular)),
                      Image.asset(Banking_ic_face_id, color: Banking_Primary, height: 40, width: 40).center().paddingOnly(top: 16, bottom: 16),
                    ],
                  ).visible(isGetOtp == true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save this Beneficiary", style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)),
                      Switch(
                        value: isSwitch,
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                            print(isSwitch);
                          });
                        },
                        activeTrackColor: Banking_Primary.withOpacity(0.5),
                        activeColor: Banking_Primary,
                      ),
                    ],
                  ).visible(isGetOtp == false),
                  Divider(height: 24),
                  16.height,
                  BankingButton(
                      textContent: isGetOtp == true ? Banking_lbl_Confirm : Banking_lbl_Get_OTP,
                      onPressed: () {
                        setState(
                          () {
                            isGetOtp = true;
                            tapCount = tapCount + 1;
                            tappedConfirm();
                          },
                        );
                      }).visible(isSwitch == true),
                  24.height,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(10), backgroundColor: Banking_whitePureColor),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        8.height,
        Text(Banking_lbl_Same_Bank, style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)).onTap(() {
          finish(context);
        }),
        8.height,
        Divider(thickness: 1.0, color: Banking_greyColor.withOpacity(0.5)),
        8.height,
        Text(Banking_lbl_Other_Bank, style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)).onTap(() {
          finish(context);
        }),
        8.height,
        Divider(thickness: 1.0, color: Banking_greyColor.withOpacity(0.5)),
        8.height,
        Text(Banking_lbl_Credit_Card, style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular)).onTap(() {
          finish(context);
        }),
        8.height,
      ],
    ),
  );
}
