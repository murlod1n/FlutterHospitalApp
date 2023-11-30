part of 'record_bloc.dart';


class RecordState extends Equatable {

  const RecordState({
    this.recordList = const <String, List<RecordToDoctorUI>>{},
    this.error = ""
  });

  final String error;
  final Map<String, List<RecordToDoctorUI>> recordList;

  @override
  List<Object?> get props => [recordList, error];

  RecordState copyWith({
    Map<String, List<RecordToDoctorUI>>? recordList,
    String? error
  }) {
    return RecordState(
      recordList: recordList ?? this.recordList,
      error: error ?? this.error
    );
  }

}

