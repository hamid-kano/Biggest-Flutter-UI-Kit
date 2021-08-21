import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLClinicVisitComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLConfirmAppointmentComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLDoctorListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLHospitalListComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLPatientComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLAppointmentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLBookAppointmentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLCovidData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDeliveredData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDepartmentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDiseaseData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDoctorData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLInboxData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLMedicationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLNewsData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLNotificationData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLOrderSuccessData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLOrderTrackData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLPatientData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLPaymentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLProfileCardData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLServiceData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLSpecialistData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLTopHospitalData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLVoucherData.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLWalkThroughData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLBookAppointmentScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLCovid19Screen.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLDiseaseScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLOnlinePharmacyScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLVideoCounsultScreen.dart';

import 'MLImage.dart';
import 'MLString.dart';

List<MLWalkThroughData> mlWalkThroughDataList() {
  List<MLWalkThroughData> list = [];
  list.add(MLWalkThroughData(imagePath: ml_ic_slide_one, title: mlSlide_one, subtitle: mlSlide_one_subtitle));
  list.add(MLWalkThroughData(imagePath: ml_ic_slide_three, title: mlSlide_three, subtitle: mlSlide_three_subtitle));
  list.add(MLWalkThroughData(imagePath: ml_ic_slide_two, title: mlSlide_two, subtitle: mlSlide_two_subtitle));
  // list.add(MLWalkThroughData(imagePath: ml_ic_slide_four, title: mlSlide_four, subtitle: mlSlide_four_subtitle));
  return list;
}

List<MLServicesData> mlServiceDataList() {
  List<MLServicesData> list = [];
  list.add(MLServicesData(title: 'Clinic Visit', icon: Icons.home_work_outlined, image: ml_ic_dashClinicVisit!, widget: MLBookAppointmentScreen(index: 0)));
  list.add(MLServicesData(title: 'Home Visit', icon: Icons.home, image: ml_ic_dashHomeVisit, widget: MLBookAppointmentScreen(index: 0)));
  list.add(MLServicesData(title: 'Video Consult', icon: Icons.video_call, image: ml_ic_dashVideoCons, widget: MLVideoConsultScreen()));
  list.add(MLServicesData(title: 'Pharmacy', icon: Icons.local_hospital, image: ml_ic_dashPharmacy, widget: MLOnlinePharmacyScreen()));
  list.add(MLServicesData(title: 'Diseases', icon: Icons.health_and_safety, image: ml_ic_dashDisease, widget: MLDiseaseScreen()));
  list.add(MLServicesData(title: 'Covid-19', icon: Icons.supervised_user_circle_outlined, image: ml_ic_dashCovid, widget: MLCovidScreen()));
  return list;
}

List<MLDepartmentData> mlDepartmentDataList() {
  List<MLDepartmentData> list = [];
  list.add(MLDepartmentData(image: ml_ic_department_one, title: 'General Care', subtitle: '647 Doctor'));
  list.add(MLDepartmentData(image: ml_ic_department_two, title: 'Pediatrics', subtitle: '324 Doctor'));
  list.add(MLDepartmentData(image: ml_ic_department_three, title: 'Cardiologic', subtitle: '647 Doctor'));
  list.add(MLDepartmentData(image: ml_ic_department_one, title: 'General Care', subtitle: '647 Doctor'));
  list.add(MLDepartmentData(image: ml_ic_department_two, title: 'Pediatrics', subtitle: '324 Doctor'));
  list.add(MLDepartmentData(image: ml_ic_department_three, title: 'Cardiologic', subtitle: '647 Doctor'));
  return list;
}

List<MLTopHospitalData> mlTopHospitalDataList() {
  List<MLTopHospitalData> list = [];
  list.add(MLTopHospitalData(image: ml_ic_hospital_one, title: 'General Doctor', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_two, title: 'Pediatrics', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_three, title: 'Cardiologic', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_four, title: 'General Doctor', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_one, title: 'General Doctor', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_two, title: 'Pediatrics', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_three, title: 'Cardiologic', subtitle: '647 Doctor', rating: ''));
  list.add(MLTopHospitalData(image: ml_ic_hospital_four, title: 'General Doctor', subtitle: '647 Doctor', rating: ''));
  return list;
}

