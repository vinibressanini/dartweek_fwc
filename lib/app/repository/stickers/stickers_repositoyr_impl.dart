import 'dart:developer';

import 'package:dartweek_fwc/app/core/exception/repository_exception.dart';
import 'package:dartweek_fwc/app/models/group_stickers_model.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository.dart';
import 'package:dio/dio.dart';

import '../../core/rest/custom_dio.dart';

class StickersRepositoyrImpl implements StickersRepository {
  final CustomDio dio;
  StickersRepositoyrImpl({
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
      log('Erro ao buscar as informaçoes do album do usuario', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro Ao Buscar As Informações do Album Do Usuário');
    }
  }
}
