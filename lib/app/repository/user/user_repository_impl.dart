import 'dart:developer';

import 'package:dartweek_fwc/app/core/exception/repository_exception.dart';
import 'package:dartweek_fwc/app/models/user_model.dart';
import 'package:dartweek_fwc/app/repository/user/user_repository.dart';
import 'package:dio/dio.dart';

import '../../core/rest/custom_dio.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;

  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get('/api/me');
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar dados do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar dados do usuário');
    }
  }
}
