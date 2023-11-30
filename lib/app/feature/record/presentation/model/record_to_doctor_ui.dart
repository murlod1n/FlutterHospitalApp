import "../../../shared/presentation/model/doctor_ui.dart";
import "../../../shared/presentation/model/service_ui.dart";

class RecordToDoctorUI {
  RecordToDoctorUI({
    required this.id,
    required this.doctor,
    required this.services,
    required this.date,
  });

  final int id;
  final DoctorUI doctor;
  final List<ServiceUI> services;
  final String date;
}
