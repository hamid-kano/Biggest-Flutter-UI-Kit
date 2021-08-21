class SDExamModel {
  String? value;
  bool isSelected = false;

  SDExamModel({
    this.value,
  });
}

List<SDExamModel> mQuestionList = [
  SDExamModel(
    value: 'shape',
  ),
  SDExamModel(
    value: 'area',
  ),
  SDExamModel(
    value: 'baring',
  ),
  SDExamModel(
    value: 'distance',
  ),
];
