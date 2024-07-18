import 'package:flutter/material.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

class KeyboardDismissContainer extends StatelessWidget {
  final Widget child;

  const KeyboardDismissContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
      },
      child: child,
    );
  }
}
