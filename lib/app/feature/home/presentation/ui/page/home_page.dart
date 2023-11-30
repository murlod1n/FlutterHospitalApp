import "package:auto_route/annotations.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "../../../../shared/presentation/components/error_section.dart";
import "../../bloc/home_bloc/home_bloc.dart";
import "../component/select_date_section.dart";
import "../component/select_doctor_section.dart";
import "../component/selected_services_section.dart";
import "../component/step_indicator.dart";
import "../component/success_section.dart";

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
            return state.status.isInitial
                ? Column(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 22, right: 22),
                          child: StepIndicator(step: state.step)),
                      if (state.step == 0) const SelectDoctorSection() else state.step == 1
                              ? const SelectedServicesSection()
                              : const SelectDateSection()
                    ],
                  )
                : state.status.isError
                    ? ErrorSection(
              buttomText: "Назад",
                        onPress: () {
                          context.read<HomeBloc>().add(ReturnToPage());
                        },
                        error: state.error)
                    : Center(child: SuccessSection(onPress: (){
              context.read<HomeBloc>().add(Reset());
              GoRouter.of(context).go("/records");
            }));
          },
        ));
  }
}

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}
