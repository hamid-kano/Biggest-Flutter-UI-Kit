import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../../main.dart';

class MWStepperScreen2 extends StatefulWidget {
  static const tag = '/MWStepperScreen2';

  @override
  _MWStepperScreen2State createState() => _MWStepperScreen2State();
}

class _MWStepperScreen2State extends State<MWStepperScreen2> {
  int currStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text("Contact Detail", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Add Contact Detail", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        isActive: currStep == 0,
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
      ),
      Step(
        title: Text("Shipping Information", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Add Shipping Information", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        isActive: currStep == 1,
      ),
      Step(
        title: Text("Billing Address", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Added Billing Address", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        isActive: currStep == 2,
      ),
      Step(
        title: Text("Payment Flow", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Select Payment method", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        isActive: currStep == 3,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Stepper'),
        body: Theme(
          data: ThemeData(backgroundColor: appStore.scaffoldBackground),
          child: Stepper(
            steps: steps,
            physics: BouncingScrollPhysics(),
            type: StepperType.vertical,
            currentStep: this.currStep,
            controlsBuilder: (BuildContext context, {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: onStepContinue,
                    child: Text('CONTINUE', style: secondaryTextStyle()),
                  ),
                  10.width,
                  TextButton(
                    onPressed: onStepCancel,
                    child: Text('CANCEL', style: secondaryTextStyle()),
                  ),
                ],
              );
            },
            onStepContinue: () {
              setState(() {
                if (currStep < steps.length - 1) {
                  currStep = currStep + 1;
                } else {
                  //currStep = 0;
                  finish(context);
                }
              });
            },
            onStepCancel: () {
              finish(context);
              setState(() {
                if (currStep > 0) {
                  currStep = currStep - 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepTapped: (step) {
              setState(() {
                currStep = step;
              });
            },
          ),
        ),
      ),
    );
  }
}
