import "package:dio/dio.dart";

import "../../../../../../core/internet_service/dio_client.dart";
import "../../../../../../core/internet_service/get_response_func_wrapper.dart";
import "../../../../../../core/internet_service/urls.dart";
import "../../../domain/model/doctor.dart";
import "../../../domain/model/service.dart";
import "../../mapper/dto_mapper.dart";
import "../model/doctor_dto/doctor_dto.dart";
import "../model/service_dto/service_dto.dart";

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

  Future<List<Service>> getServiceDtoList({required int kod }) {
    return getResponseFuncWrapper<Service, ServiceDto>(
        request: () => dioClient.post(servicesUrl, data: FormData.fromMap({'Kod': kod})),
        fromJson: (Map<String, dynamic> json) => ServiceDto.fromJson(json),
        toD: (ServiceDto serviceDto) => serviceDto.toService(),
        dataKey: "items"
    );
  }

}
