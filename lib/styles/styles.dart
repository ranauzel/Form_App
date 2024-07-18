import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const InputDecoration inputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.white54),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    border: OutlineInputBorder(),
  );

  static const BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}
