import "package:freezed_annotation/freezed_annotation.dart";
import "../doctor_dto/doctor_dto.dart";

part 'record_dto.g.dart';

@JsonSerializable()
class RecordDto {

  RecordDto({
   required this.doctor,
    required this.service,
    required this.date,
    required this.time
});

  factory RecordDto.fromJson(Map<String, dynamic> json) => _$RecordDtoFromJson(json);

  DoctorDto doctor;
  String service;
  String date;
  String time;

}