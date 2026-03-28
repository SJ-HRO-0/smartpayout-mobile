import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpayut_mobile/shared/models/app_user.dart';

const _userStorageKey = 'smartpayut_mobile_user';

final authControllerProvider =
    NotifierProvider<AuthController, AppUser?>(AuthController.new);

class AuthController extends Notifier<AppUser?> {
  @override
  AppUser? build() {
    return null;
  }

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final rawUser = prefs.getString(_userStorageKey);

    if (rawUser == null) return;

    final decoded = jsonDecode(rawUser) as Map<String, dynamic>;
    state = AppUser.fromJson(decoded);
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();

    if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
      return 'Completa el correo y la contraseña.';
    }

    if (!trimmedEmail.contains('@')) {
      return 'Ingresa un correo válido.';
    }

    final user = AppUser(
      id: '1',
      name: trimmedEmail.contains('admin')
          ? 'Administrador Demo'
          : 'Operador Demo',
      email: trimmedEmail,
      role: trimmedEmail.contains('admin')
          ? UserRole.admin
          : UserRole.operator,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userStorageKey, jsonEncode(user.toJson()));

    state = user;
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userStorageKey);
    state = null;
  }
}