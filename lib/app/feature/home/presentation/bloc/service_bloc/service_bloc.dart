import 'dart:async';
import 'package:bloc/bloc.dart';
import "package:equatable/equatable.dart";
import "../../../../shared/presentation/model/service_ui.dart";
import "../../../domain/model/service.dart";
import "../../../domain/usecase/get_service_list_usecase.dart";
import "../../mapper/home_ui_mapper.dart";

part 'service_event.dart';

part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc({required this.getServiceListUseCase})
      : super(const ServiceState()) {
    on<GetServiceList>(_getServiceListEventToState);
  }

  final GetServiceListUseCase getServiceListUseCase;

  Future<void> _getServiceListEventToState(GetServiceList event, Emitter<ServiceState> emit) async {
    try {
      emit(state.copyWith(status: ServiceStatus.loading));

      final List<Service> doctorList = await getServiceListUseCase(kod: event.doctorKod);

      emit(state.copyWith(
          serviceList: doctorList.map((Service e) => e.toServiceUI()).toList(),
          status: ServiceStatus.success));
    } catch (error) {
      emit(
          state.copyWith(status: ServiceStatus.error, error: error.toString()));
    }
  }
}
