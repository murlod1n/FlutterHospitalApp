// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordDto _$RecordDtoFromJson(Map<String, dynamic> json) => RecordDto(
      doctor: DoctorDto.fromJson(json['doctor'] as Map<String, dynamic>),
      services:
      (jsonDecode(json['services'] as String) as List).map((dynamic e) => e as String).toList(),      date: json['date'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$RecordDtoToJson(RecordDto instance) => <String, dynamic>{
      'doctor': instance.doctor,
      'services': instance.services,
      'date': instance.date,
      'time': instance.time,
    };
