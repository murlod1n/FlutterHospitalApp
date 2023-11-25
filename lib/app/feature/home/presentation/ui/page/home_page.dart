import "package:auto_route/annotations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "../component/doctor_list_section.dart";
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
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              StepIndicator(step: step),
              const SizedBox(height: 30),
              const DoctorListSection()
            ],
          ),
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
