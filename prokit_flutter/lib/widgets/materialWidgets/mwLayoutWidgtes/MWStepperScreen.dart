import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'MWStepperWidget/MWStepperScreen1.dart';
import 'MWStepperWidget/MWStepperScreen2.dart';
import 'MWStepperWidget/MWStepperScreen3.dart';
import 'MWStepperWidget/MWStepperScreen4.dart';

class MWStepperScreen extends StatefulWidget {
  static String tag = '/MWStepperScreen';

  @override
  MWStepperScreenState createState() => MWStepperScreenState();
}

class MWStepperScreenState extends State<MWStepperScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List<ListModel> example = [
    ListModel(
      name: 'Stepper 1',
      widget: MWStepperScreen3(),
    ),
    ListModel(
      name: 'Stepper 2',
      widget: MWStepperScreen2(),
    ),
    ListModel(
      name: 'Stepper 3',
      widget: MWStepperScreen1(),
    ),
    ListModel(
      name: 'Stepper 4',
      widget: MWStepperScreen4(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Stepper'),
        body: ListView.builder(
          itemCount: example.length,
          itemBuilder: (BuildContext context, index) {
            return ExampleItemWidget(example[index], onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
            });
          },
        ),
      ),
    );
  }
}
