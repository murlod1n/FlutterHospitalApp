import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";
import "../doctor_dto/doctor_dto.dart";

part 'record_dto.g.dart';

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

  DoctorDto doctor;
  List<String> services;
  String date;
  String time;

}