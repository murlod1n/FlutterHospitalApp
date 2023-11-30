import "../../../shared/presentation/model/doctor_ui.dart";

class HomeRecordUI {
  HomeRecordUI({
    required this.doctor,
    required this.services,
    required this.date,
    required this.time
  });

  final DoctorUI doctor;
  final List<String> services;
  final String date;
  final String time;
}
