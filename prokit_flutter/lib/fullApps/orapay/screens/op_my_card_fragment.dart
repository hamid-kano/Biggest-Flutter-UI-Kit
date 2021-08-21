import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

// ignore: non_constant_identifier_names
Widget OPMyCards() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '1234',
          expire: '12/24',
          name: 'John Doe',
          color: opPrimaryColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '5678',
          expire: '12/24',
          name: 'John Doe',
          color: opOrangeColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '9112',
          expire: '12/24',
          name: 'John Doe',
          color: opPrimaryColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '5678',
          expire: '12/24',
          name: 'John Doe',
          color: opOrangeColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '7677',
          expire: '12/24',
          name: 'John Doe',
          color: opPrimaryColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '7458',
          expire: '12/24',
          name: 'John Doe',
          color: opOrangeColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '1256',
          expire: '12/24',
          name: 'John Doe',
          color: opPrimaryColor,
        ),
        CardDetails(
          visaTitle: 'Visa',
          creditNumber: '2222',
          expire: '12/24',
          name: 'John Doe',
          color: opOrangeColor,
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFE4E6FF),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: opPrimaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 40,
                width: 40,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                "Add new card",
                style: TextStyle(),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
