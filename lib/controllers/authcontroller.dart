import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:map/constant.dart';
import 'package:map/models/user_model.dart';
import 'package:map/pages/main_screen.dart';
import 'package:map/pages/screens/login_page.dart';
import 'package:map/services/manage_http_request.dart';

class AuthController {
  Future<void> signupusers(
      {required context,
      required fullName,
      required email,
      required password}) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        password: password,
        token: '',
      );
      http.Response response = await http.post(Uri.parse('$ipadd/api/signup'),
          body: user.tojson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      manageHttpRequest(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pushNamed(context, LoginPage.id);
          });
    } catch (e) {
      throw Exception('Error during signup : $e');
    }
  }

  Future<void> signinuser(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse('$ipadd/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      manageHttpRequest(
          response: response,
          context: context,
          onSuccess: () {
            //push and remove until us user to prevent the client to going back to the screen
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false);
          });
    } catch (e) {
      throw Exception('Error during signin : $e');
     }
  }
}
