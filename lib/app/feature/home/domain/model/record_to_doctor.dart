import "doctor.dart";

class RecordToDoctor {
  RecordToDoctor({
    required this.doctor,
    required this.services,
    required this.date,
    required this.time
  });

  //todo create final
  Doctor doctor;
  List<String> services;
  String date;
  String time;
}
