import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/components/AccountExpansionWidget.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAInterestScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DACreateAccountScreen extends StatefulWidget {
  @override
  DACreateAccountScreenState createState() => DACreateAccountScreenState();
}

class DACreateAccountScreenState extends State<DACreateAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  late DateTime date;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    date = DateTime.now();
    dateController.text = DateFormat('dd/MM/yyyy').format(date);
  }

  pickDate() async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (time != null) {
      setState(() {
        date = time;
        dateController.text = DateFormat('dd/MM/yyyy').format(date);
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('apes', center: true, titleTextStyle: boldTextStyle(size: 25)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.height,
              Text('Create your \naccount', style: boldTextStyle(size: 30)),
              16.height,
              Text('Sign up and get started!', style: primaryTextStyle()),
              16.height,
              AppTextField(
                controller: emailController,
                textStyle: primaryTextStyle(color: black),
                focus: emailFocus,
                textFieldType: TextFieldType.EMAIL,
                cursorColor: white,
                decoration: buildInputDecoration('Name', prefixIcon: Icon(Icons.person_outline, color: primaryColor)),
              ),
              16.height,
              AppTextField(
                controller: dateController,
                textStyle: primaryTextStyle(color: black),
                textFieldType: TextFieldType.OTHER,
                cursorColor: white,
                decoration: buildInputDecoration('Date of Birth', prefixIcon: Icon(Icons.date_range, color: primaryColor)),
                onTap: (){
                  pickDate();
                },
              ),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: black),
                textFieldType: TextFieldType.OTHER,
                cursorColor: white,
                decoration: buildInputDecoration('City', prefixIcon: Icon(Icons.location_on_outlined, color: primaryColor)),
              ),
              16.height,
              AccountExpansionWidget(),
              16.height,
              AppButton(
                text: 'Continue',
                textStyle: boldTextStyle(color: white),
                width: context.width(),
                color: primaryColor,
                onTap: () {
                  finish(context);
                  DAInterestScreen().launch(context);
                },
              )
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
