import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../model/doctor_ui.dart";
import "../../model/service_ui.dart";

class ServiceCard extends StatelessWidget {
  ServiceCard(
      {required this.service,
        void Function()? selectService,
        super.key}): selectService = selectService ?? (() => ());

  final ServiceUI service;
  void Function() selectService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectService,
      child: Container(
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
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(service.name),
              Text(service.price)
            ],
          ),
        ),
      ),
    );
  }
}
