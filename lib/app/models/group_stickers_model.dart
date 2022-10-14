import 'dart:convert';

import 'user_stickers_model.dart';

class GroupStickersModel {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickersModel> stickers;
  final String flag;
  
  GroupStickersModel({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'country_code': countryCode});
    result.addAll({'country_name': countryName});
    result.addAll({'stickers_start': stickersStart});
    result.addAll({'stickers_end': stickersEnd});
    result.addAll({'stickers': stickers.map((x) => x.toMap()).toList()});
    result.addAll({'flag': flag});
  
    return result;
  }

  factory GroupStickersModel.fromMap(Map<String, dynamic> map) {
    return GroupStickersModel(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? '',
      countryName: map['country_name'] ?? '',
      stickersStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: List<UserStickersModel>.from(map['stickers']?.map((x) => UserStickersModel.fromMap(x))),
      flag: map['flag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupStickersModel.fromJson(String source) => GroupStickersModel.fromMap(json.decode(source));
}
