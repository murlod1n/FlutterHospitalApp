import "../../../shared/domain/entity/record_entity.dart";
import "../repository/record_repository.dart";

class InsertRecordUseCase {
  InsertRecordUseCase({ required this.recordRepository });

  Future<void> call({ required RecordEntity record }) {
    return recordRepository.insertRecord(recordEntity: record);
  }

  final RecordRepository recordRepository;

}
