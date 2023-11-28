import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../shared/data/storage/dao/database_dao.dart";
import "../../../../shared/data/storage/entity/doctor_entity.dart";
import "../../../../shared/data/storage/entity/service_entity.dart";
import "../../../../shared/data/storage/entity/record_entity.dart";
import "../../../domain/model/hospital_record.dart";
import "../../../domain/usecase/post_record_usecase.dart";
import "../../mapper/ui_mapper.dart";
import "../../model/doctor_ui.dart";
import "../../model/hospital_record_ui.dart";
import "../../model/service_ui.dart";

part "record_event.dart";

part "record_state.dart";

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc({required this.postRecordUseCase, required this.databaseDao})
      : super(const RecordState(step: 0)) {
    on<SelectDoctor>(_selectDoctor);
    on<SelectService>(_selectService);
    on<StepToSelectService>(_stepToSelectService);
    on<StepToSelectDate>(_stepToSelectDate);
    on<PostRecord>(_postRecord);
    on<SetDate>(_setDate);
    on<SetTime>(_setTime);
  }

  final PostRecordUseCase postRecordUseCase;
  final DatabaseDao databaseDao;

  void _selectDoctor(SelectDoctor event, Emitter<RecordState> emit) {
    emit(state.copyWith(step: state.step, doctor: event.doctor));
  }

  void _selectService(SelectService event, Emitter<RecordState> emit) {
    final List<ServiceUI> newList = List<ServiceUI>.from(state.serviceList)
      ..add(event.service);

    emit(state.copyWith(step: state.step, serviceList: newList));
  }

  void _stepToSelectService(
      StepToSelectService event, Emitter<RecordState> emit) {
    if (state.doctor != null) {
      emit(state.copyWith(step: event.step));
    }
  }

  void _stepToSelectDate(StepToSelectDate event, Emitter<RecordState> emit) {
    if (state.serviceList.isNotEmpty) {
      emit(state.copyWith(step: 2));
    }
  }

  Future<void> _postRecord(PostRecord event, Emitter<RecordState> emit) async {
    if (state.time != null && state.date != null) {
      try {
        final HospitalRecord response = await postRecordUseCase(
            record: HospitalRecordUI(
                    doctor: state.doctor!,
                    services: state.serviceList
                        .map((ServiceUI e) => e.kod.toString())
                        .toList(),
                    date: state.date!,
                    time: state.time!)
                .toHospitalRecord());

        databaseDao.insertRecord(RecordEntity(
            id: 0,
            date: "asd",
            doctor: DoctorEntity(
                id: 0,
                kod: response.doctor.kod,
                name: response.doctor.name,
                filial: response.doctor.filial,
                dolzhnost: response.doctor.dolzhnost,
                img: response.doctor.img,
                active: response.doctor.active,
                del: response.doctor.del),
            services: state.serviceList
                .map((ServiceUI e) => ServiceEntity(
                    id: 0,
                    kod: e.kod,
                    name: e.name,
                    active: e.active,
                    del: e.del,
                    price: e.price))
                .toList()));
      } catch (error) {

      }
    }
  }

  void _setDate(SetDate event, Emitter<RecordState> emit) {
    emit(state.copyWith(date: event.date, step: state.step));
  }

  void _setTime(SetTime event, Emitter<RecordState> emit) {
    emit(state.copyWith(time: event.time, step: state.step));
  }
}
