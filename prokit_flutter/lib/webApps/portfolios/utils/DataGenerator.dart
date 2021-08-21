import 'package:prokit_flutter/webApps/portfolios/models/Portfolio1SkillModel.dart';
import 'package:prokit_flutter/webApps/portfolios/models/Portfolio2ServiceModel.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

List<Portfolio1SkillModel> getSkills() {
  List<Portfolio1SkillModel> list = [];

  Portfolio1SkillModel model1 = Portfolio1SkillModel();
  model1.title = 'Design';
  model1.percentage = 0.55;
  list.add(model1);

  Portfolio1SkillModel model2 = Portfolio1SkillModel();
  model2.title = 'Marketing';
  model2.percentage = 0.75;
  list.add(model2);

  Portfolio1SkillModel model3 = Portfolio1SkillModel();
  model3.title = 'Photography';
  model3.percentage = 0.30;
  list.add(model3);

  Portfolio1SkillModel model4 = Portfolio1SkillModel();
  model4.title = 'Branding';
  model4.percentage = 0.66;
  list.add(model4);

  Portfolio1SkillModel model5 = Portfolio1SkillModel();
  model5.title = 'Development';
  model5.percentage = 0.80;
  list.add(model5);

  Portfolio1SkillModel model6 = Portfolio1SkillModel();
  model6.title = 'SEO';
  model6.percentage = 0.50;
  list.add(model6);

  return list;
}

List<Portfolio2ServiceModel> getPortfolio2Services() {
  List<Portfolio2ServiceModel> list = [];

  Portfolio2ServiceModel model1 = Portfolio2ServiceModel();
  model1.name = 'Design';
  model1.desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis nam, minima iste molestiae.';
  model1.icon = '';
  list.add(model1);

  Portfolio2ServiceModel model2 = Portfolio2ServiceModel();
  model2.name = 'Marketing';
  model2.desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis nam, minima iste molestiae.';
  model2.icon = '';
  list.add(model2);

  Portfolio2ServiceModel model3 = Portfolio2ServiceModel();
  model3.name = 'Photography';
  model3.desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis nam, minima iste molestiae.';
  model3.icon = '';
  list.add(model3);

  Portfolio2ServiceModel model4 = Portfolio2ServiceModel();
  model4.name = 'Branding';
  model4.desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis nam, minima iste molestiae.';
  model4.icon = '';
  list.add(model4);

  Portfolio2ServiceModel model5 = Portfolio2ServiceModel();
  model5.name = 'Development';
  model5.desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis nam, minima iste molestiae.';
  model5.icon = '';
  list.add(model5);

  Portfolio2ServiceModel model6 = Portfolio2ServiceModel();
  model6.name = 'SEO';
  model6.desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis nam, minima iste molestiae.';
  model6.icon = '';
  list.add(model6);

  return list;
}

List<Portfolio1ToDolModel> getToDoList() {
  List<Portfolio1ToDolModel> list = [];

  Portfolio1ToDolModel model1 = Portfolio1ToDolModel();
  model1.type = 'Illustration';
  model1.img = p1GalleryImg1;
  list.add(model1);

  Portfolio1ToDolModel model2 = Portfolio1ToDolModel();
  model2.type = 'Photography';
  model2.img = p1GalleryImg2;
  list.add(model2);

  Portfolio1ToDolModel model3 = Portfolio1ToDolModel();
  model3.type = 'Illustration';
  model3.img = p1GalleryImg3;
  list.add(model3);

  Portfolio1ToDolModel model4 = Portfolio1ToDolModel();
  model4.type = 'Photography';
  model4.img = p1GalleryImg4;
  list.add(model4);

  Portfolio1ToDolModel model5 = Portfolio1ToDolModel();
  model5.type = 'Website';
  model5.img = p1GalleryImg5;
  list.add(model5);

  Portfolio1ToDolModel model6 = Portfolio1ToDolModel();
  model6.type = 'Website';
  model6.img = p1GalleryImg7;
  list.add(model6);

  return list;
}

