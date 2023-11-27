import "../model/hospital_record.dart";
import "../repository/record_repository.dart";

class PostRecordUseCase {
  PostRecordUseCase({required this.recordRepository});

  Future<HospitalRecord> call({required HospitalRecord record}) {
    return recordRepository.postRecord(record: record);
  }

  final RecordRepository recordRepository;

}
