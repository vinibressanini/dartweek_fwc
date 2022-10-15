import 'dart:convert';


class UserStickersModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicates;
  final String stickerCode;
  final String stickerNumber;
 
  UserStickersModel({
    required this.id,
    required this.idUser,
    required this.idSticker,
    required this.duplicates,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'id_user': idUser});
    result.addAll({'id_sticker': idSticker});
    result.addAll({'duplicates': duplicates});
    result.addAll({'sticker_code': stickerCode});
    result.addAll({'sticker_number': stickerNumber});
  
    return result;
  }

  factory UserStickersModel.fromMap(Map<String, dynamic> map) {
    return UserStickersModel(
      id: map['id']?.toInt() ?? 0,
      idUser: map['id_user']?.toInt() ?? 0,
      idSticker: map['id_sticker']?.toInt() ?? 0,
      duplicates: map['duplicates']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStickersModel.fromJson(String source) => UserStickersModel.fromMap(json.decode(source));
}
