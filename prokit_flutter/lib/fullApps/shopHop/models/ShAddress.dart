class ShAddressModel {
  int? id;
  // ignore: non_constant_identifier_names
  String? first_name;
  // ignore: non_constant_identifier_names
  String? last_name;
  String? pinCode;
  String? city;
  String? state;
  // ignore: non_constant_identifier_names
  String? address_type;
  String? address;
  // ignore: non_constant_identifier_names
  String? phone_number;
  String? country;

  // ignore: non_constant_identifier_names
  ShAddressModel({this.id, this.first_name, this.last_name, this.pinCode, this.city, this.state, this.address_type, this.address, this.phone_number, this.country});

  factory ShAddressModel.fromJson(Map<String, dynamic> json) {
    return ShAddressModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      pinCode: json['pinCode'],
      city: json['city'],
      state: json['state'],
      address_type: json['address_type'],
      address: json['address'],
      phone_number: json['phone_number'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['pinCode'] = this.pinCode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address_type'] = this.address_type;
    data['address'] = this.address;
    data['phone_number'] = this.phone_number;
    data['country'] = this.country;
    return data;
  }
}
