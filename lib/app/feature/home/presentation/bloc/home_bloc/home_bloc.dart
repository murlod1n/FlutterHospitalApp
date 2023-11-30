import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../shared/domain/entity/doctor_entity.dart";
import "../../../../shared/domain/entity/record_entity.dart";
import "../../../../shared/domain/entity/service_entity.dart";
import "../../../../shared/presentation/model/doctor_ui.dart";
import "../../../../shared/presentation/model/service_ui.dart";
import "../../../domain/model/record_to_doctor.dart";
import "../../../domain/usecase/insert_record_usecase.dart";
import "../../../domain/usecase/post_record_usecase.dart";
import "../../mapper/home_ui_mapper.dart";
import "../../model/home_record_ui.dart";

part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.postRecordUseCase, required this.insertRecordUseCase})
      : super(const HomeState()) {
    on<SelectDoctor>(_selectDoctor);
    on<SelectService>(_selectService);
    on<StepToSelectService>(_stepToSelectService);
    on<StepToSelectDate>(_stepToSelectDate);
    on<PostRecord>(_postRecord);
    on<SetDate>(_setDate);
    on<SetTime>(_setTime);
    on<Reset>(_reset);
    on<ReturnToPage>(_returnToPage);
  }

  final PostRecordUseCase postRecordUseCase;
  final InsertRecordUseCase insertRecordUseCase;

  void _selectDoctor(SelectDoctor event, Emitter<HomeState> emit) {
    emit(state.copyWith(step: state.step, doctor: event.doctor));
  }

  void _selectService(SelectService event, Emitter<HomeState> emit) {
    final List<ServiceUI> newList = List<ServiceUI>.from(state.serviceList)
      ..add(event.service);

    emit(state.copyWith(step: state.step, serviceList: newList));
  }

  void _stepToSelectService(
      StepToSelectService event, Emitter<HomeState> emit) {
    if (state.doctor != null) {
      emit(state.copyWith(step: event.step));
    }
  }

  void _reset(Reset event, Emitter<HomeState> emit) {
      emit(const HomeState());
  }

  void _returnToPage(ReturnToPage event, Emitter<HomeState> emit) {
    emit(state.copyWith(step: 2, error: "", status: HomeStatus.initial));

  }


  void _stepToSelectDate(StepToSelectDate event, Emitter<HomeState> emit) {
    if (state.serviceList.isNotEmpty) {
      emit(state.copyWith(step: 2));
    }
  }

  Future<void> _postRecord(PostRecord event, Emitter<HomeState> emit) async {
    if (state.time != null && state.date != null) {
      try {
        final RecordToDoctor response = await postRecordUseCase(
          record: HomeRecordUI(
            doctor: state.doctor!,
            services: state.serviceList.map((ServiceUI e) => e.kod.toString()).toList(),
            date: state.date!,
            time: state.time!
          ).toRecordToDoctor());

        await insertRecordUseCase(record: RecordEntity(
          id: 0,
          date: "${state.date!} ${state.time!}",
          doctor: DoctorEntity(
            id: 0,
            kod: response.doctor.kod,
            name: response.doctor.name,
            filial: response.doctor.filial,
            dolzhnost: response.doctor.dolzhnost,
            img: response.doctor.img,
            active: response.doctor.active,
            del: response.doctor.del
          ),
          services: state.serviceList.map(
            (ServiceUI e) => ServiceEntity(
              id: 0,
              kod: e.kod,
              name: e.name,
              active: e.active,
              del: e.del,
              price: e.price)
          ).toList()));
        emit(state.copyWith(step: -1, status: HomeStatus.success));
      } catch (error) {
        emit(state.copyWith(step: -1,status: HomeStatus.error, error: error.toString()));
      }
    }
  }

  void _setDate(SetDate event, Emitter<HomeState> emit) {
    emit(state.copyWith(date: event.date, step: state.step));
  }

  void _setTime(SetTime event, Emitter<HomeState> emit) {
    emit(state.copyWith(time: event.time, step: state.step));
  }
}
