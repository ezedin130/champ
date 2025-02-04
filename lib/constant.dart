import 'package:flutter/material.dart';

final inputdeco = InputDecoration(
  fillColor: Colors.grey,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  labelText: 'Enter Account Details',
  labelStyle: const TextStyle(
    fontSize: 14,
    letterSpacing: 0.2,
  ),
);
