import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';

List<BankingShareInfoModel> bankingInfoList() {
  List<BankingShareInfoModel> list = [];

  var list1 = BankingShareInfoModel(Banking_ic_Skype);
  list.add(list1);

  var list2 = BankingShareInfoModel(Banking_ic_Inst);
  list.add(list2);

  var list3 = BankingShareInfoModel(Banking_ic_WhatsApp);
  list.add(list3);

  var list4 = BankingShareInfoModel(Banking_ic_messenger);
  list.add(list4);

  var list5 = BankingShareInfoModel(Banking_ic_facebook);
  list.add(list5);

  return list;
}

List<BankingShareInfoModel> bankingNewsList() {
  List<BankingShareInfoModel> list = [];

  var list1 = BankingShareInfoModel(Banking_ic_walk1);
  list.add(list1);

  var list2 = BankingShareInfoModel(Banking_ic_walk2);
  list.add(list2);

  var list3 = BankingShareInfoModel(Banking_ic_walk3);
  list.add(list3);

  return list;
}

List<BankingQuesAnsModel> bankingQuestionList() {
  List<BankingQuesAnsModel> list = [];

  var list1 = BankingQuesAnsModel("Question: lorem ipsum doller sit ?");
  list.add(list1);

  var list2 = BankingQuesAnsModel("Money return when you go shopping with credit card of Cy Captial Bank ?");
  list.add(list2);

  var list3 = BankingQuesAnsModel("Each payment process is so simple and hassle - free ?");
  list.add(list3);

  var list4 = BankingQuesAnsModel("Cy Captial Bank give a giftbox for new customers who create account ?");
  list.add(list4);

  var list5 = BankingQuesAnsModel("Each payment process is so simple and hassle - free ?");
  list.add(list5);

  var list6 = BankingQuesAnsModel("Money return when you go shopping with credit card of Cy Captial Bank ?");
  list.add(list6);

  return list;
}

List<BankingSavingModel> bankingSavingList() {
  List<BankingSavingModel> list = [];

  var list1 = BankingSavingModel(title: "Saving 1", date: "22 Apr 2020", rs: "\$12,000", interest: "Interest 8 % - 8 Months");
  list.add(list1);

  var list2 = BankingSavingModel(title: "Saving 2", date: "22 Mar 2020", rs: "\$20,000", interest: "Interest 4 % - 2 Months");
  list.add(list2);

  return list;
}

List<BankingPaymentModel> bankingPaymentList() {
  List<BankingPaymentModel> list = [];

  var list1 = BankingPaymentModel(title: "Payment Electricity", img: Banking_ic_Electricity, color: Banking_Primary);
  list.add(list1);

  var list2 = BankingPaymentModel(title: "Payment Water", img: Banking_ic_WaterDrop);
  list.add(list2);

  var list3 = BankingPaymentModel(title: "Payment Internet", img: Banking_ic_Website, color: Banking_blueColor);
  list.add(list3);

  var list4 = BankingPaymentModel(title: "Mobile PrePaid", img: Banking_ic_Mobile, color: Banking_palColor);
  list.add(list4);

  var list5 = BankingPaymentModel(title: "Pay Google Play", img: Banking_ic_PlayStore, color: Banking_greenLightColor);
  list.add(list5);

  var list6 = BankingPaymentModel(title: "Pay iOS Store", img: Banking_ic_apple, color: Banking_greyColor);
  list.add(list6);

  var list7 = BankingPaymentModel(title: "Buy Lottery tickets", img: Banking_ic_Ticket, color: Banking_RedColor);
  list.add(list7);

  var list8 = BankingPaymentModel(title: "Buy train tickets", img: Banking_ic_Train, color: Banking_blueColor);
  list.add(list8);

  var list9 = BankingPaymentModel(title: "Buy air ticket", img: Banking_ic_plane, color: Banking_palColor);
  list.add(list9);

  var list10 = BankingPaymentModel(title: "Shopping Online", img: Banking_ic_ShoppingCart, color: Banking_Primary);
  list.add(list10);

  var list11 = BankingPaymentModel(title: "Booking Hotel", img: Banking_ic_Hotel, color: Banking_greenLightColor);
  list.add(list11);

  return list;
}

