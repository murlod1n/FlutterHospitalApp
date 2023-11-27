part of 'record_bloc.dart';

sealed class RecordEvent extends Equatable {}

class SelectDoctor extends RecordEvent {
  SelectDoctor({required this.doctor});

  final DoctorUI doctor;

  @override
  List<Object?> get props => [doctor];
}

class SelectService extends RecordEvent {
  SelectService({required this.service});

  final ServiceUI service;

  @override
  List<Object?> get props => [service];
}

class StepToSelectService extends RecordEvent {
  StepToSelectService({required this.step});

  final int step;

  @override
  List<Object?> get props => <Object?>[step];
}

class StepToSelectDate extends RecordEvent {
  StepToSelectDate({required this.step});

  final int step;

  @override
  List<Object?> get props => <Object?>[step];
}

class PostRecord extends RecordEvent {

  List<Object?> get props => <Object?>[];

}

class SetDate extends RecordEvent {
  SetDate({required this.date});

  final String date;

  @override
  List<Object?> get props => <Object?>[date];
}

class SetTime extends RecordEvent {
  SetTime({required this.time});

  final String time;

  @override
  List<Object?> get props => <Object?>[time];
}
