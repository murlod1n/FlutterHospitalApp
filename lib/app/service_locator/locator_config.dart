import "package:get_it/get_it.dart";
import "../../app/feature/home/data/api/services/api_service.dart";
import "../../app/feature/home/data/repository/doctor_repository_impl.dart";
import "../../app/feature/home/domain/repository/doctor_repository.dart";
import "../../app/feature/home/domain/usecase/get_doctor_list_usecase.dart";
import "../../core/internet_service/dio_client.dart";
import "../routing/app_router.dart";

final GetIt locator = GetIt.instance;

Future<void> initializeLocator() async {
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerSingleton<DioClient>(DioClient());
  locator.registerSingleton<ApiService>(ApiService(locator.get<DioClient>()));
  locator.registerSingleton<DoctorRepository>(DoctorRepositoryImpl(locator<ApiService>()));
  locator.registerSingleton<GetDoctorListUseCase>(GetDoctorListUseCase(locator<DoctorRepository>()));
}
