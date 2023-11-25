import "../../../../../../core/internet_service/dio_client.dart";
import "../../../../../../core/internet_service/get_response_func_wrapper.dart";
import "../../../../../../core/internet_service/urls.dart";
import "../../../domain/model/doctor.dart";
import "../../mapper/doctor_dto_mapper.dart";
import "../model/doctor_dto/doctor_dto.dart";

class ApiService {
  ApiService(this.dioClient);

  final DioClient dioClient;

  Future<List<Doctor>> getDoctorDtoList() {
    return getResponseFuncWrapper<Doctor, DoctorDto>(
        request: () => dioClient.post(doctorsUrl),
        fromJson: (Map<String, dynamic> json) => DoctorDto.fromJson(json),
        toD: (DoctorDto doctorDto) => doctorDto.toDoctor(),
        dataKey: "items"
    );
  }
}
