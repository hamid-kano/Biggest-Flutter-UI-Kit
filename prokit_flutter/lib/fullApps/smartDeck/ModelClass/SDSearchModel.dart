class SDSearchModel {
  String? value;

  SDSearchModel({
    this.value,
  });
}

List<SDSearchModel> searchList = [
  SDSearchModel(
    value: 'Robotic',
  ),
  SDSearchModel(
    value: 'Eco Campus',
  ),
  SDSearchModel(
    value: 'Live discussion',
  ),
];

class SDFilterModel {
  String? value;
  bool isSelected = false;

  SDFilterModel({
    this.value,
  });
}

List<SDFilterModel> mFilterList = [
  SDFilterModel(
    value: 'Robotic',
  ),
  SDFilterModel(
    value: 'Eco Campus',
  ),
  SDFilterModel(
    value: 'Live discussion',
  ),
];
