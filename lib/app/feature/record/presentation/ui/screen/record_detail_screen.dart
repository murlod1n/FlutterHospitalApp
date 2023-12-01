import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";

import "../../../../../../core/extension/string_extension.dart";
import "../../../../shared/presentation/components/service_card.dart";
import "../../../../shared/presentation/model/service_ui.dart";
import "../../bloc/record_bloc.dart";
import "../../model/record_to_doctor_ui.dart";

class RecordDetailScreen extends StatelessWidget {
  const RecordDetailScreen({required this.recordId, super.key});

  final int recordId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (BuildContext context, RecordState state) {
        final RecordToDoctorUI record =
            state.recordList.firstWhere((RecordToDoctorUI element) => element.id == recordId);
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
            title: Text(
              "${DateFormat.yMMMMd("ru")
                  .format(DateFormat("dd/MM/yyyy")
                  .parse(record.date)).mmmmyDateFormat()}"
                  " ${record.date.split(" ")[1]}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ),
            backgroundColor: const Color(0xFFF8F8F8),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text("Дата приема"),
                                  Text(DateFormat.yMMMMd("ru")
                                    .format(DateFormat("dd/MM/yyyy")
                                    .parse(record.date))
                                    .mmmmyDateFormat()
                                  )
                               ]
                              ),
                              _dashLine(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text("Время приема"),
                                  Text(record.date.split(" ")[1])
                                ]
                              ),
                              _dashLine(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text("Стоимость"),
                                  Text(
                                    NumberFormat(".00").format(record.services
                                      .map((ServiceUI e) => double.parse(e.price))
                                      .reduce((double a, double b) => a + b)
                                    )
                                  )
                                ]
                              ),
                              _dashLine(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text("Врач"),
                                  Text(record.doctor.name)
                                ]
                              ),
                              _dashLine()
                            ],
                          ),
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22.0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: record.services.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ServiceCard(
                                service: record.services[index],
                              )
                            );
                          }
                        )
                      ],
                    )
                  )
                ),
              ],
            )
        );
      },
    );
  }

  Widget _dashLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
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
              child: DecoratedBox(decoration: BoxDecoration(color: Color(0x69ABABAB))),
            );
          }),
        );
      }),
    );
  }
}
