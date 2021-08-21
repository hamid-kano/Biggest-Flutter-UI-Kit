import 'package:prokit_flutter/themes/theme8/model/T8Models.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Images.dart';
import 'package:prokit_flutter/themes/theme9/models/T9Models.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Images.dart';

List<T8QuizModel> t8GetQuizData() {
  List<T8QuizModel> list = [];
  T8QuizModel model1 = T8QuizModel();
  model1.quizName = "Biology & The \nScientific Method";
  model1.totalQuiz = "15 Quiz";
  model1.quizImage = t8_ic_study1;

  T8QuizModel model2 = T8QuizModel();
  model2.quizName = "Geography Basics \n Methods";
  model2.totalQuiz = "5 Quiz";
  model2.quizImage = t8_ic_study2;

  T8QuizModel model3 = T8QuizModel();
  model3.quizName = "Java Basics \nOOPs Concept";
  model3.totalQuiz = "10 Quiz";
  model3.quizImage = t8_ic_course3;

  T8QuizModel model4 = T8QuizModel();
  model4.quizName = "Art and\nPainting Basic";
  model4.totalQuiz = "10 Quiz";
  model4.quizImage = t8_ic_course1;

  T8QuizModel model5 = T8QuizModel();
  model5.quizName = "Communication Basic";
  model5.totalQuiz = "10 Quiz";
  model5.quizImage = t8_ic_communication;

  T8QuizModel model6 = T8QuizModel();
  model6.quizName = "Investment and \nTypes";
  model6.totalQuiz = "10 Quiz";
  model6.quizImage = t8_ic_course2;

  list.add(model1);
  list.add(model3);
  list.add(model6);
  list.add(model4);
  list.add(model5);
  list.add(model2);

  return list;
}

List<T8TestModel> t8GetData() {
  List<T8TestModel> list = [];
  T8TestModel model1 = T8TestModel();
  model1.heading = "The Scientific Method";
  model1.image = t8_ic_quiz1;
  model1.type = "Quiz 1";
  model1.description = "Let's put your memory on our first topic to test.";
  model1.status = "true";

  T8TestModel model2 = T8TestModel();
  model2.heading = "Introduction to Biology";
  model2.image = t8_ic_quiz2;
  model2.type = "Flashcards";
  model2.description = "Complete the above test to unlock this one.";
  model2.status = "false";

  T8TestModel model3 = T8TestModel();
  model3.heading = "Controlled Experiments";
  model3.image = t8_ic_quiz1;
  model3.type = "Quiz 2";
  model3.description = "Let's put your memory on our first topic to test.";
  model3.status = "false";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<T9PeopleModel> getRecoom() {
  List<T9PeopleModel> list = [];

  T9PeopleModel people = T9PeopleModel();
  people.img = t9_walk_1;
  list.add(people);

  T9PeopleModel people2 = T9PeopleModel();
  people2.img = t9_ic_cake;
  list.add(people2);

  T9PeopleModel people3 = T9PeopleModel();
  people3.img = t9_green_image;
  list.add(people3);

  T9PeopleModel people4 = T9PeopleModel();
  people4.img = t8_ic_quiz1;
  list.add(people4);

  T9PeopleModel people5 = T9PeopleModel();
  people5.img = t9_walk_3;
  list.add(people5);

  T9PeopleModel people6 = T9PeopleModel();
  people6.img = t8_ic_quiz1;
  list.add(people6);

  return list;
}

List<T9PeopleModel> getPeoples() {
  List<T9PeopleModel> list = [];

  var people = T9PeopleModel();
  people.img = t9_ic_profile;
  people.name = "James";
  people.subject = "Economy";
  people.isOnline = true;

  list.add(people);

  var people2 = T9PeopleModel();
  people2.img = t9_ic_profile;
  people2.name = "Anna";
  people2.subject = "Design";
  list.add(people2);

  var people3 = T9PeopleModel();
  people3.img = t9_ic_profile;
  people3.name = "Louisa";
  people3.subject = "Photography";
  people3.isOnline = true;

  list.add(people3);

  var people4 = T9PeopleModel();
  people4.img = t9_ic_profile;
  people4.name = "Walter";
  people4.subject = "Artist";
  list.add(people4);

  var people5 = T9PeopleModel();
  people5.img = t9_ic_profile;
  people5.name = "Emma Watson";
  people5.subject = "Mathematician";
  people5.isOnline = true;

  list.add(people5);

  var people6 = T9PeopleModel();
  people6.img = t9_ic_profile;
  people6.name = "Julie Gonas";
  people6.subject = "Sports";
  people6.isOnline = true;

  list.add(people6);

  return list;
}
//List<T8Quiz>  getData(){
//  List<T8Quiz> list = List<T8Quiz>();
//var model1 = T8Quiz();
//model1.cardImage = "How many basic steps are there in scientific method?";
//model1.option1 = "Eight Steps";
//model1.option2 = "Ten Steps";
//model1.option3 = "Two Steps";
//model1.option4 = "One Steps";
//model1.topMargin = 70.0;
//
//  var model2 = T8Quiz();
//model2.cardImage = "Which blood vessels have the smallest diameter??";
//model2.option1 = "Capillaries";
//model2.option2 = "Arterioles";
//model2.option3 = "Venules";
//model2.option4 = "Lymphatic";
//model2.topMargin = 80.0;
//
//  var model3 = T8Quiz();
//model3.cardImage = "The substrate of photo-respiration is";
//model3.option1 = "Phruvic acid";
//model3.option2 = "Glucose";
//model3.option3 = "Fructose";
//model3.option4 = "Glycolate";
//model3.topMargin = 90.0;
//
//  var model4 = T8Quiz();
//model4.cardImage = "Which one of these animal is jawless?";
//model4.option1 = "Shark";
//model4.option2 = "Myxine";
//model4.option3 = "Trygon";
//model4.option4 = "Sphyrna";
//model4.topMargin = 100.0;
//
//  var model5 = T8Quiz();
//model5.cardImage = "How many basic steps are there in scientific method?";
//model5.option1 = "Eight Steps";
//model5.option2 = "Ten Steps";
//model5.option3 = "One Steps";
//model5.option4 = "Three Steps";
//model5.topMargin = 110.0;
//
//list.add(model1);
//list.add(model2);
//list.add(model3);
//list.add(model4);
//list.add(model5);
//
//return list;
//}
//