List<MLBookAppointmentData> mlBookAppointmentDataList() {
  List<MLBookAppointmentData> list = [];
  list.add(MLBookAppointmentData(id: '1', title: 'Select Service', widget: MLClinicVisitComponent(), progress: 0.2));
  list.add(MLBookAppointmentData(id: '2', title: 'Choose Hospital', widget: MLHospitalListComponent(), progress: 0.4));
  list.add(MLBookAppointmentData(id: '3', title: 'Choose Doctor', widget: MLDoctorListComponent(), progress: 0.6));
  list.add(MLBookAppointmentData(id: '4', title: 'Choose Patient', widget: MLPatientComponent(), progress: 0.8));
  list.add(MLBookAppointmentData(id: '5', title: 'Confirm Appointment', widget: MLConfirmAppointmentComponent(), progress: 1.0));
  return list;
}

List<MLTopHospitalData> mlHospitalListDataList() {
  List<MLTopHospitalData> list = [];
  list.add(MLTopHospitalData(image: ml_ic_hospital_one, title: 'Johns Hokins Hospital', city: 'New York, NY', rating: '4.8 (456 Reviews)', fees: '\$350'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_two, title: 'The NorthSide Hospital ', city: 'Central Hill', rating: '4.8 (456 Reviews)', fees: '\$750'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_three, title: 'Johns Hokins Hospital', city: 'New York, NY', rating: '4.8 (456 Reviews)', fees: '\$350'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_four, title: 'The NorthSide Hospital ', city: 'Central Hill', rating: '4.8 (456 Reviews)', fees: '\$750'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_one, title: 'Johns Hokins Hospital', city: 'New York, NY', rating: '4.8 (456 Reviews)', fees: '\$350'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_two, title: 'The NorthSide Hospital ', city: 'Central Hill', rating: '4.8 (456 Reviews)', fees: '\$750'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_three, title: 'Johns Hokins Hospital', city: 'New York, NY', rating: '4.8 (456 Reviews)', fees: '\$350'));
  list.add(MLTopHospitalData(image: ml_ic_hospital_four, title: 'The NorthSide Hospital ', city: 'Central Hill', rating: '4.8 (456 Reviews)', fees: '\$750'));
  return list;
}

List<MLDepartmentData> mlServiceListDataList() {
  List<MLDepartmentData> list = [];
  list.add(MLDepartmentData(image: ml_ic_department_one, title: 'General Care', subtitle: '647 Doctor', price: "\$500-\$1000"));
  list.add(MLDepartmentData(image: ml_ic_department_two, title: 'Pediatrics', subtitle: '324 Doctor', price: "\$500-\$1000"));
  list.add(MLDepartmentData(image: ml_ic_department_three, title: 'Cardiologic', subtitle: '647 Doctor', price: "\$500-\$1000"));
  list.add(MLDepartmentData(image: ml_ic_department_one, title: 'General Care', subtitle: '647 Doctor', price: "\$500-\$1000"));
  list.add(MLDepartmentData(image: ml_ic_department_two, title: 'Pediatrics', subtitle: '324 Doctor', price: "\$500-\$1000"));
  list.add(MLDepartmentData(image: ml_ic_department_three, title: 'Cardiologic', subtitle: '647 Doctor', price: "\$500-\$1000"));
  return list;
}

