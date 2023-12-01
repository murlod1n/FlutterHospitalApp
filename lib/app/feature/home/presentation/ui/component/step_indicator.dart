import "package:flutter/material.dart";

class StepIndicator extends StatelessWidget {
  const StepIndicator({ required this.step, super.key });

  final int step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color(0x63D6DBE1), blurRadius: 40,),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                step == 0 ? Theme.of(context).colorScheme.primary
                : step > 0 ?  Theme.of(context).colorScheme.onBackground
                : const Color(0xFFC3C7CC),
            ),
            width: 25,
            height: 25,
            child:
              const Center(
                child: Text("1", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white))
              ),
          ),
        const SizedBox(width: 6),
        if (step == 0)
          Row(
            children: <Widget>[
              Text("Врач", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
              const SizedBox(width: 6)
            ]
          )
        else const SizedBox(),
        Expanded(
          child: Container(height: 1, color: Colors.grey)
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
              step == 1 ? Theme.of(context).colorScheme.primary
              : step > 1 ?  Theme.of(context).colorScheme.onBackground
              : const Color(0xFFC3C7CC),
          ),
          width: 25,
          height: 25,
          child:
            const Center(
                child: Text("2", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white))
            )
        ),
        const SizedBox(width: 6),
        if (step == 1)
          Row(
            children: <Widget>[
              Text("Услуги", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
              const SizedBox(width: 6)
            ]
          )
        else const SizedBox(),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey
          )
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
              step == 2 ? Theme.of(context).colorScheme.primary
              : step > 2 ?  Theme.of(context).colorScheme.onBackground
              : const Color(0xFFC3C7CC),
          ),
          width: 25,
          height: 25,
          child:
            const Center(
              child: Text("3", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white))
            ),
        ),
        const SizedBox(width: 6),
        if (step == 2)
          Row(
            children: <Widget>[
              Text("Дата", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
              const SizedBox(width: 6)
            ]
          )
        else const SizedBox(),
      ]),
    );
  }
}
