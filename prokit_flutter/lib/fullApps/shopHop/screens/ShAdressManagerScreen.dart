import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShAddress.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShAddNewAddress.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';

class ShAddressManagerScreen extends StatefulWidget {
  static String tag = '/AddressManagerScreen';

  @override
  ShAddressManagerScreenState createState() => ShAddressManagerScreenState();
}

class ShAddressManagerScreenState extends State<ShAddressManagerScreen> {
  List<ShAddressModel> addressList = [];
  int? selectedAddressIndex = 0;
  var primaryColor;
  var mIsLoading = true;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    setState(() {
      mIsLoading = true;
    });
    var addresses = await loadAddresses();
    setState(() {
      addressList.clear();
      addressList.addAll(addresses);
      isLoaded = true;
      mIsLoading = false;
    });
  }

  deleteAddress(ShAddressModel model) async {
    setState(() {
      addressList.remove(model);
    });
  }

  editAddress(ShAddressModel model) async {
    var bool = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ShAddNewAddress(
                      addressModel: model,
                    ))) ??
        false;
    if (bool) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listView = ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
      itemBuilder: (item, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: spacing_standard_new),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.green,
                icon: Icons.edit,
                onTap: () => editAddress(addressList[index]),
              )
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.redAccent,
                icon: Icons.delete_outline,
                onTap: () => deleteAddress(addressList[index]),
              ),
            ],
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(spacing_standard_new),
                margin: EdgeInsets.only(
                  right: spacing_standard_new,
                  left: spacing_standard_new,
                ),
                color: sh_item_background,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                        value: index,
                        groupValue: selectedAddressIndex,
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedAddressIndex = value;
                          });
                        },
                        activeColor: primaryColor),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(addressList[index].first_name! + " " + addressList[index].last_name!, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                          text(addressList[index].address, textColor: sh_textColorPrimary, fontSize: textSizeMedium),
                          text(addressList[index].city! + "," + addressList[index].state!, textColor: sh_textColorPrimary, fontSize: textSizeMedium),
                          text(addressList[index].country! + "," + addressList[index].pinCode!, textColor: sh_textColorPrimary, fontSize: textSizeMedium),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          text(addressList[index].phone_number, textColor: sh_textColorPrimary, fontSize: textSizeMedium),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: addressList.length,
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              color: blackColor,
              icon: Icon(Icons.add),
              onPressed: () async {
                var bool = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ShAddNewAddress())) ?? false;
                if (bool) {
                  fetchData();
                }
              })
        ],
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        title: text(sh_lbl_address_manager, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        backgroundColor: whiteColor,
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          listView,
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: sh_colorPrimary,
              elevation: 0,
              padding: EdgeInsets.all(spacing_standard_new),
              child: text("Save", textColor: sh_white, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
              onPressed: () {
                Navigator.pop(context, selectedAddressIndex);
              },
            ),
          )
        ],
      ),
    );
  }
}
