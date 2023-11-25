import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "../../domain/model/doctor.dart";
import "../../domain/usecase/get_doctor_list_usecase.dart";
import "../mapper/doctor_ui_mapper.dart";
import "../model/doctor_ui.dart";

part "home_event.dart";

part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getDoctorListUseCase}) : super(const HomeState()) {
    on<GetDoctorsFromServer>(_getDoctorsEventToState);
  }

  final GetDoctorListUseCase getDoctorListUseCase;

  Future<void> _getDoctorsEventToState(GetDoctorsFromServer event,
      Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final List<Doctor> doctorList = await getDoctorListUseCase.get();

      emit(
          state.copyWith(
              doctorList: doctorList.map((Doctor e) => e.toDoctorUI()).toList(),
              status: HomeStatus.success
          )
      );
    } catch (error) {
      emit(
          state.copyWith(
            status: HomeStatus.error,
            error: error.toString()
          )
      );
    }
  }
}
