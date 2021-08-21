import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class DTPaymentProcessScreen extends StatefulWidget {
  final bool? isSuccessFul;

  DTPaymentProcessScreen({this.isSuccessFul});

  @override
  _DTPaymentProcessScreenState createState() => _DTPaymentProcessScreenState();
}

class _DTPaymentProcessScreenState extends State<DTPaymentProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.isSuccessFul! ? 'images/defaultTheme/successfull.png' : 'images/defaultTheme/cancel.png',
                height: 100,
                width: 100,
              ),
              8.height,
              Text(
                widget.isSuccessFul! ? 'Payment Successful' : 'Payment Failed',
                style: boldTextStyle(color: widget.isSuccessFul! ? greenColor : redColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
