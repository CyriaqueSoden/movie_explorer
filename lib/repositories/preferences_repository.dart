import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/token.dart';

class PreferencesRepository {
  FlutterSecureStorage storage = FlutterSecureStorage();
  
  Future<void> saveToken(Token token) async {
    final Map<String, dynamic> json = token.toJson();

    await storage.write(key: 'token', value: jsonEncode(json));
  }

  Future<Token?> loadToken() async {
    final json = await storage.read(key: 'token');

    if (json == '') {
      return null;
    }

    return Token.fromJson(jsonDecode(json!));
  }

  Future<void> removeToken() async {
    await storage.delete(key: 'token');
  }
}
