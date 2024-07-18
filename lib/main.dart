import 'package:flutter/material.dart';
import "screen/Login.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await addInitialUsers();
  runApp(Login());
}
