
import "../../../shared/domain/entity/record_entity.dart";

abstract interface class RecordRepository {

  Stream<List<RecordEntity>> getRecordList();

  void deleteRecord({required int id});

}
