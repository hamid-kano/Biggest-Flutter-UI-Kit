class ShCategory {
  int? count;
  String? description;
  int? id;
  bool? isSelected;
  // ignore: non_constant_identifier_names
  int? menu_order;
  String? name;
  int? parent;
  String? slug;
  String? image;

  // ignore: non_constant_identifier_names
  ShCategory({this.count, this.description, this.id, this.isSelected, this.menu_order, this.name, this.parent, this.slug, this.image});

  factory ShCategory.fromJson(Map<String, dynamic> json) {
    return ShCategory(
        count: json['count'],
        description: json['description'],
        id: json['id'],
        isSelected: json['isSelected'],
        menu_order: json['menu_order'],
        name: json['name'],
        parent: json['parent'],
        slug: json['slug'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['description'] = this.description;
    data['id'] = this.id;
    data['isSelected'] = this.isSelected;
    data['menu_order'] = this.menu_order;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['slug'] = this.slug;
    return data;
  }
}
