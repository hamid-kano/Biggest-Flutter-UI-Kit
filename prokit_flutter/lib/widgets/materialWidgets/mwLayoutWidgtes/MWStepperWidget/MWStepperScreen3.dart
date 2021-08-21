import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWStepperScreen3 extends StatefulWidget {
  static const tag = '/MWStepperScreen3';

  @override
  _MWStepperScreen3State createState() => _MWStepperScreen3State();
}

class _MWStepperScreen3State extends State<MWStepperScreen3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: appBar(context, 'Stepper'), body: StepperBody()),
    );
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  int currStep = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text('Name', style: primaryTextStyle()),
        isActive: currStep == 0,
        state: StepState.indexed,
        content: Column(
          children: [
            TextFormField(
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                labelText: 'Email',
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                hintText: 'Enter Email',
                icon: Icon(Icons.email, color: appStore.iconColor),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                labelText: 'Password',
                hintText: 'Enter Password',
                icon: Icon(Icons.lock, color: appStore.iconColor),
              ),
            ),
          ],
        ),
      ),
      Step(
        title: Text('Address', style: primaryTextStyle()),
        isActive: currStep == 1,
        state: StepState.indexed,
        content: TextFormField(
          keyboardType: TextInputType.phone,
          autocorrect: false,
          maxLines: 1,
          style: primaryTextStyle(),
          decoration: InputDecoration(
            labelText: 'Enter Address',
            hintStyle: secondaryTextStyle(),
            labelStyle: secondaryTextStyle(),
            icon: Icon(Icons.edit_location, color: appStore.iconColor),
          ),
        ),
      ),
      Step(
        title: Text('Avatar', style: primaryTextStyle()),
        isActive: currStep == 2,
        state: StepState.indexed,
        content: Text("Add your image", style: primaryTextStyle()),
      ),
    ];

    return Container(
      child: CustomTheme(
        child: Stepper(
          steps: steps,
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
    );
  }
}
