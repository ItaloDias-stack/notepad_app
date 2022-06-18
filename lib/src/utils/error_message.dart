import 'package:flutter/material.dart';

void showRequestErrorMessage(BuildContext context, String message) {
  SnackBar snackBar;

  String errorMessage = message;
  snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(errorMessage),
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
