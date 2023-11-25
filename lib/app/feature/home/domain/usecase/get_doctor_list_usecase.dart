import "../model/doctor.dart";
import "../repository/doctor_repository.dart";

class GetDoctorListUseCase {
  GetDoctorListUseCase(this.doctorRepository);

  DoctorRepository doctorRepository;

  Future<List<Doctor>> get() {
    return doctorRepository.getDoctorList();
  }

}
