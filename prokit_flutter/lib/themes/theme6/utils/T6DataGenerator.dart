import 'package:prokit_flutter/themes/theme6/models/T6Models.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Images.dart';

List<T6LogModel> getList() {
  List<T6LogModel> list = [];
  T6LogModel model = T6LogModel();
  model.name = "Lower Body";
  model.Image = t6_ic_work1;
  model.type = "Beginner";
  model.info = "7 * 4 Challence";

  T6LogModel model1 = T6LogModel();
  model1.name = "Chest Intermediate";
  model1.info = "7 * 4 Challence";
  model1.type = "Intermediate";
  model1.Image = t6_ic_work2;

  T6LogModel model2 = T6LogModel();
  model2.name = "ABS Advanced";
  model2.info = "7 * 4 Challence";
  model2.type = "Advanced";
  model2.Image = t6_ic_work3;

  T6LogModel model3 = T6LogModel();
  model3.name = "Incline Dumbbell Fly";
  model3.info = "7 * 4 Challence";
  model3.type = "Intermediate";
  model3.Image = t6_ic_work1;

  T6LogModel model4 = T6LogModel();
  model4.name = "Lower Body";
  model4.info = "7 * 4 Challence";
  model4.type = "Beginner";
  model4.Image = t6_ic_work2;

  list.add(model);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);

  return list;
}

List<T6Slider> getSliders() {
  List<T6Slider> list = [];
  T6Slider model1 = T6Slider();
  model1.name = "Superset Solider";
  model1.Image = t6_ic_work1;
  model1.info = "Full Body + weights";
  model1.duration = "12 min";

  T6Slider model2 = T6Slider();
  model2.name = "Superset Solider";
  model2.Image = t6_ic_work2;
  model2.info = "Full Body";
  model2.duration = "10 min";

  T6Slider model3 = T6Slider();
  model3.name = "Superset Solider";
  model3.Image = t6_ic_work1;
  model3.info = "Full Body + weights";
  model3.duration = "12 min";

  list.add(model1);
  list.add(model2);
  list.add(model3);
  return list;
}

List<T6LogModel> getData() {
  List<T6LogModel> list = [];
  T6LogModel model = T6LogModel();
  model.name = "Cycle";
  model.Image = t6_ic_cycle;

  T6LogModel model1 = T6LogModel();
  model1.name = "Run";
  model1.Image = t6_ic_running;

  T6LogModel model2 = T6LogModel();
  model2.name = "Walk";
  model2.Image = t6_ic_walk;

  T6LogModel model3 = T6LogModel();
  model3.name = "Swim";
  model3.Image = t6_ic_swim;

  T6LogModel model4 = T6LogModel();
  model4.name = "Gym";
  model4.Image = t6_ic_swim;

  T6LogModel model5 = T6LogModel();
  model5.name = "Boxing";
  model5.Image = t6_ic_boxing;

  T6LogModel model6 = T6LogModel();
  model6.name = "Zumba";
  model6.Image = t6_ic_zumba;

  list.add(model);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);
  list.add(model5);
  list.add(model6);

  return list;
}
