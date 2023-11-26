import "package:auto_route/annotations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../service_locator/locator_config.dart";
import "../../../domain/usecase/get_doctor_list_usecase.dart";
import "../../../domain/usecase/get_service_list_usecase.dart";
import "../../bloc/doctor_bloc/doctor_bloc.dart";
import "../../bloc/record_bloc/record_bloc.dart";
import "../../bloc/service_bloc/service_bloc.dart";
import "../component/doctor_list_section.dart";
import "../component/selected_services_section.dart";
import "../component/step_indicator.dart";

class _HomePageState extends State<HomePage> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black26,
        surfaceTintColor: Colors.white,
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Запись на приём")]),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocBuilder<RecordBloc, RecordState>(
              builder: (BuildContext context, RecordState state) {
            return Column(
              children: <Widget>[
                Container(padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 0),child: StepIndicator(step: state.step)),
                state.step == 0
                    ? DoctorListSection()
                    : state.step == 1
                        ? SelectedServicesSection()
                        : SizedBox()
              ],
            );
          },
      )
    );
  }
}

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}
