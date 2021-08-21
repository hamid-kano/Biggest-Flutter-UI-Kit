import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';

import 'QiBusImages.dart';
import 'QiBusStrings.dart';

// ignore: non_constant_identifier_names
List<QIBusBookingModel> QIBusGetData() {
  List<QIBusBookingModel> mRecentSearchList = [];
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_DelhiToMubai, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_MumbaiToPune, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_AhmedabadToMumbai, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_JaipurToNewDelhi, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_MumbaiToSurat, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_DelhiToMubai, QIBus_lbl_date));
  mRecentSearchList.add(new QIBusBookingModel(QIBus_lbl_MumbaiToSurat, QIBus_lbl_date));
  return mRecentSearchList;
}

// ignore: non_constant_identifier_names
List<QIBusNewOfferModel> QIBusGetOffer() {
  List<QIBusNewOfferModel> mNewOfferList = [];
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer1, qibus_ic_sale_1, qIBus_darkBlue));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer2, qibus_ic_sale_2, qIBus_purple));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer1, qibus_ic_sale_1, qIBus_darkGreen));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer2, qibus_ic_sale_2, qIBus_darkBlue));
  mNewOfferList.add(new QIBusNewOfferModel(QIBus_lbl_offer1, qibus_ic_sale_1, qIBus_purple));
  return mNewOfferList;
}

// ignore: non_constant_identifier_names
List<QIBusBookingModel> QIBusGetBook() {
  List<QIBusBookingModel> mBookList = [];
  mBookList.add(QIBusBookingModel.booking(QIBus_lbl_DelhiToMubai, QIBus_lbl_booking_date1, QIBus_lbl_booking_starttime1, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime1,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno1, QIBus_lbl_booking_pnr1, QIBus_lbl_booking_totalfare1, QIBus_text_confirmed, qibus_ic_completed));
  mBookList.add(QIBusBookingModel.booking(QIBus_lbl_MumbaiToPune, QIBus_lbl_booking_date2, QIBus_lbl_booking_starttime2, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime2,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno2, QIBus_lbl_booking_pnr21, QIBus_lbl_booking_totalfare2, QIBus_text_confirmed, qibus_ic_completed));
  return mBookList;
}

// ignore: non_constant_identifier_names
List<QIBusBookingModel> QIBusGetCancelBook() {
  List<QIBusBookingModel> mCancelList = [];
  mCancelList.add(QIBusBookingModel.booking(QIBus_lbl_MumbaiToPune, QIBus_lbl_booking_date1, QIBus_lbl_booking_starttime1, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime1,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno1, QIBus_lbl_booking_pnr1, QIBus_lbl_booking_totalfare1, QIBus_txt_cancelled, qibus_ic_canceled));
  return mCancelList;
}

// ignore: non_constant_identifier_names
List<QIBusModel> QIBusGetBusList() {
  List<QIBusModel> mBusList = [];
  mBusList.add(QIBusModel(
      QIBus_lbl_travel_name, QIBus_lbl_booking_starttime1, QIBus_text_am, QIBus_lbl_booking_endtime1, QIBus_text_pm, QIBus_lbl_totalDuration, QIBus_lbl_hold, QIBus_lbl_type1, 3, QIBus_lbl_price1));
  mBusList.add(QIBusModel(
      QIBus_lbl_travel_name, QIBus_lbl_booking_starttime1, QIBus_text_am, QIBus_lbl_booking_endtime1, QIBus_text_pm, QIBus_lbl_totalDuration, QIBus_lbl_hold, QIBus_lbl_type1, 3, QIBus_lbl_price2));
  mBusList.add(QIBusModel(
      QIBus_lbl_travel_name, QIBus_lbl_booking_starttime1, QIBus_text_am, QIBus_lbl_booking_endtime1, QIBus_text_pm, QIBus_lbl_totalDuration, QIBus_lbl_hold, QIBus_lbl_type2, 3, QIBus_lbl_price1));
  return mBusList;
}

// ignore: non_constant_identifier_names
List<QIBusBookingModel> QIBusGetNotification() {
  List<QIBusBookingModel> mNotificationList = [];
  mNotificationList.add(QIBusBookingModel.booking(QIBus_lbl_DelhiToMubai, QIBus_lbl_booking_duration1, QIBus_lbl_booking_starttime1, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime1,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno1, QIBus_lbl_booking_pnr1, QIBus_lbl_booking_totalfare1, QIBus_text_confirmed, qibus_ic_completed));
  mNotificationList.add(QIBusBookingModel.booking(QIBus_lbl_MumbaiToPune, QIBus_lbl_booking_duration2, QIBus_lbl_booking_starttime2, QIBus_lbl_booking_totaltime1, QIBus_lbl_booking_endtime2,
      QIBus_lbl_booking_SeatNo1, QIBus_lbl_booking_passenger_name1, QIBus_lbl_booking_ticketno2, QIBus_lbl_booking_pnr21, QIBus_lbl_booking_totalfare2, QIBus_text_confirmed, qibus_ic_completed));
  return mNotificationList;
}

