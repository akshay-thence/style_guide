import 'dart:ui';

import 'package:flutter/material.dart';

Future<T?> showAppDialogBox<T>(
  BuildContext context,
  Widget child, {
  bool barrierDismissible = false,
}) {
  return showDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: const Color(0xff3A4252).withOpacity(0.60),
    builder: (BuildContext context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: child,
    ),
  );
}
