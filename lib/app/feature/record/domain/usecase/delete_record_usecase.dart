
import "../repository/record_repository.dart";

class DeleteRecordUseCase {
  DeleteRecordUseCase({required this.recordRepository});

  final RecordRepository recordRepository;

  void call(int id) {
    recordRepository.deleteRecord(id: id);
  }

}
