import 'dart:developer';

import 'package:dartweek_fwc/app/core/exception/repository_exception.dart';
import 'package:dartweek_fwc/app/models/register_user_model.dart';
import 'package:dartweek_fwc/app/repository/auth/auth_repository.dart';
import 'package:dio/dio.dart';

import '../../core/rest/custom_dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post('/api/register', data: registerModel.toMap());
    } on DioError catch (e, s) {
      log('Erro ao registrar o usuário',error: e, stackTrace: s);
    } throw RepositoryException(message: 'Erro ao registrar o usuário!');
  }
}
