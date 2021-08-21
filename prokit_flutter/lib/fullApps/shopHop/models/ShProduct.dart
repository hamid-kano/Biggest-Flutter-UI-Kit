import 'package:prokit_flutter/fullApps/shopHop/models/ShCategory.dart';

class ShProduct {
  int? id;
  String? name;
  // ignore: non_constant_identifier_names
  String? date_created;
  // ignore: non_constant_identifier_names
  String? date_created_gmt;
  // ignore: non_constant_identifier_names
  String? date_modified;
  // ignore: non_constant_identifier_names
  String? date_modified_gmt;
  String? type;
  String? status;
  bool? featured;
  // ignore: non_constant_identifier_names
  String? catalog_visibility;
  String? description;
  // ignore: non_constant_identifier_names
  String? short_description;
  String? sku;
  String? price;
  // ignore: non_constant_identifier_names
  String? regular_price;
  // ignore: non_constant_identifier_names
  String? sale_price;
  // ignore: non_constant_identifier_names
  String? price_html;
  // ignore: non_constant_identifier_names
  bool? on_sale;
  bool? purchasable;
  // ignore: non_constant_identifier_names
  int? total_sales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  // ignore: non_constant_identifier_names
  int? download_limit;
  // ignore: non_constant_identifier_names
  int? download_expiry;
  // ignore: non_constant_identifier_names
  String? external_url;
  // ignore: non_constant_identifier_names
  String? button_text;
  // ignore: non_constant_identifier_names
  String? tax_status;
  // ignore: non_constant_identifier_names
  String? tax_class;
  // ignore: non_constant_identifier_names
  bool? manage_stock;
  // ignore: non_constant_identifier_names
  int? stock_quantity;
  // ignore: non_constant_identifier_names
  String? stock_status;
  String? backorders;
  // ignore: non_constant_identifier_names
  bool? backorders_allowed;
  bool? backordered;
  // ignore: non_constant_identifier_names
  bool? sold_individually;
  String? weight;
  Dimensions? dimensions;
  // ignore: non_constant_identifier_names
  bool? shipping_required;
  // ignore: non_constant_identifier_names
  bool? shipping_taxable;
  // ignore: non_constant_identifier_names
  String? shipping_class;
  // ignore: non_constant_identifier_names
  int? shipping_class_id;
  // ignore: non_constant_identifier_names
  bool? reviews_allowed;
  // ignore: non_constant_identifier_names
  String? average_rating;
  // ignore: non_constant_identifier_names
  int? rating_count;
  // ignore: non_constant_identifier_names
  List<dynamic>? related_ids;
  // ignore: non_constant_identifier_names
  List<dynamic>? upsell_ids;
  // ignore: non_constant_identifier_names
  List<dynamic>? cross_sell_ids;
  // ignore: non_constant_identifier_names
  int? parent_id;
  // ignore: non_constant_identifier_names
  String? purchase_note;
  List<ShCategory>? categories;
  List<dynamic>? tags;
  List<ShImage>? images;
  List<Attribute>? attributes;
  // ignore: non_constant_identifier_names
  List<dynamic>? default_attributes;

  ShProduct(
      {this.id,
      this.name,
      // ignore: non_constant_identifier_names
      this.date_created,
      // ignore: non_constant_identifier_names
      this.date_created_gmt,
      // ignore: non_constant_identifier_names
      this.date_modified,
      // ignore: non_constant_identifier_names
      this.date_modified_gmt,
      this.type,
      this.status,
      this.featured,
      // ignore: non_constant_identifier_names
      this.catalog_visibility,
      this.description,
      // ignore: non_constant_identifier_names
      this.short_description,
      this.sku,
      this.price,
      // ignore: non_constant_identifier_names
      this.regular_price,
      // ignore: non_constant_identifier_names
      this.sale_price,
      // ignore: non_constant_identifier_names
      this.price_html,
      // ignore: non_constant_identifier_names
      this.on_sale,
      this.purchasable,
      // ignore: non_constant_identifier_names
      this.total_sales,
      this.virtual,
      this.downloadable,
      this.downloads,
      // ignore: non_constant_identifier_names
      this.download_limit,
      // ignore: non_constant_identifier_names
      this.download_expiry,
      // ignore: non_constant_identifier_names
      this.external_url,
      // ignore: non_constant_identifier_names
      this.button_text,
      // ignore: non_constant_identifier_names
      this.tax_status,
      // ignore: non_constant_identifier_names
      this.tax_class,
      // ignore: non_constant_identifier_names
      this.manage_stock,
      // ignore: non_constant_identifier_names
      this.stock_quantity,
      // ignore: non_constant_identifier_names
      this.stock_status,
      this.backorders,
      // ignore: non_constant_identifier_names
      this.backorders_allowed,
      this.backordered,
      // ignore: non_constant_identifier_names
      this.sold_individually,
      this.weight,
      this.dimensions,
      // ignore: non_constant_identifier_names
      this.shipping_required,
      // ignore: non_constant_identifier_names
      this.shipping_taxable,
      // ignore: non_constant_identifier_names
      this.shipping_class,
      // ignore: non_constant_identifier_names
      this.shipping_class_id,
      // ignore: non_constant_identifier_names
      this.reviews_allowed,
      // ignore: non_constant_identifier_names
      this.average_rating,
      // ignore: non_constant_identifier_names
      this.rating_count,
      // ignore: non_constant_identifier_names
      this.related_ids,
      // ignore: non_constant_identifier_names
      this.upsell_ids,
      // ignore: non_constant_identifier_names
      this.cross_sell_ids,
      // ignore: non_constant_identifier_names
      this.parent_id,
      // ignore: non_constant_identifier_names
      this.purchase_note,
      this.categories,
      this.tags,
      this.images,
      this.attributes,
      // ignore: non_constant_identifier_names
      this.default_attributes});

