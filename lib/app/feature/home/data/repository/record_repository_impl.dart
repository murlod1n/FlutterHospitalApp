import "../../../shared/data/storage/dao/database_dao.dart";
import "../../../shared/domain/entity/record_entity.dart";
import "../../domain/model/record_to_doctor.dart";
import "../../domain/repository/record_repository.dart";
import "../api/services/api_service.dart";
import "../mapper/dto_mapper.dart";


class RecordRepositoryImpl implements RecordRepository {
  const RecordRepositoryImpl({ required this.apiService, required this.databaseDao });

  final ApiService apiService;
  final DatabaseDao databaseDao;

  @override
  Future<RecordToDoctor> postRecord({required RecordToDoctor record}) {
    return apiService.postRecord(record: record.toRecordDto());
  }

  @override
  Future<void> insertRecord({required RecordEntity recordEntity}) {
    return databaseDao.insertRecord(recordEntity);
  }
}
