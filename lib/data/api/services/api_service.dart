import "package:dio/dio.dart";

import "../../../domain/model/doctor.dart";
import "../../mapper/doctor_dto_mapper.dart";
import "../model/doctor_dto/doctor_dto.dart";
import "dio_client.dart";
import "server_exception.dart";
import "urls.dart";

class ApiService {
  ApiService(this.dioClient);

  final DioClient dioClient;


  Future<List<D>> getDataFromApi<D, T>({
    required Future<Response<dynamic>> Function() request,
    required T Function(Map<String, dynamic> json) fromJson,
    required D Function(T t) toD,
    required String dataKey,
  }) async {
    try {
      final Response<dynamic> response = await request();
      if (response.statusCode == 200) {
        final List<D> data = (response.data[dataKey] as List).map((
            dynamic elt) =>
            toD(fromJson(elt as Map<String, dynamic>))).toList();
        return data;
      } else {
        throw ServerException.fromDioError(DioException.badResponse(
            statusCode: 1000,
            requestOptions: response.requestOptions,
            response: response)
        );
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }


  Future<List<Doctor>> getDoctorDtoList() {
    return getDataFromApi<Doctor, DoctorDto>(
        request: () => dioClient.post(doctorsUrl),
        fromJson: (Map<String, dynamic> json) => DoctorDto.fromJson(json),
        toD: (DoctorDto doctorDto) => doctorDto.toDoctor(),
        dataKey: "items"
    );
  }
}

