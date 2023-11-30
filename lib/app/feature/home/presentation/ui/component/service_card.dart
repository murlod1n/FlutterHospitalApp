import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "../../../../shared/presentation/model/service_ui.dart";


class ServiceCard extends StatelessWidget {
  ServiceCard(
      {required this.service, void Function()? selectService, super.key})
      : selectService = selectService ?? (() => ());

  final ServiceUI service;
  void Function() selectService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectService,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xB2E8E8E8),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: Text(
                          service.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 13,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground))),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final boxWidth = constraints.constrainWidth();
                    const dashWidth = 1.5;
                    final dashHeight = 1.0;
                    final dashCount = (boxWidth / (2 * dashWidth)).floor();
                    return Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: List.generate(dashCount, (_) {
                        return SizedBox(
                          width: dashWidth,
                          height: dashHeight,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Color(0x69ABABAB)),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Стоимость продедуры: ",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Color(0xFF7D8186), fontSize: 12),
                        children: [
                          TextSpan(
                              text: "${service.price.toString()} BYN",
                              style: Theme.of(context).textTheme.labelMedium)
                        ]),
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
