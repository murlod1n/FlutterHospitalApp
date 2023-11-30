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

   @JsonKey(name: "Kod") final String kod;
   @JsonKey(name: "Name")final  String name;
   @JsonKey(name: "Active")final  String active;
   @JsonKey(name: "Del") final String del;
   @JsonKey(name: "Price") final String price;
}
