import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_auth.dart';

class Auth with ChangeNotifier {
  Future<User> register(String email, String password) async {
    const url = 'https://zeus-apiv1.herokuapp.com/auth/users/';
    final body = {'email': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('User Already registered');
    }
  }

  Future login(String email, String password) async {
    const url = 'https://zeus-apiv1.herokuapp.com/auth/token/login/';
    final body = {'email': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      return UserToken.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login user');
    }
  }

  Future logout(String token) async {
    const url = 'https://zeus-apiv1.herokuapp.com/auth/token/logout/';
    final header = {'Authorization': token};
    final response = await http.post(url, headers: header);

    if (response.statusCode == 204) {
      return 'user logout sucessful';
    } else {
      throw Exception('Failed to log user out');
    }
  }

  Future<User> getuser(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/users/get_user/$id/';
    // final header =
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get user');
    }
  }
}
