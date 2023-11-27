import "package:json_annotation/json_annotation.dart";

part 'doctor_dto.g.dart';

@JsonSerializable()
class DoctorDto {
  DoctorDto({
    required this.kod,
    required this.name,
    required this.filial,
    required this.dolzhnost,
    required this.img,
    required this.active,
    required this.del
  });

  factory DoctorDto.fromJson(Map<String, dynamic> json) => _$DoctorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorDtoToJson(this);


  @JsonKey(name: "Kod") String kod;
  @JsonKey(name: "Name") String name;
  @JsonKey(name: "Filial") String filial;
  @JsonKey(name: "Dolzhnost") String dolzhnost;
  String img;
  @JsonKey(name: "Active") String active;
  @JsonKey(name: "Del") String del;

}
