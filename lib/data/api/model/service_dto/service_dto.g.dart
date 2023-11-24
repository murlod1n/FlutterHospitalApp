// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => ServiceDto(
      kod: json['Kod'] as String,
      name: json['Name'] as String,
      active: json['Active'] as String,
      del: json['Del'] as String,
      price: json['Price'] as String,
    );

Map<String, dynamic> _$ServiceDtoToJson(ServiceDto instance) =>
    <String, dynamic>{
      'Kod': instance.kod,
      'Name': instance.name,
      'Active': instance.active,
      'Del': instance.del,
      'Price': instance.price,
    };
