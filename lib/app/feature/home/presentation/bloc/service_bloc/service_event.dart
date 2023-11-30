part of "service_bloc.dart";

sealed class ServiceEvent extends Equatable {}

class GetServiceList extends ServiceEvent {
  GetServiceList({ required this.doctorKod });

  final int doctorKod;

  @override
  List<Object?> get props => <Object?>[doctorKod];

}
