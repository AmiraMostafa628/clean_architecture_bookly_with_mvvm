import 'package:flutter/material.dart';

SnackBar buildSnackBar(String errMessage) {
  return SnackBar(content: Text(
    errMessage,

  ),
    duration: const Duration(seconds: 3),
  );
}