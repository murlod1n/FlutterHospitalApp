import "../model/doctor.dart";
import "../repository/doctor_repository.dart";

class GetDoctorListUseCase {
  GetDoctorListUseCase({ required this.doctorRepository });

  final DoctorRepository doctorRepository;

  Future<List<Doctor>> get() {
    return doctorRepository.getDoctorList();
  }

}
