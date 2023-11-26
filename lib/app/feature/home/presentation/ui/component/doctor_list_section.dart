import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../service_locator/locator_config.dart";
import "../../../domain/usecase/get_doctor_list_usecase.dart";
import '../../bloc/doctor_bloc/doctor_bloc.dart';
import "../../bloc/record_bloc/record_bloc.dart";
import "../../model/doctor_ui.dart";
import "doctor_card.dart";

class DoctorListSection extends StatelessWidget {
  const DoctorListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (BuildContext context, DoctorState state) {
        return state.status.isSuccess
            ? _doctorList(state.doctorList)
            : state.status.isLoading
                ? const Center(child: Text("loading"))
                : state.status.isError
                    ? Center(child: Text(state.error))
                    : const SizedBox();
      },
    );
  }

  Widget _doctorList(List<DoctorUI> doctorList) {
    return BlocBuilder<RecordBloc, RecordState>(
        builder: (BuildContext context, RecordState state) {
      return Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [Text("Выберите лечащего врача")],
              ),
              const SizedBox(height: 15),
              ListView.builder(
                  itemCount: doctorList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: DoctorCard(
                          doctor: doctorList[index],
                          selectDoctor: () => context
                              .read<RecordBloc>()
                              .add(SelectDoctor(doctor: doctorList[index])),
                          isSelected: doctorList[index] == state.doctor,
                        ));
                  }),
              Row(
                children: [
                  FilledButton(onPressed: () => {}, child: Text("back")),
                  FilledButton(
                      onPressed: () => context
                          .read<RecordBloc>()
                          .add(StepToSelectService(step: 1)),
                      child: Text("Продлжить"))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