  factory ShProduct.fromJson(Map<String, dynamic> json) {
    return ShProduct(
      id: json['id'],
      name: json['name'],
      date_created: json['date_created'],
      date_created_gmt: json['date_created_gmt'],
      date_modified: json['date_modified'],
      date_modified_gmt: json['date_modified_gmt'],
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      catalog_visibility: json['catalog_visibility'],
      description: json['description'],
      short_description: json['short_description'],
      sku: json['sku'],
      price: json['price'],
      regular_price: json['regular_price'],
      sale_price: json['sale_price'],
      price_html: json['price_html'],
      on_sale: json['on_sale'],
      purchasable: json['purchasable'],
      total_sales: json['total_sales'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      download_limit: json['download_limit'],
      download_expiry: json['download_expiry'],
      external_url: json['external_url'],
      button_text: json['button_text'],
      tax_status: json['tax_status'],
      tax_class: json['tax_class'],
      manage_stock: json['manage_stock'],
      stock_quantity: json['stock_quantity'],
      stock_status: json['stock_status'],
      backorders: json['backorders'],
      backorders_allowed: json['backorders_allowed'],
      backordered: json['backordered'],
      sold_individually: json['sold_individually'],
      weight: json['weight'],
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
      shipping_required: json['shipping_required'],
      shipping_taxable: json['shipping_taxable'],
      shipping_class: json['shipping_class'],
      shipping_class_id: json['shipping_class_id'],
      reviews_allowed: json['reviews_allowed'],
      average_rating: json['average_rating'],
      rating_count: json['rating_count'],
      parent_id: json['parent_id'],
      purchase_note: json['purchase_note'],
      categories: json['categories'] != null ? (json['categories'] as List).map((i) => ShCategory.fromJson(i)).toList() : null,
      images: json['images'] != null ? (json['images'] as List).map((i) => ShImage.fromJson(i)).toList() : null,
      attributes: json['attributes'] != null ? (json['attributes'] as List).map((i) => Attribute.fromJson(i)).toList() : null,
    );
  }
}

class ShImage {
  int? id;
  // ignore: non_constant_identifier_names
  String? date_created;
  // ignore: non_constant_identifier_names
  String? date_created_gmt;
  // ignore: non_constant_identifier_names
  String? date_modified;
  // ignore: non_constant_identifier_names
  String? date_modified_gmt;
  String? src;
  String? name;
  String? alt;

  // ignore: non_constant_identifier_names
  ShImage({this.id, this.date_created, this.date_created_gmt, this.date_modified, this.date_modified_gmt, this.src, this.name, this.alt});

  factory ShImage.fromJson(Map<String, dynamic> json) {
    return ShImage(
      id: json['id'],
      date_created: json['date_created'],
      date_created_gmt: json['date_created_gmt'],
      date_modified: json['date_modified'],
      date_modified_gmt: json['date_modified_gmt'],
      src: json['src'],
      name: json['name'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.date_created;
    data['date_created_gmt'] = this.date_created_gmt;
    data['date_modified'] = this.date_modified;
    data['date_modified_gmt'] = this.date_modified_gmt;
    data['src'] = this.src;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}

class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attribute({this.id, this.name, this.position, this.visible, this.variation, this.options});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      visible: json['visible'],
      variation: json['variation'],
      options: json['options'] != null ? new List<String>.from(json['options']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['visible'] = this.visible;
    data['variation'] = this.variation;
    if (this.options != null) {
      data['options'] = this.options;
    }
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
