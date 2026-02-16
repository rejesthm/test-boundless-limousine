import 'package:flutter/services.dart';

class PhoneInputFormatter {
  PhoneInputFormatter._();

  static final List<TextInputFormatter> formatters = [
    FilteringTextInputFormatter.allow(RegExp(r'[\d\+]')),
    LengthLimitingTextInputFormatter(12),
  ];
}
