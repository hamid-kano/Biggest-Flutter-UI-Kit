import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class T14FinanceScreen3 extends StatefulWidget {
  @override
  _T14FinanceScreen3State createState() => _T14FinanceScreen3State();
}

class _T14FinanceScreen3State extends State<T14FinanceScreen3> {
  List<SpendingModel> spendingList = getSpendingList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: t14_SignInBgColor2,
          title: Text('Your Budget', textAlign: TextAlign.center, style: boldTextStyle(size: 16, color: t14_colorBlue)),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 20),
            onPressed: () {
              finish(context);
            },
          ),
          actions: [
            IconButton(icon: Icon(Icons.add_circle_outline, size: 22), onPressed: () {}),
          ],
        ),
        backgroundColor: t14_SignInBgColor2,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      hintText: 'Find transaction',
                      prefixIcon: Icon(Icons.search, color: t14_colorBlue, size: 20),
                      hintStyle: TextStyle(color: t14_colorBlue, fontSize: 14),
                      filled: true,
                      fillColor: t14_finance3_BgColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                      ),
                    ),
                  ),
                  22.height,
                  Center(
                    child: SleekCircularSlider(
                      initialValue: 14,
                      min: 0,
                      max: 100,
                      appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(progressBarWidth: 10),
                        customColors: CustomSliderColors(trackColor: white, progressBarColor: t14_btn_checkBoxColor),
                        size: 200,
                      ),
                      onChange: (double value) {
                        print(value);
                      },
                    ),
                  ),
                ],
              ).paddingOnly(left: 8, right: 8, top: 8),
              Container(
                padding: EdgeInsets.all(16),
                width: context.width(),
                decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(20)), backgroundColor: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t14_txt_Finance3, style: boldTextStyle(size: 16, color: t14_colorBlue)),
                    16.height,
                    Container(
                      height: 10,
                      width: context.width(),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(8)), backgroundColor: white),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                              backgroundColor: t14_finance3_spending1,
                            ),
                          ),
                          Container(color: t14_TextField_BgColor, width: 100),
                          Container(color: t14_OppsColor, width: 20),
                          Container(color: t14_SuccessBgColor1, width: 40),
                          Container(color: t14_colorCream, width: 60),
                          Container(
                            width: 50,
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                              backgroundColor: t14_txt_trasactionColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2.2,
                      ),
                      itemCount: spendingList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        SpendingModel data = spendingList[index];

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: boxDecorationWithRoundedCorners(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                backgroundColor: data.color!,
                              ),
                              child: Icon(data.icon, color: t14_colorBlue, size: 24),
                            ),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name!, style: primaryTextStyle(size: 14, color: Colors.grey)),
                                4.height,
                                Text(data.rate!, style: boldTextStyle(size: 16, color: t14_colorBlue)),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
