import 'package:flutter/material.dart';

class CardStyles {
  static const BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static const BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF2585A3), Color(0xFF172854)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
