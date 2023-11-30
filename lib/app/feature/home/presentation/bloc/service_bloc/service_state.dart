part of "service_bloc.dart";

enum ServiceStatus { initial, loading, success, error }

extension ServiceStateCheckStatus on ServiceStatus {
  bool get isInitial => this == ServiceStatus.initial;

  bool get isLoading => this == ServiceStatus.loading;

  bool get isSuccess => this == ServiceStatus.success;

  bool get isError => this == ServiceStatus.error;
}

class ServiceState extends Equatable {
  const ServiceState(
      {this.status = ServiceStatus.initial,
      this.error = "",
      List<ServiceUI>? serviceList})
      : serviceList = serviceList ?? const <ServiceUI>[];

  final List<ServiceUI> serviceList;
  final ServiceStatus status;
  final String error;

  @override
  List<Object?> get props => <Object?>[serviceList, status, error];

  ServiceState copyWith({
    List<ServiceUI>? serviceList,
    ServiceStatus? status,
    String? error
  }) {
    return ServiceState(
        serviceList: serviceList ?? this.serviceList,
        status: status ?? this.status,
        error: error ?? this.error
    );
  }

}
