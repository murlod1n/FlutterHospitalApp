import "doctor_entity.dart";
import "service_entity.dart";

class RecordEntity {
  RecordEntity({
    required this.id,
    required this.date,
    required this.doctor,
    required this.services
  });

  final int id;
  final String date;
  final DoctorEntity doctor;
  final List<ServiceEntity> services;

}
