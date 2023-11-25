part of "home_bloc.dart";

enum HomeStatus { initial, loading, success, error }

extension HomeStateCheckStatus on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;

}

class HomeState extends Equatable {

  const HomeState({
    this.status = HomeStatus.initial,
    this.error = "",
    List<DoctorUI>? doctorList
  }) : doctorList = doctorList ?? const <DoctorUI>[];

  final List<DoctorUI> doctorList;
  final HomeStatus status;
  final String error;

  @override
  List<Object?> get props => [doctorList, status];

  HomeState copyWith({
    List<DoctorUI>? doctorList,
    HomeStatus? status,
    String? error
  }) {
    return HomeState(
      doctorList: doctorList ?? this.doctorList,
      status: status ?? this.status,
      error: error ?? this.error
    );
  }

}

