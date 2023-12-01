import "package:flutter/material.dart";
import "../model/service_ui.dart";


class ServiceCard extends StatelessWidget {
  ServiceCard({
    required this.service,
    void Function()? selectService,
    super.key }) : selectService = selectService ?? (() => ());

  final ServiceUI service;
  final void Function() selectService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectService,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xB2E8E8E8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      service.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onBackground)
                    )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double boxWidth = constraints.constrainWidth();
                    const double dashWidth = 1.5;
                    const double dashHeight = 1.0;
                    final int dashCount = (boxWidth / (2 * dashWidth)).floor();
                    return Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: List.generate(dashCount, (_) {
                        return const SizedBox(
                          width: dashWidth,
                          height: dashHeight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0x69ABABAB)),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: "Стоимость продедуры: ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF7D8186),
                        fontSize: 12
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: "${service.price} BYN",
                          style: Theme.of(context).textTheme.labelMedium
                        )
                      ]
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
