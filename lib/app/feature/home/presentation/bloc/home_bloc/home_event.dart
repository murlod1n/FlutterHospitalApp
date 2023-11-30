part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {}

class SelectDoctor extends HomeEvent {
  SelectDoctor({required this.doctor});

  final DoctorUI doctor;

  @override
  List<Object?> get props => [doctor];
}

class SelectService extends HomeEvent {
  SelectService({required this.service});

  final ServiceUI service;

  @override
  List<Object?> get props => [service];
}

class StepToSelectService extends HomeEvent {
  StepToSelectService({required this.step});

  final int step;

  @override
  List<Object?> get props => <Object?>[step];
}

class StepToSelectDate extends HomeEvent {
  StepToSelectDate({required this.step});

  final int step;

  @override
  List<Object?> get props => <Object?>[step];
}

class PostRecord extends HomeEvent {

  List<Object?> get props => <Object?>[];

}

class SetDate extends HomeEvent {
  SetDate({required this.date});

  final String date;

  @override
  List<Object?> get props => <Object?>[date];
}

class SetTime extends HomeEvent {
  SetTime({required this.time});

  final String time;

  @override
  List<Object?> get props => <Object?>[time];
}
