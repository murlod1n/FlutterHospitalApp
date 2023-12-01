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

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

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
            bottomRight: Radius.circular(10))
          ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Запись на приём", style: Theme.of(context).textTheme.titleMedium)
          ]
        ),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return
            state.status.isInitial ?
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
                    child: StepIndicator(step: state.step)
                  ),
                  if (state.step == 0) const SelectDoctorSection()
                  else if (state.step == 1) const SelectedServicesSection()
                  else const SelectDateSection()
                ],
              )
              : state.status.isError ? ErrorSection(
                buttonText: "Назад",
                onPress: () => context.read<HomeBloc>().add(ReturnToPage()),
                error: state.error)
              : Center(
                child: SuccessSection(
                  onPress: (){
                    context.read<HomeBloc>().add(Reset());
                    GoRouter.of(context).go("/records");
                  }
                )
              );
        },
      )
    );
  }
}
