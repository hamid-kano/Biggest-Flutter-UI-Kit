import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShAddress.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: must_be_immutable
class ShAddNewAddress extends StatefulWidget {
  static String tag = '/AddNewAddress';
  ShAddressModel? addressModel;

  ShAddNewAddress({this.addressModel});

  @override
  ShAddNewAddressState createState() => ShAddNewAddressState();
}

class ShAddNewAddressState extends State<ShAddNewAddress> {
  var primaryColor;
  var firstNameCont = TextEditingController();
  var lastNameCont = TextEditingController();
  var pinCodeCont = TextEditingController();
  var cityCont = TextEditingController();
  var stateCont = TextEditingController();
  var addressCont = TextEditingController();
  var phoneNumberCont = TextEditingController();
  var countryCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    if (widget.addressModel != null) {
      pinCodeCont.text = widget.addressModel!.pinCode!;
      addressCont.text = widget.addressModel!.address!;
      cityCont.text = widget.addressModel!.city!;
      stateCont.text = widget.addressModel!.state!;
      countryCont.text = widget.addressModel!.country!;
      firstNameCont.text = widget.addressModel!.first_name!;
      lastNameCont.text = widget.addressModel!.last_name!;
      phoneNumberCont.text = widget.addressModel!.phone_number!;
    }
  }

  @override
  Widget build(BuildContext context) {
    void onSaveClicked() async {
      Navigator.pop(context, true);
    }
   // TODO Without NullSafety Geo coder
/*    getLocation() async {
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) {
        var coordinates = Coordinates(position.latitude, position.longitude);
        Geocoder.local.findAddressesFromCoordinates(coordinates).then((addresses) {
          var first = addresses.first;
          print("${addresses} : ${first.addressLine}");
          setState(() {
            pinCodeCont.text = first.postalCode;
            addressCont.text = first.addressLine;
            cityCont.text = first.locality;
            stateCont.text = first.adminArea;
            countryCont.text = first.countryName;
          });
        }).catchError((error) {
          print(error);
        });
      }).catchError((error) {
        print(error);
      });
    }*/

    final useCurrentLocation = Container(
      alignment: Alignment.center,
      child: MaterialButton(
        color: sh_light_gray,
        elevation: 0,
        padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
        onPressed: () => {
          // TODO Without NullSafety Geo coder
          //getLocation()
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.my_location,
              color: primaryColor,
              size: 16,
            ),
            SizedBox(width: 10),
            text('Use Current Location', textColor: sh_textColorPrimary, fontFamily: fontMedium)
          ],
        ),
      ),
    );

    final firstName = TextFormField(
      controller: firstNameCont,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      autofocus: false,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      decoration: formFieldDecoration(sh_hint_first_name),
    );

    final lastName = TextFormField(
      controller: lastNameCont,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      autofocus: false,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      decoration: formFieldDecoration(sh_hint_last_name),
    );

    final pinCode = TextFormField(
      controller: pinCodeCont,
      keyboardType: TextInputType.number,
      maxLength: 6,
      autofocus: false,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      decoration: formFieldDecoration(sh_hint_pin_code),
    );

    final city = TextFormField(
      controller: cityCont,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      autofocus: false,
      decoration: formFieldDecoration(sh_hint_city),
    );

    final state = TextFormField(
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      controller: stateCont,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: formFieldDecoration(sh_hint_state),
    );

    final country = TextFormField(
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      controller: countryCont,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: formFieldDecoration("Country"),
    );

    final address = TextFormField(
      controller: addressCont,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      autofocus: false,
      style: TextStyle(fontFamily: fontRegular, fontSize: textSizeMedium),
      decoration: formFieldDecoration(sh_hint_address),
    );

    final phoneNumber = TextFormField(
      controller: phoneNumberCont,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      maxLength: 10,
      autofocus: false,
      decoration: formFieldDecoration(sh_hint_contact),
    );

    final saveButton = MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
      onPressed: () {
        if (firstNameCont.text.isEmpty) {
          toast("First name required");
        } else if (lastNameCont.text.isEmpty) {
          toast("Last name required");
        } else if (phoneNumberCont.text.isEmpty) {
          toast("Phone Number required");
        } else if (addressCont.text.isEmpty) {
          toast("Address required");
        } else if (cityCont.text.isEmpty) {
          toast("City name required");
        } else if (stateCont.text.isEmpty) {
          toast("State name required");
        } else if (countryCont.text.isEmpty) {
          toast("Country name required");
        } else if (pinCodeCont.text.isEmpty) {
          toast("Pincode required");
        } else {
          onSaveClicked();
        }
      },
      color: sh_colorPrimary,
      child: text(sh_lbl_save_address, fontFamily: fontMedium, fontSize: textSizeLargeMedium, textColor: sh_white),
    );

    final body = Wrap(runSpacing: spacing_standard_new, children: <Widget>[
      useCurrentLocation,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: firstName),
          SizedBox(
            width: spacing_standard_new,
          ),
          Expanded(child: lastName),
        ],
      ),
      phoneNumber,
      address,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: city),
          SizedBox(
            width: spacing_standard_new,
          ),
          Expanded(child: state),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(child: country),
          SizedBox(
            width: spacing_standard_new,
          ),
          Expanded(child: pinCode),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: saveButton,
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(widget.addressModel == null ? sh_lbl_add_new_address : sh_lbl_edit_address, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: Container(width: double.infinity, child: SingleChildScrollView(child: body), margin: EdgeInsets.all(16)),
    );
  }
}
