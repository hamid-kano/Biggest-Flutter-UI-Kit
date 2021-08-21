import 'package:prokit_flutter/main/model/ExpenseData.dart';

List<ExpenseData> getChartData() {
  List<ExpenseData> list = [];
  list.add(ExpenseData(expanseCategory: 'Food', father: 55, mother: 48, daughter: 45, son: 10));
  list.add(ExpenseData(expanseCategory: 'Transport', father: 33, mother: 45, daughter: 54, son: 28));
  list.add(ExpenseData(expanseCategory: 'Medical', father: 40, mother: 23, daughter: 20, son: 34));
  list.add(ExpenseData(expanseCategory: 'Clothes', father: 75, mother: 54, daughter: 23, son: 54));
  list.add(ExpenseData(expanseCategory: 'Books', father: 12, mother: 18, daughter: 43, son: 55));
  list.add(ExpenseData(expanseCategory: 'Other', father: 23, mother: 54, daughter: 33, son: 23));

  return list;
}
