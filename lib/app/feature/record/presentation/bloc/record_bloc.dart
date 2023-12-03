import "dart:core";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "../../../shared/domain/entity/record_entity.dart";
import "../../domain/usecase/delete_record_usecase.dart";
import "../../domain/usecase/get_record_list_usecase.dart";
import "../mapper/record_ui_mapper.dart";
import "../model/record_to_doctor_ui.dart";

part "record_event.dart";
part "record_state.dart";

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc({ required this.getRecordListUseCase, required this.deleteRecordUseCase }) : super(const RecordState()) {
    on<GetRecordList>(_getRecordList);
    on<DeleteRecord>(_deleteRecord);
  }

    final GetRecordListUseCase getRecordListUseCase;
    final DeleteRecordUseCase deleteRecordUseCase;

    Future<void> _getRecordList(GetRecordList event, Emitter<RecordState> emit) async {
      try {
        final Stream<List<RecordEntity>> recordStream = getRecordListUseCase();
        await emit.onEach(recordStream, onData: (List<RecordEntity> data){
          final Map<String, List<RecordToDoctorUI>> filteredRecordList = <String, List<RecordToDoctorUI>>{};
          final List<RecordEntity> recordList = data;
          recordList.sort((RecordEntity a, RecordEntity b) => a.date.compareTo(b.date));
          for (final RecordEntity element in recordList) {
            filteredRecordList.putIfAbsent(element.date.split(" ")[0], () => <RecordToDoctorUI>[]).add(element.toRecordToDoctorUI());
          }
          emit(RecordState(status: RecordStatus.success,recordSortedList: filteredRecordList, recordList: data.map((RecordEntity e) => e.toRecordToDoctorUI()).toList()));
        });
      } catch(error) {
        emit(RecordState(status: RecordStatus.error, error: error.toString()));
      }
    }

    void _deleteRecord(DeleteRecord event, Emitter<RecordState> emit) {
      deleteRecordUseCase(event.recordId);
    }

}
