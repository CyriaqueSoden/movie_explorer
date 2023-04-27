import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_explorer/models/token.dart';
import 'package:movie_explorer/repositories/preferences_repository.dart';

class UserRepository {
  final PreferencesRepository preferencesRepository;
  final dio =
      Dio(BaseOptions(baseUrl: 'https://movies-backend-ykdv.onrender.com'));

  UserRepository({required this.preferencesRepository});

  Token? token;

  Future<bool> init() async {
    final loadedToken = await preferencesRepository.loadToken();
    if (loadedToken == null) {
      return false;
    } else {
      token = loadedToken;
      return true;
    }
  }

  Future<void> deleteToken() async {
    token = null;
    preferencesRepository.removeToken();
  }

  login(String username, String password) async {
    final response = await dio.post('/users/login',
        data: {"username": username, "password": password});

    if (response.statusCode == 200) {
      token = Token.fromJson(response.data);
      preferencesRepository.saveToken(token!);
      return true;
    } else {
      throw Exception();
    }
  }
}