List<MLDoctorData> mlDoctorListDataList() {
  List<MLDoctorData> list = [];
  list.add(MLDoctorData(title: 'Dr. Edward Jenner', subtitle: 'Endocrinology', image: ml_ic_doctor_image, rating: '4.8', fees: '\$450'));
  list.add(MLDoctorData(title: 'Dr. Edward Jenner', subtitle: 'Endocrinology', image: ml_ic_doctor_image, rating: '4.8', fees: '\$450'));
  list.add(MLDoctorData(title: 'Dr. Edward Jenner', subtitle: 'Endocrinology', image: ml_ic_doctor_image, rating: '4.8', fees: '\$450'));
  list.add(MLDoctorData(title: 'Dr. Edward Jenner', subtitle: 'Endocrinology', image: ml_ic_doctor_image, rating: '4.8', fees: '\$450'));
  list.add(MLDoctorData(title: 'Dr. Edward Jenner', subtitle: 'Endocrinology', image: ml_ic_doctor_image, rating: '4.8', fees: '\$450'));
  list.add(MLDoctorData(title: 'Dr. Edward Jenner', subtitle: 'Endocrinology', image: ml_ic_doctor_image, rating: '4.8', fees: '\$450'));
  return list;
}

List<String?> mlScheduleTimeList() {
  List<String?> list = [];
  list.add('8:00 AM - 9:00 AM');
  list.add('9:00 AM - 10:00 AM');
  list.add('10:00 AM - 11:00 AM');
  list.add('11:00 AM - 12:00 AM');
  list.add('1:00 AM - 2:00 AM');
  list.add('2:00 AM - 3:00 AM');
  list.add('3:00 AM - 4:00 AM');
  list.add('4:00 AM - 5:00 AM');
  return list;
}

List<MLPatientData> mlPatientDataList() {
  List<MLPatientData> list = [];
  list.add(MLPatientData(name: 'Kaixa Pham', dob: '21-09-1995', relation: 'label'));
  list.add(MLPatientData(name: 'Stephen Chew', dob: '12-11-1990', relation: 'Brother'));
  return list;
}

List<MLVoucherData> mlVoucherDataList() {
  List<MLVoucherData> list = [];
  list.add(MLVoucherData(image: ml_ic_voucher, title: 'Deal -25% for General Care ', date: 'Exp: 21 April 2022'));
  list.add(MLVoucherData(image: ml_ic_voucher_two, title: 'Deal -10% for Pediatrics ', date: 'Exp: 18 April 2022'));
  return list;
}

List<MLPaymentData> mlPaymentDataList() {
  List<MLPaymentData> list = [];
  list.add(MLPaymentData(image: ml_ic_bank_payment_one, title: 'Payment at the clinic'));
  list.add(MLPaymentData(image: ml_ic_bank_payment_two, title: '**** **** **** 2109'));
  list.add(MLPaymentData(image: ml_ic_bank_payment_three, title: '**** **** **** 1210'));
  list.add(MLPaymentData(image: ml_ic_bank_payment_four, title: 'Kaixa Pham'));
  return list;
}

List<MLMedicationData> mlCategoryMedicineList() {
  List<MLMedicationData> list = [];
  list.add(MLMedicationData(image: ml_ic_mediIconSix, title: 'Prescription Drug'));
  list.add(MLMedicationData(image: ml_ic_mediIconFive, title: 'Functional Food'));
  list.add(MLMedicationData(image: ml_ic_mediIconThree, title: 'Personal Care'));
  list.add(MLMedicationData(image: ml_ic_mediIconFour, title: 'Family Medicine'));
  list.add(MLMedicationData(image: ml_ic_mediIconTwo, title: 'Prescription Drug'));
  list.add(MLMedicationData(image: ml_ic_mediIconOne, title: 'Prescription Drug'));

  return list;
}

List<MLMedicationData> mlPrescriptionMedicineDataList() {
  List<MLMedicationData> list = [];
  list.add(MLMedicationData(image: ml_ic_mediTwo, title: 'Vitamin C'));
  list.add(MLMedicationData(image: ml_ic_mediThree, title: 'General Health'));
  list.add(MLMedicationData(image: ml_ic_mediFour, title: 'Covid-19'));
  list.add(MLMedicationData(image: ml_ic_mediFive, title: 'Beauty'));
  list.add(MLMedicationData(image: ml_ic_mediTwo, title: 'Vitamin C'));
  list.add(MLMedicationData(image: ml_ic_mediThree, title: 'General Health'));
  return list;
}

