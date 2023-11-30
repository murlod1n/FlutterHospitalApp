import "../../domain/model/service.dart";
import "../../domain/repository/service_repository.dart";
import "../api/services/api_service.dart";

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl({ required this.apiService });

  final ApiService apiService;

  @override
  Future<List<Service>> getServiceList({required int kod}) {
    return apiService.getServiceDtoList(kod: kod);
  }



}