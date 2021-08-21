import 'package:prokit_flutter/fullApps/shopHop/models/ShCategory.dart';

class ShAttributes {
  List<Brand>? brand;
  List<ShSize>? size;
  List<ShColor>? color;
  List<ShCategory>? categories;

  ShAttributes({this.brand, this.size, this.color, this.categories});

  factory ShAttributes.fromJson(Map<String, dynamic> json) {
    return ShAttributes(
      brand: json['brand'] != null ? (json['brand'] as List).map((i) => Brand.fromJson(i)).toList() : null,
      size: json['size'] != null ? (json['size'] as List).map((i) => ShSize.fromJson(i)).toList() : null,
      color: json['color'] != null ? (json['color'] as List).map((i) => ShColor.fromJson(i)).toList() : null,
      categories: json['categories'] != null ? (json['categories'] as List).map((i) => ShCategory.fromJson(i)).toList() : null,
    );
  }
}

class ShColor {
  int? count;
  String? description;
  int? id;
  // ignore: non_constant_identifier_names
  int? menu_order;
  String? name;
  String? slug;
  bool isSelected = false;

  // ignore: non_constant_identifier_names
  ShColor({this.count, this.description, this.id, this.menu_order, this.name, this.slug});

  factory ShColor.fromJson(Map<String, dynamic> json) {
    return ShColor(
      count: json['count'],
      description: json['description'],
      id: json['id'],
      menu_order: json['menu_order'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['description'] = this.description;
    data['id'] = this.id;
    data['menu_order'] = this.menu_order;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class ShSize {
  int? count;
  String? description;
  int? id;
  // ignore: non_constant_identifier_names
  int? menu_order;
  String? name;
  String? slug;
  bool isSelected = false;

  // ignore: non_constant_identifier_names
  ShSize({this.count, this.description, this.id, this.menu_order, this.name, this.slug});

  factory ShSize.fromJson(Map<String, dynamic> json) {
    return ShSize(
      count: json['count'],
      description: json['description'],
      id: json['id'],
      menu_order: json['menu_order'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['description'] = this.description;
    data['id'] = this.id;
    data['menu_order'] = this.menu_order;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Brand {
  String? name;
  String? slug;
  bool isSelected = false;

  Brand({this.name, this.slug});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}
