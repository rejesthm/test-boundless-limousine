import 'package:flutter/material.dart';

void hideKeyboard() {
  try {
    FocusManager.instance.primaryFocus?.unfocus();
  } on Exception catch (e) {
    debugPrint("Unable to unfocus $e");
  }
}
