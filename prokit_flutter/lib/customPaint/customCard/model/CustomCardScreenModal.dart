class CustomScreenModal {
  String? name;
  String? img;

  CustomScreenModal({this.name, this.img});
}

List<CustomScreenModal> getData() {
  List<CustomScreenModal> list = [];
  list.add(CustomScreenModal(name: 'John mike', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(CustomScreenModal(name: 'john Doe ', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(CustomScreenModal(name: 'Mike nelson', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(CustomScreenModal(name: 'henry john', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(CustomScreenModal(name: 'Alex hales', img: 'images/pricingPlans/planScreen1.jpg'));
  return list;
}
