// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneContactImpl _$$PhoneContactImplFromJson(Map<String, dynamic> json) =>
    _$PhoneContactImpl(
      number: json['number'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$PhoneContactImplToJson(_$PhoneContactImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
