class QIBusBookingModel {
  var destination;
  var duration;
  var startTime;
  var totalTime;
  var endTime;
  var seatNo;
  var passengerName;
  var ticketNo;
  var pnrNo;
  var status;
  var totalFare;
  var img;

  QIBusBookingModel(this.destination, this.duration);

  QIBusBookingModel.booking(
      this.destination, this.duration, this.startTime, this.totalTime, this.endTime, this.seatNo, this.passengerName, this.ticketNo, this.pnrNo, this.status, this.totalFare, this.img);
}

class QIBusCardModel {
  var cardType;
  var cardBg;
  var txtDigit1;
  var txtDigit2;
  var txtDigit3;
  var txtDigit4;
  var mValidDate;
  var txtHolderName;

  QIBusCardModel(
    this.cardType,
    this.cardBg,
    this.txtDigit1,
    this.txtDigit2,
    this.txtDigit3,
    this.txtDigit4,
    this.mValidDate,
    this.txtHolderName,
  );
}

class QIBusDroppingModel {
  var travelName;
  var location;
  var duration;

  QIBusDroppingModel(this.travelName, this.location, this.duration);
}

class QIBusModel {
  var travelerName;
  var startTime;
  var mStartTimeAA;
  var endTime;
  var mEndTimeAA;
  var totalDuration;
  var hold;
  var typeCoach;
  var rate;
  var price;

  QIBusModel(this.travelerName, this.startTime, this.mStartTimeAA, this.endTime, this.mEndTimeAA, this.totalDuration, this.hold, this.typeCoach, this.rate, this.price);
}

class QIBusNewOfferModel {
  var useCode;
  var img;
  var color;

  QIBusNewOfferModel(this.useCode, this.img, this.color);
}

class QIBusNewPackageModel {
  var destination;
  var duration;
  var rating;
  var newPrice;
  var booking;
  var image;

  QIBusNewPackageModel(
    this.destination,
    this.duration,
    this.rating,
    this.newPrice,
    this.booking,
    this.image,
  );
}

enum QIBusSeatType { EMPTY, BOOKED, LADIES }

class QIBusSeatModel {
  var isSelected = false;
  var type1 = QIBusSeatType;
  var flag;

  QIBusSeatModel(QIBusSeatType type, this.flag);
}
