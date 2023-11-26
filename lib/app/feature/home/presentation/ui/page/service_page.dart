import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "../../../../../routing/app_router.dart";
import "../../../../../service_locator/locator_config.dart";
import "../../../domain/usecase/get_doctor_list_usecase.dart";
import "../../../domain/usecase/get_service_list_usecase.dart";
import "../../bloc/doctor_bloc/doctor_bloc.dart";
import "../../bloc/record_bloc/record_bloc.dart";
import "../../bloc/service_bloc/service_bloc.dart";
import "../../model/service_ui.dart";
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
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Запись на приём")]),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocBuilder<RecordBloc, RecordState>(
              builder: (BuildContext context, RecordState recordState) {
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
    return BlocBuilder<RecordBloc, RecordState>(
        builder: (BuildContext context, RecordState state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [Text("Выберите сервис")],
            ),
            const SizedBox(height: 15),
            ListView.builder(
                itemCount: serviceList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ServiceCard(
                        service: serviceList[index],
                        selectService: () => {
                          context.read<RecordBloc>().add(SelectService(service: serviceList[index])),
                          GoRouter.of(context).pop()
                        }));
                }),
          ],
        ),
      );
    });
  }
}
