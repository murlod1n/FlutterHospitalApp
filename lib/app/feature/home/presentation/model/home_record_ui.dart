
import "../../../shared/presentation/model/doctor_ui.dart";

class HomeRecordUI {
  HomeRecordUI({
    required this.doctor,
    required this.services,
    required this.date,
    required this.time
  });

  //todo create final
  DoctorUI doctor;
  List<String> services;
  String date;
  String time;
}
