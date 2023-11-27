import "doctor_ui.dart";

class HospitalRecordUI {
  HospitalRecordUI({
    required this.doctor,
    required this.services,
    required this.date,
    required this.time
  });

  DoctorUI doctor;
  List<String> services;
  String date;
  String time;
}
