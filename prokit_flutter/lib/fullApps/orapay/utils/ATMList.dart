import 'package:google_maps_flutter/google_maps_flutter.dart';

class Atm {
  String? shopName;
  String? address;
  String? time;
  String? thumbNail;
  LatLng? locationCoords;

  Atm({this.shopName, this.address, this.time, this.thumbNail, this.locationCoords});
}

final List<Atm> atmList = [
  Atm(
      shopName: 'SBI ATM',
      address: 'Saribujrang',
      time: '4Min',
      locationCoords: LatLng(20.8092432, 72.9578672),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Atm(
      shopName: 'Axis ATM',
      address: 'Saribujrang',
      time: '5Min',
      locationCoords: LatLng(20.8134112, 72.9509038),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Atm(
      shopName: 'HDFC ATM',
      address: 'Saribujrang',
      time: '6Min',
      locationCoords: LatLng(20.814662, 72.9558483),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Atm(
      shopName: 'Induslnd ATM',
      address: 'Saribujrang',
      time: '7Min',
      locationCoords: LatLng(20.8144914, 72.9558103),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Atm(
      shopName: 'Bank of Baroda',
      address: 'Saribujrang',
      time: '8Min',
      locationCoords: LatLng(20.8144912, 72.9492442),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no')
];
