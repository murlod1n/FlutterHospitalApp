import "../model/record_to_doctor.dart";
import "../repository/record_repository.dart";

class PostRecordUseCase {
  PostRecordUseCase({required this.recordRepository});

  Future<RecordToDoctor> call({required RecordToDoctor record}) {
    return recordRepository.postRecord(record: record);
  }

  final RecordRepository recordRepository;

}
