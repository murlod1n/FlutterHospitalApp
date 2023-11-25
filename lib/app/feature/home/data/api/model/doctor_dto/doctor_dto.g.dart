// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDto _$DoctorDtoFromJson(Map<String, dynamic> json) => DoctorDto(
      kod: json['Kod'] as String,
      name: json['Name'] as String,
      filial: json['Filial'] as String,
      dolzhnost: json['Dolzhnost'] as String,
      img: json['img'] as String,
      active: json['Active'] as String,
      del: json['Del'] as String,
    );

Map<String, dynamic> _$DoctorDtoToJson(DoctorDto instance) => <String, dynamic>{
      'Kod': instance.kod,
      'Name': instance.name,
      'Filial': instance.filial,
      'Dolzhnost': instance.dolzhnost,
      'img': instance.img,
      'Active': instance.active,
      'Del': instance.del,
    };
