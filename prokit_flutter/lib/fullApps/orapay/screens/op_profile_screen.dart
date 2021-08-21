import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

// ignore: non_constant_identifier_names
Widget OPprofilePage() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          profileCard(),
          SizedBox(
            height: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              profileSetting(
                title: 'Information',
                icon: Icons.person,
              ),
              Divider(),
              profileSetting(
                title: 'Security',
                icon: Icons.security,
              ),
              Divider(),
              profileSetting(
                title: 'Contact us',
                icon: Icons.message,
              ),
              Divider(),
              profileSetting(
                title: 'Support',
                icon: Icons.help,
              ),
              Divider(),
              profileSetting(
                title: 'Logout',
                icon: Icons.access_time,
              ),
              Divider(),
            ],
          ),
        ],
      ),
    ),
  );
}