List<BankingPaymentModel> bankingPaymentDetailList() {
  List<BankingPaymentModel> list = [];

  var list1 = BankingPaymentModel(title: "Pay New Invoice", img: Banking_ic_Voice, color: Banking_Primary);
  list.add(list1);

  var list2 = BankingPaymentModel(title: "View Payment History", img: Banking_ic_History);
  list.add(list2);

  return list;
}

List<BankingCardModel> bankingCardList() {
  List<BankingCardModel> list = [];
  var list1 = BankingCardModel(name: "Laura Smith", bank: "The Same Bank", rs: "12,500");
  list.add(list1);

  var list2 = BankingCardModel(name: "Adam Johnson", bank: "Union Bank", rs: "18,000");
  list.add(list2);

  var list3 = BankingCardModel(name: "Ana Willson", bank: "Unitied States Bank", rs: "50,000");
  list.add(list3);

  return list;
}

List<BankingPaymentHistoryModel> bankingHistoryList1() {
  List<BankingPaymentHistoryModel> list = [];

  var list1 = BankingPaymentHistoryModel(title: "Payment Invoice # 7783", rs: "-\$200 USD");
  list.add(list1);

  var list2 = BankingPaymentHistoryModel(title: "Payment Invoice S1244", rs: "-\$190 USD");
  list.add(list2);

  return list;
}

List<BankingRateInfoModel> bankingRateInformationList() {
  List<BankingRateInfoModel> list = [];

  var list1 = BankingRateInfoModel(currency: "Euro", flag: Banking_ic_Euro, buy: "1,123", sell: "3,799");
  list.add(list1);

  var list2 = BankingRateInfoModel(currency: "USD", flag: Banking_ic_USD, buy: "1,123", sell: "3.85");
  list.add(list2);

  var list3 = BankingRateInfoModel(currency: "Rup", flag: Banking_ic_Rup, buy: "1.13", sell: "2.87");
  list.add(list3);

  var list4 = BankingRateInfoModel(currency: "CNY", flag: Banking_ic_CNY, buy: "1.0", sell: "3.11");
  list.add(list4);

  var list5 = BankingRateInfoModel(currency: "Won", flag: Banking_ic_Rup, buy: "3.0", sell: "1.11");
  list.add(list5);

  var list6 = BankingRateInfoModel(currency: "Yen", flag: Banking_ic_Yen, buy: "1,123", sell: "2.0");
  list.add(list6);

  var list7 = BankingRateInfoModel(currency: "Euro", flag: Banking_ic_Can, buy: "3.0", sell: "1.56");
  list.add(list7);

  var list8 = BankingRateInfoModel(currency: "USD", flag: Banking_ic_USD, buy: "0.1", sell: "1.11");
  list.add(list8);

  return list;
}

List<BankingHomeModel> bankingHomeList1() {
  List<BankingHomeModel> list = [];
  var list1 = BankingHomeModel(title: "Default Account", color: Banking_BalanceColor, bal: "+\$50 USD");
  list.add(list1);

  var list2 = BankingHomeModel(title: "Adam Johnson", color: Banking_Primary, bal: "-\$20 USD");
  list.add(list2);

  return list;
}

List<BankingHomeModel2> bankingHomeList2() {
  List<BankingHomeModel2> list = [];

  var list1 = BankingHomeModel2(title: "Payment form Paypal", icon: Banking_ic_Paypal, color: Banking_greenLightColor, charge: "+\$50 USD");
  list.add(list1);

  var list2 = BankingHomeModel2(title: "Mastercard Charge", icon: Banking_ic_MasterCard, color: Banking_Primary, charge: "+\$20 USD");
  list.add(list2);

  var list3 = BankingHomeModel2(title: "Shopping at WallMart", icon: Banking_ic_Wallet, color: Banking_Primary, charge: "+\$90 USD");
  list.add(list3);

  return list;
}

List<BankingLocationModel> bankingLocationList() {
  List<BankingLocationModel> list = [];

  var list1 = BankingLocationModel(location: "Branch Canyon", m: "800m");
  list.add(list1);

  var list2 = BankingLocationModel(location: "Branch Kenmore", m: "600m");
  list.add(list2);

  var list3 = BankingLocationModel(location: "Branch Woodinville", m: "600m");
  list.add(list3);

  var list4 = BankingLocationModel(location: "Branch Maltly", m: "2.5km");
  list.add(list4);

  return list;
}
