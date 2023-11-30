part of "home_bloc.dart";

enum HomeStatus { initial, success, error }

extension HomeStateCheckStatus on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;
}

class HomeState extends Equatable {
  const HomeState({
    this.step = 0,
    this.doctor,
    this.date,
    this.time,
    this.status = HomeStatus.initial,
    this.error = "",
    List<ServiceUI>? serviceList}
  ) : serviceList = serviceList ?? const <ServiceUI>[];

  final int step;
  final DoctorUI? doctor;
  final List<ServiceUI> serviceList;
  final String? date;
  final String? time;
  final HomeStatus status;
  final String error;

  @override
  List<Object?> get props => <Object?>[step, doctor, serviceList, date, time];

  HomeState copyWith({
    int? step,
    DoctorUI? doctor,
    List<ServiceUI>? serviceList,
    String? date,
    String? time,
    HomeStatus? status,
    String? error,
  }) {
    return HomeState(
      step: step ?? this.step,
      doctor: doctor ?? this.doctor,
      serviceList: serviceList ?? this.serviceList,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      error: error ?? this.error
    );
  }

}
