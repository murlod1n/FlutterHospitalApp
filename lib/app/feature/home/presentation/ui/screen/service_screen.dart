import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "../../../../shared/presentation/components/error_section.dart";
import "../../../../shared/presentation/components/loading_indicator_section.dart";
import "../../../../shared/presentation/components/service_card.dart";
import "../../../../shared/presentation/model/service_ui.dart";
import "../../bloc/home_bloc/home_bloc.dart";
import "../../bloc/service_bloc/service_bloc.dart";


class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

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
            bottomRight: Radius.circular(10)
          )
        ),
        centerTitle: true,
        title: Text("Выбор услуги", style: Theme.of(context).textTheme.titleMedium),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: Column(
        children: <Widget>[
          BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState homeState) {
              return BlocBuilder<ServiceBloc, ServiceState>(
                builder: (BuildContext context, ServiceState serviceState) {
                   return Expanded(
                     child:
                     serviceState.status.isSuccess ? _serviceList(serviceState.serviceList)
                     : serviceState.status.isLoading ? Center(child: LoadingIndicatorSection())
                     : serviceState.status.isError ? Center(
                       child: ErrorSection(
                         onPress: () => context.read<ServiceBloc>().add(GetServiceList(doctorKod: homeState.doctor!.kod)),
                         error: serviceState.error),
                     )
                     : const SizedBox(),
                   );
                },
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _serviceList(List<ServiceUI> serviceList) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (BuildContext context, HomeState state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: <Widget>[
              ListView.builder(
                itemCount: serviceList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ServiceCard(
                      service: serviceList[index],
                      selectService: () => <void>{
                        context.read<HomeBloc>().add(SelectService(service: serviceList[index])),
                        GoRouter.of(context).pop()
                      }
                    )
                  );
                }
              ),
            ],
          ),
        ),
      );
    });
  }
}
