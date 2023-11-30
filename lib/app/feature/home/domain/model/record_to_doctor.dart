import "doctor.dart";

class RecordToDoctor {
  RecordToDoctor({
    required this.doctor,
    required this.services,
    required this.date,
    required this.time
  });

  final Doctor doctor;
  final List<String> services;
  final String date;
  final String time;
}
