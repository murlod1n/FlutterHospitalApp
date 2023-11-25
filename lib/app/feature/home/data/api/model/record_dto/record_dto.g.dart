// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordDto _$RecordDtoFromJson(Map<String, dynamic> json) => RecordDto(
      doctor: DoctorDto.fromJson(json['doctor'] as Map<String, dynamic>),
      service: json['service'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$RecordDtoToJson(RecordDto instance) => <String, dynamic>{
      'doctor': instance.doctor,
      'service': instance.service,
      'date': instance.date,
      'time': instance.time,
    };
