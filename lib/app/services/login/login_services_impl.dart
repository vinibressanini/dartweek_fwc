import 'package:dartweek_fwc/app/repository/auth/auth_repository.dart';
import 'package:dartweek_fwc/app/services/login/login_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServicesImpl implements LoginServices {
  final AuthRepository repository;

  LoginServicesImpl({
    required this.repository,
  });

  @override
  Future<void> execute(String email, String password) async {
    final accessToken = await repository.login(email, password);
    final sp = await SharedPreferences.getInstance();
    sp.setString('accessToken', accessToken);
  }
}
