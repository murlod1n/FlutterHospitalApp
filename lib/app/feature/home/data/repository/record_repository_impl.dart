import "../../domain/model/hospital_record.dart";
import "../../domain/repository/record_repository.dart";
import "../api/services/api_service.dart";
import "../mapper/dto_mapper.dart";


class RecordRepositoryImpl implements RecordRepository {
  const RecordRepositoryImpl({required this.apiService});

  final ApiService apiService;


  @override
  Future<HospitalRecord> postRecord({required HospitalRecord record}) {
    return apiService.postRecord(record: record.toRecordDto());
  }
}
