import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

import "../../bloc/home_bloc/home_bloc.dart";
import "../../bloc/service_bloc/service_bloc.dart";
import "service_card.dart";

class SelectedServicesSection extends StatelessWidget {
  const SelectedServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState recordState) {
        return BlocBuilder<ServiceBloc, ServiceState>(
            builder: (BuildContext context, ServiceState state) {
          return Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                            child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 22, right: 22, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Выбранные услуги", style: Theme.of(context).textTheme.titleSmall),
                              SvgPicture.asset("assets/images/i_icon.svg", width: 20, height: 20)
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(children: [
                          if (recordState.serviceList.isEmpty) _emptyListCard(context) else const SizedBox(),
                        ]),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          width: MediaQuery.of(context).size.width ,
                          child: FilledButton(
                              onPressed: () => {
                                    context.read<ServiceBloc>().add(
                                        GetServiceList(
                                            doctorKod: recordState.doctor!.kod)),
                                    GoRouter.of(context).go("/home/services")
                                  },
                              child: Text("Добавить услугу")),
                        ),
                        if (recordState.serviceList.isNotEmpty)
                          ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 16.0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: recordState.serviceList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: ServiceCard(
                                      service: recordState.serviceList[index],
                                    ));
                              })
                      ],
                    ))),
                  ],
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                side: const BorderSide(width: 1.0, color: Color(0xFF7D8186)),
                              ),
                              onPressed: () => context
                                  .read<HomeBloc>()
                                  .add(StepToSelectService(step: 0)),
                              child: const Icon(Icons.arrow_back, size: 30, color: Color(0xFF7D8186))),
                        ),
                        const SizedBox(width: 14),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 118,
                          child: OutlinedButton(
                              onPressed: () => context
                                  .read<HomeBloc>()
                                  .add(StepToSelectDate(step: 2)),
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
      },
    );
  }

  Widget _emptyListCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x63D6DBE1),
                blurRadius: 40,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/imp_icon.svg", width: 24, height: 24),
                    const SizedBox(width: 6),
                    Text("Услуга не выбрана", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16))
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Text("Для добавления услуги нажмите кнопку «Добавить услугу»", textAlign: TextAlign.center,)),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
