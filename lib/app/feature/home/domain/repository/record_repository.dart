import "../../../shared/domain/entity/record_entity.dart";
import "../model/record_to_doctor.dart";

abstract interface class RecordRepository {

  Future<RecordToDoctor> postRecord({required RecordToDoctor record});

  Future<void> insertRecord({required RecordEntity recordEntity});

}