List<MLDeliveredData> mlDeliveredDataList() {
  List<MLDeliveredData> list = [];
  list.add(MLDeliveredData(imageOne: ml_ic_mediTwo, imageTwo: ml_ic_mediTwo, status: 'Pending', medicineOne: 'Apple Cinder Vinegar Goli', medicineTwo: 'High Potency Vitamin'));
  list.add(MLDeliveredData(imageOne: ml_ic_mediFour, imageTwo: ml_ic_mediThree, status: 'Processing', medicineOne: 'medicine', medicineTwo: 'medicine'));
  list.add(MLDeliveredData(imageOne: ml_ic_mediFive, imageTwo: ml_ic_mediFour, status: 'Pending', medicineOne: 'medicine', medicineTwo: 'medicine'));
  return list;
}

List<MLOrderSuccessData> mlOrderSuccessDataList() {
  List<MLOrderSuccessData> list = [];
  list.add(MLOrderSuccessData(title: 'Code Order', data: '#2995451'));
  list.add(MLOrderSuccessData(title: 'Estimated Time', data: '11:45 AM'));
  list.add(MLOrderSuccessData(title: 'An email confirmation will sent to', data: 'tmrw@gmail.com'));
  list.add(MLOrderSuccessData(title: 'Code Order', data: '#2995451'));
  list.add(MLOrderSuccessData(title: 'Estimated Time', data: '11:45 AM'));
  list.add(MLOrderSuccessData(title: 'An email confirmation will sent to', data: 'tmrw@gmail.com'));
  return list;
}

List<MLDiseaseData> mlDiseaseDataList() {
  List<MLDiseaseData> list = [];
  list.add(MLDiseaseData(image: ml_ic_headacheDisease, title: 'Headache', subtitle: 'Head'));
  list.add(MLDiseaseData(image: ml_ic_toothDisease, title: 'Toothache', subtitle: 'Tooth'));
  list.add(MLDiseaseData(image: ml_ic_ThroatPainDisease, title: 'Throat Pain', subtitle: 'Throat'));
  list.add(MLDiseaseData(image: ml_ic_soreThroatDisease, title: 'Sore Throat', subtitle: 'Throat'));
  list.add(MLDiseaseData(image: ml_ic_headacheDisease, title: 'Headache', subtitle: 'Head'));
  list.add(MLDiseaseData(image: ml_ic_toothDisease, title: 'Toothache', subtitle: 'Tooth'));
  list.add(MLDiseaseData(image: ml_ic_ThroatPainDisease, title: 'Throat Pain', subtitle: 'Throat'));
  list.add(MLDiseaseData(image: ml_ic_soreThroatDisease, title: 'Sore Throat', subtitle: 'Throat'));
  return list;
}

List<MLSpecialistData> mlSpecialistDataDataList() {
  List<MLSpecialistData> list = [];
  list.add(MLSpecialistData(image: ml_ic_eye_specialist, title: 'Eye Care', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_bone_specialist, title: 'Bones', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_covid_specialist, title: 'Covid-19', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_heart_specialist, title: 'Heart', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_kidney_specialist, title: 'Kiddney', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_lungs_specialist, title: 'Lungs', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_tooth_specialist, title: 'Tooth', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_eye_specialist, title: 'Eye Care', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_bone_specialist, title: 'Bones', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_covid_specialist, title: 'Covid-19', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_heart_specialist, title: 'Heart', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_kidney_specialist, title: 'Kiddney', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_lungs_specialist, title: 'Lungs', subtitle: '647 Disease'));
  list.add(MLSpecialistData(image: ml_ic_tooth_specialist, title: 'Tooth', subtitle: '647 Disease'));
  return list;
}

