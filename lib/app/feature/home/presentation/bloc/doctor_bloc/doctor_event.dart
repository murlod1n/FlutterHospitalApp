part of 'doctor_bloc.dart';

sealed class DoctorEvent extends Equatable {}

class GetDoctorList extends DoctorEvent {
  @override
  List<Object?> get props => <Object?>[];
}


