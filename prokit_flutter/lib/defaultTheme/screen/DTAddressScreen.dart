import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTAddressListModel.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DTDrawerWidget.dart';

class DTAddressScreen extends StatefulWidget {
  static String tag = '/DTAddressScreen';

  @override
  DTAddressScreenState createState() => DTAddressScreenState();
}

class DTAddressScreenState extends State<DTAddressScreen> {
  List<DTAddressListModel> list = getAddressList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Address Manager'),
      drawer: DTDrawerWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            8.height,
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(8)),
              child: Text('Add New Address', style: boldTextStyle(color: appColorPrimary)),
            ).onTap(() async {
              DTAddressListModel? model = await showInDialog(context, child: AddAddressDialog(), backgroundColor: Colors.transparent, contentPadding: EdgeInsets.all(0));

              if (model != null) {
                list.add(model);

                setState(() {});
              }
            }),
            ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                DTAddressListModel data = list[index];

                return Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(data.name!, style: boldTextStyle(size: 18)),
                              10.width,
                              Container(
                                child: Text(data.type.validate(), style: secondaryTextStyle(size: 10, color: appColorPrimary)),
                                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                                decoration: BoxDecoration(color: appColorPrimary.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          ),
                          Icon(Icons.phone, color: appColorPrimary).onTap(() {
                            launch('tel:${data.phoneNo}');
                          }),
                        ],
                      ),
                      Text(data.addressLine1!, style: primaryTextStyle()),
                      Text(data.addressLine2!, style: primaryTextStyle()),
                      6.height,
                    ],
                  ),
                ).onTap(() {
                  finish(context, data);
                });
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AddAddressDialog extends StatefulWidget {
  @override
  _AddAddressDialogState createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {
  var nameCont = TextEditingController();
  var addressLine1Cont = TextEditingController();
  var addressLine2Cont = TextEditingController();
  var typeCont = TextEditingController();
  var mobileCont = TextEditingController();

  var addressLine1Focus = FocusNode();
  var addressLine2Focus = FocusNode();
  var typeFocus = FocusNode();
  var mobileFocus = FocusNode();
  var autoValidate = false;
  var formKey = GlobalKey<FormState>();

  validate() {
    if (formKey.currentState!.validate()) {
      hideKeyboard(context);
      toast('Adding Successfully');
      formKey.currentState!.save();

      var addressData = DTAddressListModel();
      addressData.name = nameCont.text.validate();
      addressData.addressLine1 = addressLine1Cont.text.validate();
      addressData.addressLine2 = addressLine2Cont.text.validate();
      addressData.phoneNo = mobileCont.text.validate();
      addressData.type = 'Office';

      finish(context, addressData);
    } else {
      autoValidate = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: dynamicBoxConstraints(),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appStore.scaffoldBackground,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add New Address', style: boldTextStyle(size: 18)),
                    IconButton(
                      icon: Icon(Icons.close, color: appStore.iconColor),
                      onPressed: () {
                        finish(context);
                      },
                    )
                  ],
                ),
                8.height,
                TextFormField(
                  controller: nameCont,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    contentPadding: EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                  onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(mobileFocus),
                  textInputAction: TextInputAction.next, // when user presses enter it will adapt to it
                ),
                8.height,
                TextFormField(
                  controller: mobileCont,
                  focusNode: mobileFocus,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Mobile No',
                    contentPadding: EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    if (!s.trim().validatePhone()) return 'Mobile is invalid';
                    return null;
                  },
                  onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(addressLine1Focus),
                  textInputAction: TextInputAction.next,
                ),
                8.height,
                TextFormField(
                  controller: addressLine1Cont,
                  focusNode: addressLine1Focus,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Address line 1',
                    contentPadding: EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                  ),
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                  onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(addressLine2Focus),
                  textInputAction: TextInputAction.newline, // when user presses enter it will adapt to it
                ),
                8.height,
                TextFormField(
                  controller: addressLine2Cont,
                  focusNode: addressLine2Focus,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Address line 2',
                    contentPadding: EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                  ),
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                  textInputAction: TextInputAction.newline, // when user presses enter it will adapt to it
                ),
                8.height,
                16.height,
                GestureDetector(
                  onTap: () {
                    validate();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.all(Radius.circular(5))),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Center(
                      child: Text("Submit", style: boldTextStyle(color: white)),
                    ),
                  ),
                ),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
