import 'dart:convert';

import '../../domain/entity/register_param.dart';

class RegisterParamModel extends RegisterParam {
  RegisterParamModel({
    required super.name,
    required super.exceutive,
    required super.payment,
    required super.phone,
    required super.address,
    required super.totalAmount,
    required super.discountAmount,
    required super.advanceAmount,
    required super.dateEndTime,
    required super.id,
    required super.male,
    required super.balanceAmount,
    required super.female,
    required super.branch,
    required super.treatments,
  });

  factory RegisterParamModel.fromEntity(RegisterParam data) =>
      RegisterParamModel(
        balanceAmount: data.balanceAmount,
        name: data.name,
        exceutive: data.exceutive,
        payment: data.payment,
        phone: data.phone,
        address: data.address,
        totalAmount: data.totalAmount,
        discountAmount: data.discountAmount,
        advanceAmount: data.advanceAmount,
        dateEndTime: data.dateEndTime,
        id: data.id,
        male: data.male,
        female: data.female,
        branch: data.branch,
        treatments: data.treatments,
      );

  Map<String, String> toJson() => {
    'name': name,
    'excecutive': exceutive,
    'payment': payment,
    'phone': phone,
    'address': address,
    'total_amount': totalAmount,
    'discount_amount': discountAmount,
    'advance_amount': advanceAmount,
    'balance_amount': balanceAmount,
    'date_nd_time': dateEndTime,
    //eg:01/02/2024-10:24 AM
    'id': "", //(Pass empty string to this key)
    'male': jsonEncode(male), // (List of selected treatment ids
    //separated by commas eg: 2,3,4)
    'female': jsonEncode(female), //(List of selected treatment ids
    //separated by commas eg: 2,3,4)
    'branch': branch,
    'treatments': jsonEncode(treatments), //(List of selected treatment
    //ids separated by commas eg: 2,3,4)
  };
}