// ignore: non_constant_identifier_names
List<QIBusSeatModel> QIBusSeat() {
  List<QIBusSeatModel> mNotificationList = [];
  for (int i = 0; i <= 5; i++) {
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.BOOKED, 2));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.LADIES, 3));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
    mNotificationList.add(QIBusSeatModel(QIBusSeatType.EMPTY, 1));
  }
  return mNotificationList;
}

// ignore: non_constant_identifier_names
List<QIBusCardModel> QIBusGetCards() {
  List<QIBusCardModel> mCardList = [];
  mCardList.add(QIBusCardModel(
      QIBus_lbl_card_type2, qibus_ic_card, QIBus_lbl_card_digit1, QIBus_lbl_card_digit2, QIBus_lbl_card_digit3, QIBus_lbl_card_digit4, QIBus_lbl_card_validdate1, QIBus_lbl_booking_passenger_name1));
  mCardList.add(QIBusCardModel(
      QIBus_lbl_card_type2, qibus_ic_card3, QIBus_lbl_card_digit2, QIBus_lbl_card_digit4, QIBus_lbl_card_digit1, QIBus_lbl_card_digit3, QIBus_lbl_card_validdate1, QIBus_lbl_booking_passenger_name1));
  return mCardList;
}

// ignore: non_constant_identifier_names
List<QIBusCardModel> QIBusGetPayment() {
  List<QIBusCardModel> mCardList = [];
  mCardList.add(QIBusCardModel(
      QIBus_lbl_card_type2, qibus_ic_card3, QIBus_lbl_card_digit2, QIBus_lbl_card_digit4, QIBus_lbl_card_digit1, QIBus_lbl_card_digit3, QIBus_lbl_card_validdate1, QIBus_lbl_booking_passenger_name1));
  return mCardList;
}

// ignore: non_constant_identifier_names
List<QIBusDroppingModel> QIBusGetPickUp() {
  List<QIBusDroppingModel> mPickUpList = [];
  mPickUpList.add(QIBusDroppingModel(QIBus_lbl_pickup1, QIBus_lbl_location1, QIBus_lbl_duration1));
  mPickUpList.add(QIBusDroppingModel(QIBus_lbl_pickup2, QIBus_lbl_location1, QIBus_lbl_duration1));
  return mPickUpList;
}

// ignore: non_constant_identifier_names
List<QIBusDroppingModel> QIBusGetDroppingPoint() {
  List<QIBusDroppingModel> mDroppingList = [];
  mDroppingList.add(QIBusDroppingModel(QIBus_lbl_dropping1, QIBus_lbl_location1, QIBus_lbl_duration1));
  mDroppingList.add(QIBusDroppingModel(QIBus_lbl_dropping2, QIBus_lbl_location1, QIBus_lbl_duration1));
  return mDroppingList;
}

// ignore: non_constant_identifier_names
List<QIBusNewPackageModel> QIBusGetPackage() {
  List<QIBusNewPackageModel> mPackageList = [];
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_goa, QIBus_lbl_package_duration1, QIBus_lbl_package_rate1, QIBus_lbl_package_price1, QIBus_lbl_package_booking1, qibus_ic_goa));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_amritsar, QIBus_lbl_package_duration2, QIBus_lbl_package_rate3, QIBus_lbl_package_price2, QIBus_lbl_package_bookin2, qibus_ic_amritsar));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_andaman, QIBus_lbl_package_duration3, QIBus_lbl_package_rate5, QIBus_lbl_package_price3, QIBus_lbl_package_booking3, qibus_ic_andamans));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_delhi, QIBus_lbl_package_duration1, QIBus_lbl_package_rate4, QIBus_lbl_package_price4, QIBus_lbl_package_booking1, qibus_ic_delhi));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_shimla, QIBus_lbl_package_duration1, QIBus_lbl_package_rate4, QIBus_lbl_package_price5, QIBus_lbl_package_bookin2, qibus_ic_temp));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_udaipur, QIBus_lbl_package_duration2, QIBus_lbl_package_rate5, QIBus_lbl_package_price1, QIBus_lbl_package_booking1, qibus_ic_udaipur));
  return mPackageList;
}

// ignore: non_constant_identifier_names
List<QIBusNewPackageModel> QIBusGetPackageList() {
  List<QIBusNewPackageModel> mPackageList = [];
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_amritsar, QIBus_lbl_package_duration2, QIBus_lbl_package_rate3, QIBus_lbl_package_price2, QIBus_lbl_package_bookin2, qibus_ic_amritsar));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_delhi, QIBus_lbl_package_duration1, QIBus_lbl_package_rate4, QIBus_lbl_package_price4, QIBus_lbl_package_booking1, qibus_ic_delhi));
  mPackageList.add(QIBusNewPackageModel(QIBus_lbl_udaipur, QIBus_lbl_package_duration2, QIBus_lbl_package_rate5, QIBus_lbl_package_price1, QIBus_lbl_package_booking1, qibus_ic_udaipur));
  return mPackageList;
}
