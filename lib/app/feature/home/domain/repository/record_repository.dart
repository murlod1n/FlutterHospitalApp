import "../model/hospital_record.dart";

abstract interface class RecordRepository {

  Future<HospitalRecord> postRecord({required HospitalRecord record});

}