List<MLCovidData> mlCovidCasesDataList() {
  List<MLCovidData> list = [];
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  list.add(MLCovidData(country: 'US', active: '683k', death: '583k'));
  return list;
}

List<MLNewsData> mlCovidNewsDataList() {
  List<MLNewsData> list = [];
  list.add(MLNewsData(image: ml_ic_hospital_four, title: 'Coronavirus: what\'s happing in Canada and around the world', duration: '18 min ago'));
  list.add(MLNewsData(image: ml_ic_hospital_one, title: 'India\'s Coronavirus death toll hits new record', duration: '18 min ago'));
  list.add(MLNewsData(image: ml_ic_hospital_three, title: 'India\'s Coronavirus death toll hits new record', duration: '18 min ago'));
  list.add(MLNewsData(image: ml_ic_hospital_two, title: 'India\'s Coronavirus death toll hits new record', duration: '18 min ago'));
  list.add(MLNewsData(image: ml_ic_hospital_one, title: 'India\'s Coronavirus death toll hits new record', duration: '18 min ago'));
  return list;
}

List<MLInboxData> mlInboxChatDataList() {
  List<MLInboxData> list = [];
  list.add(MLInboxData(id: 0, message: 'i have already taken medicine'));
  list.add(MLInboxData(id: 1, message: 'Hi Kaixa, have you taken your pills yet?'));
  list.add(MLInboxData(id: 1, message: 'sorry but i can\'t find your home number'));
  list.add(MLInboxData(id: 0, message: 'Please knock on dor'));
  list.add(MLInboxData(id: 0, message: 'I am home waiting for you'));
  list.add(MLInboxData(id: 0, message: 'Hi Miranda'));
  list.add(MLInboxData(id: 1, message: 'I am on my way to your home visit'));
  return list;
}

List<MLInboxData> mlBotChatDataList() {
  List<MLInboxData> list = [];
  list.add(MLInboxData(
      id: 1,
      message: 'These are some of the frequantly asked question whencustomers use our services. Please '
          'choose the question you are intrested in'));
  list.add(MLInboxData(id: 0, message: 'yes'));
  list.add(MLInboxData(
      id: 1,
      message: 'Hi Kaixa, Thank you for using Medilab\'s consulting service.'
          'what are you intrested in our comprehensice checkup package?'));
  list.add(MLInboxData(id: 0, message: 'Get Started'));

  return list;
}

List<MLNotificationData> mlNotificationDataList() {
  List<MLNotificationData> list = [];
  list.add(MLNotificationData(image: ml_ic_doctor_image, title: 'an appointment has been scheduled” in context from reliable sources', time: '3m ago', status: 'Completed', detail: 'Completed'));
  list.add(MLNotificationData(image: ml_ic_doctor_image, title: 'Dr. sent you a message', time: '3m ago', status: ''));
  list.add(MLNotificationData(image: ml_ic_doctor_image, title: 'Vitamins are essential to human health. Here, l', time: 'Today at 2.20 AM', status: 'Canceled'));
  list.add(
      MLNotificationData(image: ml_ic_doctor_image, title: 'Hey Dustin,. This email confirms your Service Name appointment on Appointment Date Time Client', time: 'Today at 11.20 AM', status: 'Delivered', detail: 'Succesfully delivered to you'));
  list.add(MLNotificationData(
    image: ml_ic_doctor_image,
    title: 'Hey Dustin,. This email confirms your Service Name appointment on Appointment Date Time Client',
    time: '3m ago',
    status: 'Delivered',
  ));
  return list;
}

