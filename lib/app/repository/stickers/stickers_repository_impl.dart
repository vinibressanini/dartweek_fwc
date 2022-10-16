import 'dart:developer';

import 'package:dartweek_fwc/app/core/exception/repository_exception.dart';
import 'package:dartweek_fwc/app/models/group_stickers_model.dart';
import 'package:dartweek_fwc/app/models/register_sticker_model.dart';
import 'package:dartweek_fwc/app/models/sticker_model.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository.dart';
import 'package:dio/dio.dart';

import '../../core/rest/custom_dio.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupStickersModel>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupStickersModel>((item) => GroupStickersModel.fromMap(item))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar as informaçoes do album do usuario',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro Ao Buscar As Informações do Album Do Usuário');
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerName) async {
    try {
      final result = await dio.auth().get(
        '/api/sticker-search',
        queryParameters: {
          'sticker_code': stickerCode,
          'sticker_name': stickerName
        },
      );
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }

      log('Erro ao buscar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar figurinha');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerModel) async {
    try {
      final body = FormData.fromMap(
          {...registerModel.toMap(), 'sticker_image_upload': ''});

      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao registrar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar figurinha');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
     try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao inserir figurinha no album do usuário',error: e,stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao inserir figurinha no album do usuário');
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put(
        '/api/user/sticker',
        data: {'id_sticker': stickerId, 'amount': amount},
      );
    } on DioError catch (e, s) {
      log('Erro ao inserir figurinha no album do usuario',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao inserir figurinha no album do usuario');
    }
  }
}
