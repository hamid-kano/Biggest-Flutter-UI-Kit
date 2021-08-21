import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDSearchModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';

class SDSortScreen extends StatefulWidget {
  @override
  _SDSortScreenState createState() => _SDSortScreenState();
}

class _SDSortScreenState extends State<SDSortScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: sdAppBackground,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Sort By', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: mFilterList.length,
                padding: EdgeInsets.only(top: 16.0),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mFilterList[index].isSelected ? mFilterList[index].isSelected = false : mFilterList[index].isSelected = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(mFilterList[index].value!, style: primaryTextStyle()),
                              Container(
                                padding: EdgeInsets.all(4),
                                child: mFilterList[index].isSelected
                                    ? Icon(Icons.radio_button_checked, color: sdPrimaryColor, size: 22)
                                    : Icon(Icons.radio_button_unchecked, color: sdPrimaryColor, size: 22),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Divider(color: sdViewColor, thickness: 1, height: 1)
                      ],
                    ),
                  );
                }),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16.0),
              child: SDButton(
                textContent: "SAVE",
                onPressed: () {
                  finish(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
