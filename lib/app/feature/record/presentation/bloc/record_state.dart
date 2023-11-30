part of "record_bloc.dart";

enum RecordStatus { initial, success, error }

extension RecordStatusCheckStatus on RecordStatus {
  bool get isInitial => this == RecordStatus.initial;
  bool get isSuccess => this == RecordStatus.success;
  bool get isError => this == RecordStatus.error;
}


class RecordState extends Equatable {

  const RecordState({
    this.recordSortedList = const <String, List<RecordToDoctorUI>>{},
    this.recordList = const <RecordToDoctorUI>[],
    this.status = RecordStatus.initial,
    this.error = ""
  });

  final String error;
  final RecordStatus status;
  final Map<String, List<RecordToDoctorUI>> recordSortedList;
  final List<RecordToDoctorUI> recordList;

  @override
  List<Object?> get props => <Object?>[recordSortedList, error, recordList];

  RecordState copyWith({
    Map<String, List<RecordToDoctorUI>>? recordSortedList,
    List<RecordToDoctorUI>? recordList,
    String? error,
    RecordStatus? status,
  }) {
    return RecordState(
        recordSortedList: recordSortedList ?? this.recordSortedList,
      recordList: recordList ?? this.recordList,
      error: error ?? this.error,
      status: status ?? this.status
    );
  }

}
