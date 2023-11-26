import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../model/doctor_ui.dart";
import "../../model/service_ui.dart";

part "record_event.dart";
part "record_state.dart";


class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc() : super(const RecordState(step: 0)) {
    on<SelectDoctor>(_selectDoctor);
    on<SelectService>(_selectService);
    on<StepToSelectService>(_stepToSelectService);
    on<StepToSelectDate>(_stepToSelectDate);
  }


  void _selectDoctor(SelectDoctor event, Emitter<RecordState> emit) {
    emit(state.copyWith(step: state.step, doctor: event.doctor));
  }

  void _selectService(SelectService event, Emitter<RecordState> emit) {

    final List<ServiceUI> newList = List<ServiceUI>.from(state.serviceList)..add(event.service);

    emit(state.copyWith(step: state.step, serviceList: newList));
  }


  void _stepToSelectService(StepToSelectService event, Emitter<RecordState> emit) {
    if(state.doctor != null) {
      emit(state.copyWith(step: event.step));
    }
  }

  void _stepToSelectDate(StepToSelectDate event, Emitter<RecordState> emit) {
    if(state.serviceList.isNotEmpty) {
      emit(state.copyWith(step: 2));
    }
  }
}
