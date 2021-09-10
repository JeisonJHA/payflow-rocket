import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    _user = user;
    _isAuthenticated = user != null;
    saveUser(user);
    Navigator.pushReplacementNamed(
        context, _isAuthenticated ? "/home" : "/login",
        arguments: user);
  }

  void saveUser(UserModel? user) async {
    if (user == null) return;
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
  }

  void curretUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (!instance.containsKey("user")) {
      return setUser(context, null);
    }
    final json = instance.get("user") as String;
    setUser(context, UserModel.fromJson(json));
  }
}
