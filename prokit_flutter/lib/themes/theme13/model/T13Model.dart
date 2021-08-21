class Home {
  var name;
  var image;
  var price;
  var sqm;
  var place;

  Home(this.name, this.image, this.price, this.sqm, this.place);

  Home.info(this.place, this.image);
}

class Currency {
  var name;
  var image;
  var cur;

  Currency(this.name, this.image, this.cur);
}

class Photos {
  var image;

  Photos(this.image);
}

class Filter {
  var name;
  var property;

  Filter(this.name, this.property);
}
