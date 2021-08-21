import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class BHAppointmentScreen extends StatefulWidget {
  static String tag = '/AppointmentBottomNavigationBarScreen';

  @override
  BHAppointmentScreenState createState() => BHAppointmentScreenState();
}

class BHAppointmentScreenState extends State<BHAppointmentScreen> with SingleTickerProviderStateMixin {
  bool isSwitched = false;

  late DateTime date;

  _pickDate() async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (time != null) {
      setState(() {
        date = time;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

  Widget ongoingAppointmentWidget() {
    return Container(
      color: BHGreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
                boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
              ),
              child: ListTile(
                title: Text('Date : ${date.day}/ ${date.month}/ ${date.year}', style: TextStyle(color: BHAppTextColorSecondary)),
                trailing: Icon(Icons.keyboard_arrow_down, color: BHAppTextColorSecondary),
                onTap: () => _pickDate(),
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
                boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: BHDashedBoardImage4, height: 70, width: 130, fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Conado Hair Studio', style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                          8.height,
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: BHAppTextColorSecondary),
                              Text('301 Dorthy walks,chicago,Us.', style: TextStyle(fontSize: 12, color: BHGreyColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Makeup Marguerite', style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                    Text('1:30 - 2:30 PM', style: TextStyle(color: BHColorPrimary, fontSize: 14)),
                  ]),
                  8.height,
                  Row(
                    children: [
                      Icon(Icons.person, size: 14, color: BHAppTextColorSecondary),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Lettie Neal', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Scan Barcode', style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary)),
                      Image.asset(BHBarCodeImg, height: 50, width: 120),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Remind me 1h in advance', style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary)),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: isSwitched,
                          activeColor: BHColorPrimary,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget historyAppointmentWidget() {
    return Container(
      color: BHGreyColor.withOpacity(0.1),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
              boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: BHDashedBoardImage4, height: 70, width: 130, fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Conado  Hair Studio',
                            style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                          ),
                          8.height,
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: BHAppTextColorSecondary),
                              Text('301 Dorthy walks,chicago,Us.', style: TextStyle(fontSize: 12, color: BHGreyColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Text('Makeup Marguerite', style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: 14, color: BHAppTextColorSecondary),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text('Lettie Neal', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                          ),
                        ],
                      ),
                      Text('March 24, 2020', style: TextStyle(color: BHAppTextColorPrimary, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: TabBar(
          labelColor: BHColorPrimary,
          unselectedLabelColor: BHAppTextColorPrimary,
          indicatorColor: BHColorPrimary,
          onTap: (index) {},
          tabs: [
            Tab(child: Text(BHTabOngoing, style: TextStyle(fontSize: 14))),
            Tab(child: Text(BHTabHistory, style: TextStyle(fontSize: 14))),
          ],
        ),
        body: TabBarView(
          children: [
            ongoingAppointmentWidget(),
            historyAppointmentWidget(),
          ],
        ),
      ),
    );
  }
}
