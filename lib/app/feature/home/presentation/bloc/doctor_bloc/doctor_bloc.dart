import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:flutter/cupertino.dart";
import '../../../domain/model/doctor.dart';
import '../../../domain/usecase/get_doctor_list_usecase.dart';
import '../../../../shared/presentation/model/doctor_ui.dart';
import "../../mapper/home_ui_mapper.dart";

part 'doctor_event.dart';

part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc({required this.getDoctorListUseCase}) : super(const DoctorState()) {
    on<GetDoctorList>(_getDoctorsEventToState);
  }

  final GetDoctorListUseCase getDoctorListUseCase;

  Future<void> _getDoctorsEventToState(GetDoctorList event,
      Emitter<DoctorState> emit) async {
    try {
      emit(state.copyWith(status: DoctorStatus.loading));

      final List<Doctor> doctorList = await getDoctorListUseCase.get();

      debugPrint(doctorList.toString());
      emit(
          state.copyWith(
              doctorList: doctorList.map((Doctor e) => e.toDoctorUI()).toList(),
              status: DoctorStatus.success
          )
      );
    } catch (error) {
      emit(
          state.copyWith(
            status: DoctorStatus.error,
            error: error.toString()
          )
      );
    }
  }
}
