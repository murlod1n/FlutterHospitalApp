import "../../../shared/data/storage/dao/database_dao.dart";
import "../../../shared/domain/entity/record_entity.dart";
import "../../domain/repository/record_repository.dart";

class RecordRepositoryImpl implements RecordRepository {
  const RecordRepositoryImpl({required this.databaseDao});

  final DatabaseDao databaseDao;

  @override
  Stream<List<RecordEntity>> getRecordList() {
    return databaseDao.getAllRecords();
  }

}