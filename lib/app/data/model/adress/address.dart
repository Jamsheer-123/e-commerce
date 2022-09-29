class Address {
  final String id;
  final String fullName;
  final String phone;
  final String pinCode;
  final String city;
  final String strAddress1;
  final String strAddress2;
  final String type;

  Address(
      {required this.id,
      required this.fullName,
      required this.phone,
      required this.pinCode,
      required this.city,
      required this.strAddress1,
      required this.strAddress2,
      required this.type});

  Map<String, dynamic> tojson() => {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'pinCode': pinCode,
        'city': city,
        'strAddress1': strAddress1,
        'strAddress2': strAddress2,
        'type': type,
      };
  factory Address.getModelFromJson({required Map<String, dynamic> json}) {
    return Address(
        id: json["id"],
        fullName: json["fullName"],
        phone: json["phone"],
        pinCode: json["pinCode"],
        city: json["city"],
        strAddress1: json["strAddress1"],
        strAddress2: json["strAddress2"],
        type: json["type"]);
  }
}
