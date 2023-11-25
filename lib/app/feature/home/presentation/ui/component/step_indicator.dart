import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class StepIndicator extends StatelessWidget {
  const StepIndicator({required this.step, super.key});

  final int step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 50,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFFFFFF),
      ),
      padding: const EdgeInsets.only(left: 50, right: 50, top: 25, bottom: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: step == 0 ? Colors.blue : Colors.grey,
          ),
          width: 25,
          height: 25,
          child: const Center(child: Text("1")),
        ),
        const SizedBox(width: 6),
        if (step == 0)
          const Row(children: <Widget>[Text("Врач"), SizedBox(width: 6)])
        else
          const SizedBox(),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: step == 1 ? Colors.blue : Colors.grey,
          ),
          width: 25,
          height: 25,
          child: const Center(child: Text("2")),
        ),
        const SizedBox(width: 6),
        if (step == 1)
          const Row(children: <Widget>[Text("Услуги"), SizedBox(width: 6)])
        else
          const SizedBox(),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: step == 2 ? Colors.blue : Colors.grey,
          ),
          width: 25,
          height: 25,
          child: const Center(child: Text('${3}')),
        ),
        const SizedBox(width: 6),
        if (step == 2)
          Row(children: [Text("Дата"), SizedBox(width: 6)])
        else
          SizedBox(),
      ]),
    );
  }
}
