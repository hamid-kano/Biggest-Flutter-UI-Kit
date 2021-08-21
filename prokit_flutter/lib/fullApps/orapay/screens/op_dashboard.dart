import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/orapay/screens/op_transfer_screen.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

import 'op_atm_location_screen.dart';
import 'op_home_fragment.dart';
import 'op_my_card_fragment.dart';
import 'op_profile_screen.dart';

class OPBottomNavigationScreen extends StatefulWidget {
  @override
  _OPBottomNavigationScreenState createState() => _OPBottomNavigationScreenState();
}

class _OPBottomNavigationScreenState extends State<OPBottomNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tab = [
      OPDasboardScreen(context),
      OPMyCards(),
      OPDasboardScreen(context),
      OPAtmLocationScreen(),
      OPprofilePage(),
    ];
    var title = '';

    if (_currentIndex == 0) {
      title = 'Dashboard';
    } else if (_currentIndex == 1) {
      title = 'My card';
    } else if (_currentIndex == 2) {
      title = 'Dashboard';
    } else if (_currentIndex == 3) {
      title = 'ATM Location';
    } else if (_currentIndex == 4) {
      title = 'Profile';
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _currentIndex == 0
              ? getAppBar1(title, actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(
                      "images/orapay/op_profile.png",
                      width: 30,
                      height: 30,
                    ),
                  )
                ])
              : getAppBar(title, pressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                }),
          body: tab[_currentIndex],
          bottomNavigationBar: Stack(
            alignment: Alignment.center,
            children: [
              BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                selectedItemColor: opPrimaryColor,
                unselectedItemColor: opSecondaryColor.withOpacity(0.6),
                currentIndex: _currentIndex,
                elevation: 8.0,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 24,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.credit_card,
                        size: 24,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset(
                          'images/orapay/opsplash.png',
                          width: 36,
                          height: 36,
                          color: Colors.white,
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.location_on,
                        size: 24,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 24,
                      ),
                      label: ''),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OPTransferScreen(),
                    ),
                  );
                },
                child: Image.asset('images/orapay/opsplash.png', width: 36, height: 36),
              )
            ],
          )),
    );
  }
}
