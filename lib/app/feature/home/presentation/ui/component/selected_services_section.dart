import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:hospital_app/app/feature/home/presentation/ui/component/service_card.dart";
import "../../bloc/record_bloc/record_bloc.dart";
import "../../bloc/service_bloc/service_bloc.dart";
import "../../model/service_ui.dart";

class SelectedServicesSection extends StatelessWidget {
  const SelectedServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (BuildContext context, RecordState recordState) {
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Выбранные услуги"),
                            Icon(Icons.info_sharp, color: Colors.grey)
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(children: [
                          recordState.serviceList.isEmpty
                              ? _emptyListCard()
                              : SizedBox(),
                        ]),
                        const SizedBox(height: 15),
                        FilledButton(
                            onPressed: () => {
                                  context.read<ServiceBloc>().add(
                                      GetServiceList(
                                          doctorKod: recordState.doctor!.kod)),
                                  GoRouter.of(context).go("/home/services")
                                },
                            child: Text("Добавить услугу")),
                        if (recordState.serviceList.isNotEmpty)
                          ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 16.0),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: recordState.serviceList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: ServiceCard(
                                      service: recordState.serviceList[index],
                                    ));
                              })
                        else
                          Text("empty"),
                      ],
                    ))),
                  ],
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  child: Row(
                    children: [
                      OutlinedButton(
                          onPressed: () => context
                              .read<RecordBloc>()
                              .add(StepToSelectService(step: 0)),
                          child: Text("-")),
                      OutlinedButton(
                          onPressed: () => context
                              .read<RecordBloc>()
                              .add(StepToSelectDate(step: 2)),
                          child: Text("Продлжить"))
                    ],
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }

  Widget _emptyListCard() {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 50,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_sharp, color: Colors.grey),
                  Text("Услуга не выбрана")
                ],
              ),
              Text("data asdasdsad sadasdasd asdas dasdsa ")
            ],
          ),
        ));
  }
}
