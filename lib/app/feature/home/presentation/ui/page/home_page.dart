import "package:auto_route/annotations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../bloc/home_bloc/home_bloc.dart";
import "../component/select_date_section.dart";
import "../component/select_doctor_section.dart";
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
      body: BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
            return Column(
              children: <Widget>[
                Container(padding: const EdgeInsets.only(top: 20, left: 22, right: 22),child: StepIndicator(step: state.step)),
                state.step == 0
                    ? SelectDoctorSection()
                    : state.step == 1
                        ? SelectedServicesSection()
                        : SelectDateSection()
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