List<Portfolio1ExperiencesModel> getExperienceDetail() {
  List<Portfolio1ExperiencesModel> list = [];

  Portfolio1ExperiencesModel model1 = Portfolio1ExperiencesModel();
  model1.title = 'FullTime Freelancer';
  model1.subTitle = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque '
      'laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model1.date = '2018 - Now';
  list.add(model1);

  Portfolio1ExperiencesModel model2 = Portfolio1ExperiencesModel();
  model2.title = 'Creative Director at Pixar Studio';
  model2.subTitle = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque '
      'laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model2.date = '2014 - 2017';
  list.add(model2);

  Portfolio1ExperiencesModel model3 = Portfolio1ExperiencesModel();
  model3.title = 'Web Designer at Microsoft';
  model3.subTitle = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque '
      'laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model3.date = '2010 - 2014';
  list.add(model3);

  return list;
}

List<Portfolio1ExperiencesModel> getEducationDetail() {
  List<Portfolio1ExperiencesModel> list = [];

  Portfolio1ExperiencesModel model1 = Portfolio1ExperiencesModel();
  model1.title = 'Master of Design, University of California';
  model1.subTitle = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
      ' totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model1.date = '2010';
  list.add(model1);

  Portfolio1ExperiencesModel model2 = Portfolio1ExperiencesModel();
  model2.title = 'Bachelor of Arts, Standford University';
  model2.subTitle = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
      ' totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model2.date = '2007';
  list.add(model2);

  Portfolio1ExperiencesModel model3 = Portfolio1ExperiencesModel();
  model3.title = 'Specialize App Design, Harvard University';
  model3.subTitle = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
      ' totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model3.date = '2004';
  list.add(model3);

  return list;
}

List<GuideLinesModel> getGuideLineDetail1() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.name = 'Henry Nicholas';
  model1.detail = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
      ' totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model1.img = p3User1;
  model1.type = 'Photographer';
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.name = 'Mark Waugh';
  model2.detail = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
      ' totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model2.img = p3User3;
  model2.type = 'Web Designer';
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.name = 'Sarina Willams';
  model3.detail = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
      ' totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.';
  model3.img = p3User2;
  model3.type = 'Graphic Designer';
  list.add(model3);

  return list;
}

List<Portfolio1ExperiencesModel> getServicesList() {
  List<Portfolio1ExperiencesModel> list = [];

  Portfolio1ExperiencesModel model1 = Portfolio1ExperiencesModel();
  model1.title = 'Business Strategy';
  model1.subTitle = 'Donec et venenatis libero. Fusceing dapibus pulvinar tincidunt. Proin maximus ipsum ut scelerisque.';
  list.add(model1);

  Portfolio1ExperiencesModel model2 = Portfolio1ExperiencesModel();
  model2.title = 'Visual Design';
  model2.subTitle = 'Donec et venenatis libero. Fusceing dapibus pulvinar tincidunt. Proin maximus ipsum ut scelerisque.';
  list.add(model2);

  Portfolio1ExperiencesModel model3 = Portfolio1ExperiencesModel();
  model3.title = 'Interactive Design';
  model3.subTitle = 'Donec et venenatis libero. Fusceing dapibus pulvinar tincidunt. Proin maximus ipsum ut scelerisque.';

  list.add(model3);

  Portfolio1ExperiencesModel model4 = Portfolio1ExperiencesModel();
  model4.title = 'Motion Graphic';
  model4.subTitle = 'Donec et venenatis libero. Fusceing dapibus pulvinar tincidunt. Proin maximus ipsum ut scelerisque.';

  list.add(model4);

  return list;
}

List<GuideLinesModel> getServiceList2() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.name = 'Unique design';
  model1.detail = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, minima. It is a long '
      'established fact that a reader will be distracted by the readable.';
  model1.img = '';
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.name = 'Different Layout';
  model2.detail = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, minima. It is a long '
      'established fact that a reader will be distracted by the readable.';
  model2.img = '';
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.name = 'Make it Simple';
  model3.detail = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, minima. It is a long '
      'established fact that a reader will be distracted by the readable.';
  model3.img = '';
  list.add(model3);

  return list;
}

