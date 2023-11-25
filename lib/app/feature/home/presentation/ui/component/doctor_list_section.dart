import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../service_locator/locator_config.dart";
import "../../../domain/usecase/get_doctor_list_usecase.dart";
import "../../bloc/home_bloc.dart";
import "../../model/doctor_ui.dart";
import "doctor_card.dart";

class DoctorListSection extends StatelessWidget {
  const DoctorListSection({super.key});


  Widget buttonSection() {
    return Row(
      children: [

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (BuildContext context) => HomeBloc(
                  getDoctorListUseCase: locator<GetDoctorListUseCase>())
                ..add(GetDoctorsFromServer()))
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return state.status.isSuccess
                ? _doctorList(state.doctorList)
                : state.status.isLoading
                    ? const Center(child: Text("loading"))
                    : state.status.isError
                        ? Center(child: Text(state.error))
                        : const SizedBox();
          },
        ));
  }

  Widget _doctorList(List<DoctorUI> doctorList) {
    return Expanded(
      child: Column(
        children: [
          const Row(
            children: [Text("Выберите лечащего врача")],
          ),
          const SizedBox(height: 15),
          Expanded(child:
              ListView.builder(itemCount: doctorList.length, itemBuilder: (BuildContext context, int index) {
            return Container(padding: EdgeInsets.only(bottom: 12),child: DoctorCard(doctor: doctorList[index]));
          })),
        ],
      ),
    );
  }
}
