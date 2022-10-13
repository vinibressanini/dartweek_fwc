import '../../models/register_user_model.dart';

abstract class AuthRepository {
  Future<void> register(RegisterUserModel  registerModel);
  Future<String> login (String email, String password);
  Future<void> logout();
}