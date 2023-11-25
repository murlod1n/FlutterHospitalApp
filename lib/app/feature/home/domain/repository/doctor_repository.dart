import "../model/doctor.dart";

abstract interface class DoctorRepository {

  Future<List<Doctor>> getDoctorList();

}
