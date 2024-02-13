// class CreateProfileParams {
//   final String firstName;
//   final String lastName;
//   final String mobile;
//   final String city;
//   final String shippingAddress;
//
//   CreateProfileParams(
//       {required this.firstName,
//       required this.lastName,
//       required this.mobile,
//       required this.city,
//       required this.shippingAddress});
//
//   Map<String, dynamic> toJson() => {
//         "firstName": firstName,
//         "lastName": lastName,
//         "mobile": mobile,
//         "city": city,
//         "shippingAddress": shippingAddress,
//       };
// }

import 'dart:convert';

class CreateProfileParams {
  final String cusName;
  final String cusAdd;
  final String cusCity;
  final String cusState;
  final String cusPostcode;
  final String cusCountry;
  final String cusPhone;
  final String cusFax;
  final String shipName;
  final String shipAdd;
  final String shipCity;
  final String shipState;
  final String shipPostcode;
  final String shipCountry;
  final String shipPhone;


  CreateProfileParams(
      {required this.cusName,
      required this.cusAdd,
      required this.cusCity,
      required this.cusState,
      required this.cusPostcode,
      required this.cusCountry,
      required this.cusPhone,
      required this.cusFax,
      required this.shipName,
      required this.shipAdd,
      required this.shipCity,
      required this.shipState,
      required this.shipPostcode,
      required this.shipCountry,
      required this.shipPhone,});

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cus_name'] = cusName;
    data['cus_add'] = cusAdd;
    data['cus_city'] = cusCity;
    data['cus_state'] = cusCity;
    data['cus_postcode'] = cusPostcode;
    data['cus_country'] = cusCountry;
    data['cus_phone'] = cusPhone;
    data['cus_fax'] = cusPhone;
    data['ship_name'] = shipName;
    data['ship_add'] = shipAdd;
    data['ship_city'] = shipCity;
    data['ship_state'] = shipCity;
    data['ship_postcode'] = shipPostcode;
    data['ship_country'] = shipCountry;
    data['ship_phone'] = shipPhone;
    return jsonEncode(data);
  }
}
