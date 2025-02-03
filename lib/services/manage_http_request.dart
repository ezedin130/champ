import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpRequest(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      // Success case
      onSuccess();
      break;
    case 400:
      // bad request
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500:
      // Server Error case
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201:
      // resource created successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
