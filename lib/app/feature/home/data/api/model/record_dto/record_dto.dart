import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";

import "../doctor_dto/doctor_dto.dart";

part "record_dto.g.dart";

@JsonSerializable()
class RecordDto {

  RecordDto({
    required this.doctor,
    required this.services,
    required this.date,
    required this.time
});

  factory RecordDto.fromJson(Map<String, dynamic> json) => _$RecordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecordDtoToJson(this);

  final DoctorDto doctor;
  final List<String> services;
  final String date;
  final String time;

}
