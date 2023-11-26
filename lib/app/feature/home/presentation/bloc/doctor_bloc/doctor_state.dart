part of 'doctor_bloc.dart';

enum DoctorStatus { initial, loading, success, error }

extension HomeStateCheckStatus on DoctorStatus {
  bool get isInitial => this == DoctorStatus.initial;
  bool get isLoading => this == DoctorStatus.loading;
  bool get isSuccess => this == DoctorStatus.success;
  bool get isError => this == DoctorStatus.error;

}

class DoctorState extends Equatable {

  const DoctorState({
    this.status = DoctorStatus.initial,
    this.error = "",
    List<DoctorUI>? doctorList
  }) : doctorList = doctorList ?? const <DoctorUI>[];

  final List<DoctorUI> doctorList;
  final DoctorStatus status;
  final String error;

  @override
  List<Object?> get props => [doctorList, status, error];

  DoctorState copyWith({
    List<DoctorUI>? doctorList,
    DoctorStatus? status,
    String? error
  }) {
    return DoctorState(
      doctorList: doctorList ?? this.doctorList,
      status: status ?? this.status,
      error: error ?? this.error
    );
  }

}

