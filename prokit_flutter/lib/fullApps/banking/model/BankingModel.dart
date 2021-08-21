import 'package:flutter/cupertino.dart';

class BankingShareInfoModel {
  String icon = "";

  BankingShareInfoModel(this.icon);
}

class BankingQuesAnsModel {
  String ques = "";

  BankingQuesAnsModel(this.ques);
}

class BankingSavingModel {
  String? title = "";
  String? date = "";
  String? rs = "";
  String? interest = "";

  BankingSavingModel({this.title, this.date, this.rs, this.interest});
}

class BankingPaymentModel {
  String? title = "";
  String? img = "";
  Color? color;

  BankingPaymentModel({this.title, this.img, this.color});
}

class BankingCardModel {
  String? name = "";
  String? bank = "";
  String? rs = "";

  BankingCardModel({this.name, this.bank, this.rs});
}

class BankingPaymentHistoryModel {
  String? title = "";
  String? rs = "";

  BankingPaymentHistoryModel({this.title, this.rs});
}

class BankingRateInfoModel {
  String? currency = "";
  String? flag = "";
  String? buy = "";
  String? sell = "";

  BankingRateInfoModel({this.currency, this.flag, this.buy, this.sell});
}

class BankingHomeModel {
  String? title = "";
  Color? color;
  String? bal = "";

  BankingHomeModel({this.title, this.color, this.bal});
}

class BankingLocationModel {
  String? location = "";
  String? m = "";

  BankingLocationModel({this.location, this.m});
}

class BankingHomeModel2 {
  String? title = "";
  String? icon = "";
  Color? color;
  String? charge = "";

  BankingHomeModel2({this.title, this.icon, this.color, this.charge});
}
