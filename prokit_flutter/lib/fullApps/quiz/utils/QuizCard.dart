class Quiz {
  var option1;

  var option2;

  var option3;

  var option4;

  var cardImage;
  double? topMargin;

  Quiz(String imagePath, String o1, String o2, String o3, String o4, double marginTop) {
    option1 = o1;
    option2 = o2;
    option3 = o3;
    option4 = o4;
    cardImage = imagePath;
    topMargin = marginTop;
  }
}
