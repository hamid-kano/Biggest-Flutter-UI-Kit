class AddPayment {
  var cardName;
  var cardNumber;
  var expMonth;
  var expYear;
  var bankName;
  var cardType;

  AddPayment({this.cardName, this.cardNumber, this.expMonth, this.expYear, this.bankName, this.cardType});
}

List<AddPayment> addPayment = [
  AddPayment(
    cardName: 'Ishan Madushka',
    cardNumber: '.... .... .... 4567',
    expMonth: '06',
    expYear: '2022',
    bankName: 'Commercial Bank',
    cardType: 'visa',
  ),
  AddPayment(
    cardName: 'Ishan Madushka',
    cardNumber: '.... .... .... 2345',
    expMonth: '08',
    expYear: '2025',
    bankName: 'Sampath Bank',
    cardType: 'master',
  ),
];