List<GuideLinesModel> getSkillList() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.name = 'Responsiveness';
  model1.detail = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero, dolore.';
  model1.img = 'Icons.laptop';
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.name = 'Testing for Perfection';
  model2.detail = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero, dolore.';
  model2.img = '';
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.name = 'Advanced Options';
  model3.detail = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero, dolore.';
  model3.img = 'Icons.lock';
  list.add(model3);

  GuideLinesModel model4 = GuideLinesModel();
  model4.name = 'Make it Simple';
  model4.detail = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero, dolore.';
  model4.img = '';
  list.add(model4);

  GuideLinesModel model5 = GuideLinesModel();
  model5.name = 'Different Layout';
  model5.detail = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero, dolore.';
  model5.img = 'Icons.phone_android_sharp';
  list.add(model5);

  GuideLinesModel model6 = GuideLinesModel();
  model6.name = 'Unique design';
  model6.detail = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero, dolore.';
  model6.img = '';
  list.add(model6);

  return list;
}

List<GuideLinesModel> getLatestWorkList() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.img = p2GalleryImg1;
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.img = p2GalleryImg2;
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.img = p2GalleryImg3;
  list.add(model3);

  GuideLinesModel model4 = GuideLinesModel();
  model4.img = p2GalleryImg4;
  list.add(model4);

  GuideLinesModel model5 = GuideLinesModel();
  model5.img = p2GalleryImg5;
  list.add(model5);

  GuideLinesModel model6 = GuideLinesModel();
  model6.img = p2GalleryImg6;
  list.add(model6);

  return list;
}

List<GuideLinesModel> getLatestBlogList() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.name = 'Creative Photography';
  model1.detail = 'Lorem ipsum dolor sit amet nostrum ad minus libero fugiat molestiae ullam ipsam quas unde earum!';
  model1.img = p2GalleryImg3;
  model1.type = 'January 29, 2020';
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.name = 'Photography System';
  model2.detail = 'Lorem ipsum dolor sit amet nostrum ad minus libero fugiat molestiae ullam ipsam quas unde earum!';
  model2.img = p2GalleryImg5;
  model2.type = 'September 28, 2020';
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.name = 'Sportrait tools';
  model3.detail = 'Lorem ipsum dolor sit amet nostrum ad minus libero fugiat molestiae ullam ipsam quas unde earum!';
  model3.img = p2GalleryImg4;
  model3.type = 'October 28, 2020';
  list.add(model3);

  return list;
}

List<GuideLinesModel> getClientHappyList() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.name = 'Elizabeth';
  model1.detail = 'Lorem ipsum dolor sit amet, Ea consequuntur illum facere aperiam sequi '
      'optio consectetur adipisicing elit.Ea consequuntur illum facere.';
  model1.img = p3User1;
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.name = 'Gregory Eric';
  model2.detail = 'Lorem ipsum dolor sit amet, Ea consequuntur illum facere aperiam sequi '
      'optio consectetur adipisicing elit.Ea consequuntur illum facere.';
  model2.img = p3User2;
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.name = 'Kimberly';
  model3.detail = 'Lorem ipsum dolor sit amet, Ea consequuntur illum facere aperiam sequi '
      'optio consectetur adipisicing elit.Ea consequuntur illum facere.';
  model3.img = p3User3;
  list.add(model3);

  return list;
}

List<GuideLinesModel> getGalleryImgList() {
  List<GuideLinesModel> list = [];

  GuideLinesModel model1 = GuideLinesModel();
  model1.img = p2GalleryImg1;
  list.add(model1);

  GuideLinesModel model2 = GuideLinesModel();
  model2.img = p2GalleryImg2;
  list.add(model2);

  GuideLinesModel model3 = GuideLinesModel();
  model3.img = p2GalleryImg3;
  list.add(model3);

  GuideLinesModel model4 = GuideLinesModel();
  model4.img = p2GalleryImg4;
  list.add(model4);

  GuideLinesModel model5 = GuideLinesModel();
  model5.img = p2GalleryImg5;
  list.add(model5);

  GuideLinesModel model6 = GuideLinesModel();
  model6.img = p2GalleryImg6;
  list.add(model6);

  return list;
}
