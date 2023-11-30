import "../../../shared/presentation/model/doctor_ui.dart";
import "../../../shared/presentation/model/service_ui.dart";

class RecordToDoctorUI {
  RecordToDoctorUI({
    required this.doctor,
    required this.services,
    required this.date,
  });

  //todo create final
  DoctorUI doctor;
  List<ServiceUI> services;
  String date;
}
