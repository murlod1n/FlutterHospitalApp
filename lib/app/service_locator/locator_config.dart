import "package:get_it/get_it.dart";
import "../../app/feature/home/data/api/services/api_service.dart";
import "../../app/feature/home/data/repository/doctor_repository_impl.dart";
import "../../app/feature/home/domain/repository/doctor_repository.dart";
import "../../app/feature/home/domain/usecase/get_doctor_list_usecase.dart";
import "../../core/internet_service/dio_client.dart";
import "../feature/home/data/repository/service_repository_impl.dart";
import "../feature/home/domain/repository/service_repository.dart";
import "../feature/home/domain/usecase/get_service_list_usecase.dart";
import "../routing/app_router.dart";

final GetIt locator = GetIt.instance;

Future<void> initializeLocator() async {
  locator.registerSingleton<DioClient>(DioClient());
  locator.registerSingleton<ApiService>(ApiService(locator.get<DioClient>()));
  locator.registerSingleton<DoctorRepository>(DoctorRepositoryImpl(apiService: locator<ApiService>()));
  locator.registerSingleton<ServiceRepository>(ServiceRepositoryImpl(apiService: locator<ApiService>()));
  locator.registerSingleton<GetDoctorListUseCase>(GetDoctorListUseCase(doctorRepository: locator<DoctorRepository>()));
  locator.registerSingleton<GetServiceListUseCase>(GetServiceListUseCase(serviceRepository: locator<ServiceRepository>()));
}
