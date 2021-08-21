import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/FUserListScreen.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/model/FBusermodel.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class FAddUserScreen extends StatefulWidget {
  FBUserModel? data;

  FAddUserScreen({this.data});

  @override
  _FAddUserScreenState createState() => _FAddUserScreenState();
}

class _FAddUserScreenState extends State<FAddUserScreen> {
  final _addItemFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingValue agevalue = TextEditingValue();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  bool isUpdate = false;

  int age = 1;
  List<int> ageList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    for (int i = 0; i <= 100; i++) {
      ageList.add(i);
    }
    isUpdate = widget.data != null;
    log('isUpdate ${isUpdate.toString()}');
    if (isUpdate) {
      nameController.text = widget.data!.name.validate();
      emailController.text = widget.data!.email.validate();
      age = widget.data!.age.validate();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        isUpdate ? 'Update user' : 'Add user',
        center: true,
        color: appColorPrimary,
        textColor: white,
        elevation: 0,
        actions: !isUpdate
            ? null
            : [
                IconButton(
                    color: Colors.white,
                    onPressed: () {
                      showConfirmDialogCustom(
                        context,
                        onAccept: (contexts) {
                          snackBar(
                            context,
                            title: "Deleted Successfully",
                            backgroundColor: appStore.isDarkModeOn ? context.cardColor : context.iconColor,
                          );
                          userService.removeDocument(widget.data!.id.validate()).then((value) {
                            finish(context);
                          }).catchError((e) {
                            toast(e.toString());
                          });
                        },
                        dialogType: DialogType.DELETE,
                        title: 'Are you sure you want to delete this user?'
                      );
                    },
                    icon: Icon(Icons.delete))
              ],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _addItemFormKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AppTextField(
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: primaryTextStyle(size: 18),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                  ),
                ),
                focus: nameFocus,
                nextFocus: emailFocus,
                errorThisFieldRequired: 'This field is required',
              ),
              16.height,
              AppTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textFieldType: TextFieldType.EMAIL,
                focus: emailFocus,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: primaryTextStyle(size: 18),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                  ),
                ),
              ),
              16.height,
              DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                    labelText: 'age',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(  color: appStore.isDarkModeOn ? white : black,),
                    )),
                value: age,
                items: List.generate(ageList.length, (index) {
                  return DropdownMenuItem(
                    value: ageList[index],
                    child: Text('$index', style: primaryTextStyle()),
                  );
                }),
                onChanged: (dynamic value) {
                  age = value;
                  setState(() { });
                },
              ),
              24.height,
              AppButton(
                width: context.width(),
                text: isUpdate ? 'Update User' : 'Add User',
                textColor: Colors.white,
                color: appColorPrimary,
                onTap: () async {
                  if (_addItemFormKey.currentState!.validate()) {
                    _addItemFormKey.currentState!.save();

                    hideKeyboard(context);
                    FBUserModel data = FBUserModel();
                    data.name = nameController.text;
                    data.email = emailController.text;
                    data.age = age;

                    if (isUpdate) {
                      data.id = widget.data!.id.validate();
                    }

                    log(data.toJson());

                    if (!isUpdate) {
                      showConfirmDialogCustom(context, onAccept: (contexts) async {
                        await userService.addDocument(data.toJson()).then((value) {
                          snackBar(
                            context,
                            title: "Added Successfully",
                            backgroundColor: appStore.isDarkModeOn ? context.cardColor : context.iconColor,
                          );

                          finish(context);
                        }).catchError((e) {
                          log(e.toString());
                        });
                      }, dialogType: DialogType.ADD, title: 'Are you sure you want to add this user?');
                    } else {
                      showConfirmDialogCustom(
                        context,
                        onAccept: (contexts) async {
                          await userService.updateDocument(data.toJson(), widget.data!.id.validate()).then((value) {
                            snackBar(
                              context,
                              title: "Updated successfully",
                              backgroundColor: appStore.isDarkModeOn ? context.cardColor : context.iconColor,
                            );

                            finish(context);
                          }).catchError((e) {
                            log(e.toString());
                          });
                        },
                        dialogType: DialogType.UPDATE,
                        title: 'Are you sure you want to update this user?'
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
