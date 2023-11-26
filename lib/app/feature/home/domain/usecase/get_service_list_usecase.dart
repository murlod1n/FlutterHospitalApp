import "../model/service.dart";
import "../repository/service_repository.dart";

class GetServiceListUseCase {
  GetServiceListUseCase({required this.serviceRepository});

  final ServiceRepository serviceRepository;

  Future<List<Service>> call({required int kod}) {
    return serviceRepository.getServiceList(kod: kod);
  }

}
