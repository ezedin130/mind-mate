import 'package:mindmate/model/auth_response.dart';
import 'package:mindmate/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<AuthResponse> registerUser(
      String name,
      String email,
      String password,
      ) {
    return _authService.register(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> loginUser(
      String email,
      String password,
      ) async {
    final response = await _authService.login(
      email: email,
      password: password,
    );

    if (response.success && response.token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response.token!);
    }

    return response;
  }
  Future<Map<String, dynamic>> getUserInfo(String userId) =>
      _authService.getUserInfo(userId);

  Future<Map<String, dynamic>> updateProfile(String name, String email) =>
      _authService.updateProfile(name, email);

  Future<Map<String, dynamic>> changePassword(
      String oldPassword, String newPassword) =>
      _authService.changePassword(oldPassword, newPassword);

  Future<void> logout() => _authService.logout();
}
