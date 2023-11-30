import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "../../../../shared/presentation/model/service_ui.dart";
import "../../bloc/home_bloc/home_bloc.dart";
import "../../bloc/service_bloc/service_bloc.dart";
import "../component/service_card.dart";

@RoutePage()
class ServicePage extends StatelessWidget {
  ServicePage({super.key});

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
        centerTitle: true,
        title:Text("Выбор услуги", textAlign: TextAlign.center),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState homeState) {
            return BlocBuilder<ServiceBloc, ServiceState>(
                builder: (BuildContext context, ServiceState serviceState) {
                  return   serviceState.status.isSuccess
                      ? _serviceList(serviceState.serviceList)
                      : serviceState.status.isLoading
                      ? const Center(child: Text("loading"))
                      : serviceState.status.isError
                      ? Center(child: Text(serviceState.error))
                      : const SizedBox();
                },
            );
          }),
    );
  }

  Widget _serviceList(List<ServiceUI> serviceList) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: serviceList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ServiceCard(
                          service: serviceList[index],
                          selectService: () => {
                            context.read<HomeBloc>().add(SelectService(service: serviceList[index])),
                            GoRouter.of(context).pop()
                          }));
                  }),
            ],
          ),
        ),
      );
    });
  }
}
