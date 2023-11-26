import "package:freezed_annotation/freezed_annotation.dart";

part "service_dto.g.dart";

@JsonSerializable()
class ServiceDto {
  ServiceDto({
    required this.kod,
    required this.name,
    required this.active,
    required this.del,
    required this.price,
  });

  factory ServiceDto.fromJson(Map<String, dynamic> json) => _$ServiceDtoFromJson(json);

   @JsonKey(name: 'Kod') String kod;
   @JsonKey(name: 'Name') String name;
   @JsonKey(name: 'Active') String active;
   @JsonKey(name: 'Del') String del;
   @JsonKey(name: 'Price') String price;
}
