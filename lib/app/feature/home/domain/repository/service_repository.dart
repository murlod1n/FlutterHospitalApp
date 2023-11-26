import "../model/service.dart";

abstract interface class ServiceRepository {

  Future<List<Service>> getServiceList({required int kod});

}
