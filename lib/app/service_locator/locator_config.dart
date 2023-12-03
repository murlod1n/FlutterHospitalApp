import "package:get_it/get_it.dart";
import "../../app/feature/home/data/api/services/api_service.dart";
import "../../app/feature/home/data/repository/doctor_repository_impl.dart";
import "../../app/feature/home/domain/repository/doctor_repository.dart";
import "../../app/feature/home/domain/usecase/get_doctor_list_usecase.dart";
import "../../core/internet_service/dio_client.dart";
import "../feature/home/data/repository/record_repository_impl.dart" as home;
import "../feature/home/data/repository/service_repository_impl.dart";
import "../feature/home/domain/repository/record_repository.dart" as home;
import "../feature/home/domain/repository/service_repository.dart";
import "../feature/home/domain/usecase/get_service_list_usecase.dart";
import "../feature/home/domain/usecase/insert_record_usecase.dart";
import "../feature/home/domain/usecase/post_record_usecase.dart";
import "../feature/record/data/repository/record_repository_impl.dart" as record;
import "../feature/record/domain/repository/record_repository.dart" as record;
import "../feature/record/domain/usecase/delete_record_usecase.dart";
import "../feature/record/domain/usecase/get_record_list_usecase.dart";
import "../feature/shared/data/storage/dao/database_dao.dart";
import "../feature/shared/data/storage/database/database.dart";


final GetIt locator = GetIt.instance;

Future<void> initializeLocator() async {
  //Database
  locator.registerSingleton<Database>(Database());
  locator.registerSingleton<DatabaseDao>(DatabaseDao(locator<Database>()));

  //Internet service
  locator.registerSingleton<DioClient>(DioClient());
  locator.registerSingleton<ApiService>(ApiService(locator.get<DioClient>()));

  //Repositories impl
  locator.registerSingleton<DoctorRepository>(DoctorRepositoryImpl(apiService: locator<ApiService>()));
  locator.registerSingleton<ServiceRepository>(ServiceRepositoryImpl(apiService: locator<ApiService>()));
  locator.registerSingleton<home.RecordRepository>(home.RecordRepositoryImpl(apiService: locator<ApiService>(), databaseDao: locator<DatabaseDao>()));
  locator.registerSingleton<record.RecordRepository>(record.RecordRepositoryImpl(databaseDao: locator<DatabaseDao>()));

  //UseCases
  locator.registerSingleton<PostRecordUseCase>(PostRecordUseCase(recordRepository: locator<home.RecordRepository>()));
  locator.registerSingleton<GetDoctorListUseCase>(GetDoctorListUseCase(doctorRepository: locator<DoctorRepository>()));
  locator.registerSingleton<GetServiceListUseCase>(GetServiceListUseCase(serviceRepository: locator<ServiceRepository>()));
  locator.registerSingleton<InsertRecordUseCase>(InsertRecordUseCase(recordRepository: locator<home.RecordRepository>()));
  locator.registerSingleton<GetRecordListUseCase>(GetRecordListUseCase(recordRepository: locator<record.RecordRepository>()));
  locator.registerSingleton<DeleteRecordUseCase>(DeleteRecordUseCase(recordRepository: locator<record.RecordRepository>()));
}
