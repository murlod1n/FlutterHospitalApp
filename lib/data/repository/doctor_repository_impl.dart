import "../../domain/model/doctor.dart";
import "../../domain/repository/doctor_repository.dart";
import "../api/services/api_service.dart";

class DoctorRepositoryImpl implements DoctorRepository {
  DoctorRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<List<Doctor>> getDoctorList() {
    return apiService.getDoctorDtoList();
  }

}
