import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../shared/presentation/components/error_section.dart";
import "../../../../shared/presentation/components/loading_indicator_section.dart";
import "../../../../shared/presentation/model/doctor_ui.dart";
import "../../bloc/doctor_bloc/doctor_bloc.dart";
import "../../bloc/home_bloc/home_bloc.dart";
import "doctor_card.dart";

class SelectDoctorSection extends StatelessWidget {
  const SelectDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (BuildContext context, DoctorState state) {
        return state.status.isSuccess
            ? _doctorList(state.doctorList)
            : Expanded(
              child: state.status.isLoading
                  ? LoadingIndicatorSection()
                  : state.status.isError
                      ? ErrorSection(
                          onPress: () =>
                              context.read<DoctorBloc>().add(GetDoctorList()),
                          error: state.error)
                      : const SizedBox(),
            );
      },
    );
  }

  Widget _doctorList(List<DoctorUI> doctorList) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return Expanded(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.only(
                                left: 22, right: 22, top: 30, bottom: 20),
                            child: Row(
                              children: <Widget>[
                                Text("Выберите лечащего врача",
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            )),
                        ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: doctorList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: DoctorCard(
                                    doctor: doctorList[index],
                                    selectDoctor: () => context
                                        .read<HomeBloc>()
                                        .add(SelectDoctor(
                                            doctor: doctorList[index])),
                                    isSelected:
                                        doctorList[index] == state.doctor,
                                  ));
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            side: const BorderSide(
                                color: Color(0xFF7D8186)),
                          ),
                          onPressed: () => {},
                          child: const Icon(Icons.arrow_back,
                              size: 30, color: Color(0xFF7D8186))),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 118,
                      child: OutlinedButton(
                          onPressed: () => context
                              .read<HomeBloc>()
                              .add(StepToSelectService(step: 1)),
                          child: const Text("Продолжить")),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
