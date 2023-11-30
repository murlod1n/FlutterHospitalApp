part of "record_bloc.dart";


sealed class RecordEvent extends Equatable {}

class GetRecordList extends RecordEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class SetRecordList extends RecordEvent {
  SetRecordList({required this.recordList});

  final Map<String, List<RecordToDoctorUI>> recordList;

  @override
  List<Object?> get props => <Object?>[recordList];

}
