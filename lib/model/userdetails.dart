class User {
  String name;
  String email;
  String number;
  String address;
  String pincode;
  String city;
  String state;

  User({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
  });

  toJson() {
    return {
      'name': name,
      'email': email,
      'number': number,
      'address': address,
      'pincode': pincode,
      'city': city,
      'state': state,
    };
  }
}