List<MLAppointmentData> mlAppointmentDataList() {
  List<MLAppointmentData> list = [];
  list.add(MLAppointmentData(date: '10', month: 'october', doctor: 'Dr. Stephen Chew', department: 'General Care', patient: 'Kaixa Pham', service: 'Clinic Visit'));
  list.add(MLAppointmentData(date: '12', month: 'September', doctor: 'Dr. Stephen Chew', department: 'Pediatric', patient: 'Kaixa Pham ', service: 'Home Visit'));
  list.add(MLAppointmentData(date: '10', month: 'october', doctor: 'Dr. Stephen Chew', department: 'General Care', patient: 'Kaixa Pham ', service: 'Video Consult'));
  list.add(MLAppointmentData(date: '12', month: 'September', doctor: 'Dr. Stephen Chew', department: 'Pediatric', patient: 'Kaixa Pham ', service: 'Home Visit'));
  list.add(MLAppointmentData(date: '10', month: 'october', doctor: 'Dr. Stephen Chew', department: 'General Care', patient: 'Kaixa Pham ', service: 'Clinic Visit'));
  return list;
}

List<MLDeliveredData> mlDeliveredStatusDataList() {
  List<MLDeliveredData> list = [];
  list.add(MLDeliveredData(imageOne: ml_ic_mediTwo, imageTwo: ml_ic_mediFive, status: 'Pending', medicineOne: 'Apple Cinder Vinegar Goli', medicineTwo: 'High Potency Vitamin'));
  list.add(MLDeliveredData(imageOne: ml_ic_mediThree, imageTwo: ml_ic_mediTwo, status: 'Processing', medicineOne: 'Apple Cinder Vinegar Goli', medicineTwo: 'medicine'));
  list.add(MLDeliveredData(imageOne: ml_ic_mediFour, imageTwo: ml_ic_mediFour, status: 'Pending', medicineOne: 'Apple Cinder Vinegar Goli', medicineTwo: 'medicine'));
  list.add(MLDeliveredData(imageOne: ml_ic_mediFive, imageTwo: ml_ic_mediThree, status: 'Pending', medicineOne: 'Apple Cinder Vinegar Goli', medicineTwo: 'medicine'));
  return list;
}

List<MLMedicationData> mlPillDataList() {
  List<MLMedicationData> list = [];
  list.add(MLMedicationData(image: ml_ic_mediFive, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediTwo, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediThree, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediFour, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediFive, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediTwo, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediThree, title: 'Probitic, 250mg'));
  list.add(MLMedicationData(image: ml_ic_mediFour, title: 'Probitic, 250mg'));
  return list;
}

List<MLOrderTrackData> mlOrderTrackDataList() {
  List<MLOrderTrackData> list = [];
  list.add(MLOrderTrackData(date: '27 Sep', time: '09:30 AM', stage: 'Order Placed', message: 'your order #5465422212 is placed', value: true));
  list.add(MLOrderTrackData(date: '27 Sep', time: '16:30 PM', stage: 'Pending', message: 'your order is pending for confirmation,your order is penging for confirmation', value: true));
  list.add(MLOrderTrackData(date: '27 Sep', time: '16:30 PM', stage: 'Confirmed', message: 'your order #5465422212 confirm,your order #5465422212 confirm', value: true));
  list.add(MLOrderTrackData(date: '27 Sep', time: '16:30 PM', stage: 'Processing', message: 'your order #5465422212 Proccesing,your order #5465422212 Proccesing', value: true));
  list.add(MLOrderTrackData(date: 'Today', time: '16:30 PM', stage: 'Delivered', message: 'product delivery to you and marked as deliver', value: false));
  return list;
}

List<MLProfileCardData> mlProfileDataList() {
  List<MLProfileCardData> list = [];
  list.add(MLProfileCardData(img: ml_prescription1, name: 'Prescription', color: Colors.blueAccent));
  list.add(MLProfileCardData(img: ml_prescription2, name: 'Medical Record', color: Colors.orangeAccent));
  list.add(MLProfileCardData(img: ml_prescription3, name: 'Medical Test', color: Colors.pinkAccent));
  list.add(MLProfileCardData(img: ml_prescription4, name: 'Health Tracking', color: Colors.cyan));
  return list;
}
