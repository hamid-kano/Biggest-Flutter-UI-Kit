import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/network/rest_apis.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class PostMethodExampleScreen extends StatefulWidget {
  static String tag = '/PostMethodExampleScreen';

  @override
  PostMethodExampleScreenState createState() => PostMethodExampleScreenState();
}

class PostMethodExampleScreenState extends State<PostMethodExampleScreen> {
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;
  var isLoading = false;

  var nameCont = TextEditingController();
  var salaryCont = TextEditingController();
  var ageCont = TextEditingController();

  var nameNode = FocusNode();
  var salaryNode = FocusNode();
  var ageNode = FocusNode();

  save() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      Map req = {"name": nameCont.text, "salary": salaryCont.text, "age": ageCont.text};

      await createEmployee(req).then((value) {
        isLoading = false;
        toast(value['message']);

        finish(context);
      }).catchError((e) {
        isLoading = false;
        toast(e.toString());
      });
    } else {
      isLoading = false;
      autoValidate = true;
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'POST method'),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    16.height,
                    TextFormField(
                      controller: nameCont,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        labelStyle: primaryTextStyle(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                      ),
                      focusNode: nameNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(salaryNode),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: salaryCont,
                      keyboardType: TextInputType.number,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Salary',
                        border: OutlineInputBorder(),
                        labelStyle: primaryTextStyle(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                      ),
                      focusNode: salaryNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        if (!s.isDigit()) return 'Please enter valid data';
                        return null;
                      },
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(ageNode),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: ageCont,
                      keyboardType: TextInputType.number,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                        labelStyle: primaryTextStyle(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                      ),
                      focusNode: ageNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        if (!s.isDigit()) return 'Please enter valid data';
                        return null;
                      },
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {
                        save();
                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        decoration: boxDecoration(bgColor: appColorPrimary, radius: 16),
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text("Submit", style: primaryTextStyle(color: white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CircularProgressIndicator().center().visible(isLoading)
        ],
      ),
    );
  }
}
