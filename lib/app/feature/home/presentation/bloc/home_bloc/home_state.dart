part of 'home_bloc.dart';


class HomeState extends Equatable {

  const HomeState({
    required this.step,
    this.doctor,
    this.date,
    this.time,
    List<ServiceUI>? serviceList
  }): serviceList = serviceList ?? const <ServiceUI>[];

  final int step;
  final DoctorUI? doctor;
  final List<ServiceUI> serviceList;
  final String? date;
  final String? time;

  @override
  List<Object?> get props => [step, doctor, serviceList, date, time];

  HomeState copyWith({
    required int step,
    DoctorUI? doctor,
    List<ServiceUI>? serviceList,
    String? date,
    String? time,
  }) {
    return HomeState(
      step: step,
      doctor: doctor ?? this.doctor,
      serviceList: serviceList ?? this.serviceList,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

}

