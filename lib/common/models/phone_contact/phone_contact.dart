import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_contact.freezed.dart';
part 'phone_contact.g.dart';

@freezed
class PhoneContact with _$PhoneContact {
  const PhoneContact._();

  const factory PhoneContact({
    @Default('') String number,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
  }) = _PhoneContact;

  factory PhoneContact.fromJson(Map<String, dynamic> json) =>
      _$PhoneContactFromJson(json);

  static String normalizePhone(String phone) {
    return phone.replaceAll(RegExp(r'[^\d]'), '');
  }

  bool matchesPhone(String phone) {
    final a = normalizePhone(number);
    final b = normalizePhone(phone);
    return a.isNotEmpty && a == b;
  }
}
