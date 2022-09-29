class UserDetailsModel {
  final String name;
  final String email;
  final String uId;
  String? imageurl;
  String? phone;
  String? address;

  UserDetailsModel(
      {required this.name,
      required this.email,
      required this.uId,
      this.imageurl,
      this.phone,
      this.address});
  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
          name: json["name"],
          email: json["email"],
          uId: json["uId"],
          phone: json["phone"],
          imageurl: json["imageurl"],
          address: json["address"]);

  Map<String, dynamic> getJson() => {
        'name': name,
        'email': email,
        'uId': uId,
        'imageurl': imageurl,
        "phone": phone,
        "address": address
      };
  factory UserDetailsModel.getModelFromJson(
      {required Map<String, dynamic> json}) {
    return UserDetailsModel(
        name: json["name"],
        email: json["email"],
        uId: json["uId"],
        imageurl: json["imageurl"],
        address: json["address"],
        phone: json["phone"]);
  }
}
