import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusCards extends StatefulWidget {
  static String tag = '/QIBusCards';

  @override
  QIBusCardsState createState() => QIBusCardsState();
}

class QIBusCardsState extends State<QIBusCards> {
  late List<QIBusCardModel> mCards;

  @override
  void initState() {
    super.initState();
    mCards = QIBusGetCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_lbl_cards,
              icon: qibus_gif_bell,
              isVisible: true,
            ),
            Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mCards.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Cards(mCards[index], index);
                  }),
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class Cards extends StatelessWidget {
  late QIBusCardModel model;

  Cards(QIBusCardModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.cardBg,
              height: width * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(spacing_standard_new),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: text(model.cardType, textColor: qIBus_white, fontSize: textSizeLargeMedium),
                ),
                SizedBox(height: width * 0.15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(model.txtDigit1, textColor: qIBus_white, fontSize: textSizeLargeMedium),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    text(model.txtDigit2, textColor: qIBus_white, fontSize: textSizeLargeMedium),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    text(model.txtDigit3, textColor: qIBus_white, fontSize: textSizeLargeMedium),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    text(model.txtDigit4, textColor: qIBus_white, fontSize: textSizeLargeMedium),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(QIBus_text_valid, textColor: qIBus_white),
                        SizedBox(
                          width: spacing_middle,
                        ),
                        text(model.mValidDate, textColor: qIBus_white),
                      ],
                    ),
                    text(model.txtHolderName, textColor: qIBus_white, textAllCaps: true),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
