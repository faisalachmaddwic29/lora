import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lora_app/auth/user_model.dart';
import 'package:lora_app/services/shared_prefs.dart';

class UserRepository {
  UserModel _userModel;
  SharedPref storage = SharedPref();

  Future authenticate(
      {@required String username, @required String password}) async {
    if (username.toLowerCase() != 'admin') {
      return {
        'message': 'Username is invalid',
        'status': false,
      };
    }

    if (password.toLowerCase() != 'admin') {
      return {
        'message': 'Password is invalid',
        'status': false,
      };
    }

    _userModel = UserModel(
      hasLogin: true,
      username: username,
      password: password,
    );

    storage.save('user', json.encode(_userModel));

    return {
      'message': 'Berhasil Login',
      'status': true,
    };
  }

  Future<bool> hasLogin() async {
    String value = await storage.read('user');

    if (value == null) {
      return false;
    } else {
      _userModel = UserModel.fromJson(json.decode(json.decode(value)));
      return true;
    }
  }

  Future<void> logout() async {
    storage.remove('user');
    return;
  }
}
