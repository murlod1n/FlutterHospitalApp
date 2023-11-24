import "package:get_it/get_it.dart";

import "../../data/api/services/api_service.dart";
import "../../data/api/services/dio_client.dart";
import "../../data/repository/doctor_repository_impl.dart";
import "../../domain/repository/doctor_repository.dart";
import "../../domain/usecase/get_doctor_list_usecase.dart";

//todo провеирть, есть ли лучший способ реализации
final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final DioClient dioClient = DioClient();

  locator.registerSingleton<DioClient>(dioClient);
  locator.registerSingleton<ApiService>(ApiService(locator<DioClient>()));
  locator.registerSingleton<DoctorRepository>(DoctorRepositoryImpl(locator<ApiService>()));
  locator.registerSingleton<GetDoctorListUseCase>(GetDoctorListUseCase(locator<DoctorRepository>()));
}
