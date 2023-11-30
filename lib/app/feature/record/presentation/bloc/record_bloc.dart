import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:flutter/cupertino.dart";
import "../../domain/usecase/get_record_list_usecase.dart";
import "../mapper/record_ui_mapper.dart";
import "../model/record_to_doctor_ui.dart";

part "record_event.dart";
part "record_state.dart";

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc({required this.getRecordListUseCase}) : super(const RecordState()) {
    on<GetRecordList>(_getRecordList);
    on<SetRecordList>(_setRecordList);
  }

    final GetRecordListUseCase getRecordListUseCase;

    void _getRecordList(GetRecordList event, Emitter<RecordState> emit) async {
      try {
        final recordStream = getRecordListUseCase();
        await emit.onEach(recordStream, onData: (data){
          final filteredRecordList = <String, List<RecordToDoctorUI>>{};
          final recordList = data;
          recordList.sort((a, b) => a.date.compareTo(b.date));
          recordList.forEach((element) {
            filteredRecordList.putIfAbsent(element.date, () => []).add(element.toRecordToDoctorUI());
          });
          debugPrint("rec" + filteredRecordList.toString());
          emit(RecordState(recordList: filteredRecordList));

        });
        /*recordStream.listen((records) {
          final filteredRecordList = <String, List<RecordToDoctorUI>>{};
          final recordList = records.map((e) => e.toRecordToDoctorUI()).toList();
          recordList.sort((a, b) => a.date.compareTo(b.date));

          recordList.forEach((element) {
            filteredRecordList.putIfAbsent(element.date, () => []).add(element);
          });

          emit(RecordState(recordList: filteredRecordList));

        });
*/
      } catch(error) {
          emit(RecordState(recordList: {}, error: error.toString()));
      }
    }

    _setRecordList(SetRecordList event, Emitter<RecordState> emit) {
       emit(RecordState(recordList: event.recordList));
    }
}
