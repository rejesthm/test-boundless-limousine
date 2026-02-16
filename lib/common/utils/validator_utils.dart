class ValidatorUtil {
  ValidatorUtil._();

  static final ValidatorUtil instance = ValidatorUtil._();

  static const String usCountryCode = '+1';
  static const List<String> usCountryCodes = ['+1', '1', '001'];

  bool isUSAPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return false;

    final cleaned = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    if (cleaned.startsWith('+1')) {
      return _hasValidUSAreaCode(cleaned.substring(2));
    } else if (cleaned.startsWith('001')) {
      return _hasValidUSAreaCode(cleaned.substring(3));
    } else if (cleaned.startsWith('1') && cleaned.length == 11) {
      return _hasValidUSAreaCode(cleaned.substring(1));
    } else if (cleaned.length == 10) {
      return _hasValidUSAreaCode(cleaned);
    }

    return false;
  }

  bool _hasValidUSAreaCode(String number) {
    if (number.length < 10) return false;

    final areaCode = number.substring(0, 3);
    final firstDigit = int.tryParse(areaCode[0]) ?? 0;
    return firstDigit >= 2 && firstDigit <= 9;
  }

  String? getCountryCode(String phoneNumber) {
    if (phoneNumber.isEmpty) return null;

    final cleaned = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    if (cleaned.startsWith('+')) {
      final match = RegExp(r'^\+(\d{1,3})').firstMatch(cleaned);
      if (match != null) {
        return '+${match.group(1)}';
      }
    }

    return null;
  }

  String formatUSPhoneNumber(String phoneNumber) {
    final cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    String digits = cleaned;
    if (cleaned.startsWith('1') && cleaned.length == 11) {
      digits = cleaned.substring(1);
    }

    if (digits.length == 10) {
      return '+1 (${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    }

    return phoneNumber;
  }

  bool isValidEmail(String email) {
    if (email.isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email.trim());
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateRequired(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateFirstName(String? value) {
    return validateRequired(value, 'First name');
  }

  String? validateLastName(String? value) {
    return validateRequired(value, 'Last name');
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (!isUSAPhoneNumber(value)) {
      return 'Please enter a valid US phone number';
    }
    return null;
  }

  String? validatePassengers(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Number of passengers is required';
    }
    final count = int.tryParse(value);
    if (count == null || count < 1) {
      return 'Please enter a valid number';
    }
    return null;
  }
}
