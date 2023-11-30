import "../../../shared/domain/entity/record_entity.dart";
import "../repository/record_repository.dart";

class GetRecordListUseCase {
  const GetRecordListUseCase({ required this.recordRepository });

  final RecordRepository recordRepository;

  Stream<List<RecordEntity>> call() {
    return recordRepository.getRecordList();
  }

}
