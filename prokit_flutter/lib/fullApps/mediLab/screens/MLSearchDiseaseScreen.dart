import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCommonDiseaseListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDiseaseData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLSearchDiseaseScreen extends StatefulWidget {
  static String tag = '/MLSearchDiseaseScreen';

  @override
  MLSearchDiseaseScreenState createState() => MLSearchDiseaseScreenState();
}

class MLSearchDiseaseScreenState extends State<MLSearchDiseaseScreen> {
  TextEditingController searchController = TextEditingController();
  late final Autocomplete textField;
  List<MLDiseaseData> data = mlDiseaseDataList();
  List<String?> choice = ['Covid-19', 'Fever', 'Black Eye', 'Headache', 'Stomachache', 'Covid-19', 'Fever', 'Black Eye', 'Headache', 'Stomachache'];
  bool? selectedIndex = false;
  int? _value = 1;

  static String _displayStringForOption(MLDiseaseData option) => option.title.validate();

  @override
  void initState() {
    super.initState();
    textField = Autocomplete<MLDiseaseData>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<MLDiseaseData>.empty();
        }
        return data.where(
          (MLDiseaseData title) {
            return title.toString().contains('');
          },
        );
      },
      onSelected: (MLDiseaseData title) {
        print('You just selected');
      },
    );
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  mlBackToPreviousIcon(context, white),
                  8.width,
                  Text('Search', style: boldTextStyle(size: 20, color: white)).expand(),
                ],
              ).paddingAll(16.0),
              16.height,
              Container(
                padding: EdgeInsets.all(16.0),
                width: context.width(),
                decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search, color: mlColorBlue, size: 24).expand(flex: 1),
                        8.width,
                        textField.expand(flex: 13),
                        Icon(Icons.mic, color: Colors.grey, size: 24).expand(flex: 1),
                      ],
                    ),
                    32.height,
                    Text('Popular search', style: boldTextStyle()),
                    16.height,
                    Wrap(
                      spacing: 8.0,
                      children: List.generate(choice.length, (index) {
                        return ChoiceChip(
                          labelStyle: boldTextStyle(color: Colors.blue.shade900, size: 14),
                          backgroundColor: mlColorGreyShade,
                          selectedColor: Colors.blue,
                          label: Text(choice[index].validate()).paddingOnly(right: 8.0, left: 8.0),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                        );
                      }),
                    ),
                    16.height,
                    Divider(thickness: 0.5),
                    16.height,
                    Text('Common Disease', style: boldTextStyle()),
                    16.height,
                    MLCommonDiseaseListComponent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
