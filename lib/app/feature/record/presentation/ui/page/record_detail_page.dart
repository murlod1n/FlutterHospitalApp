import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";

import "../../../../../../core/extension/string_extension.dart";
import '../../../../shared/presentation/components/service_card.dart';
import "../../bloc/record_bloc.dart";
import "../../model/record_to_doctor_ui.dart";

class RecordDetailPage extends StatelessWidget {
  const RecordDetailPage({required this.recordId, super.key});

  final int recordId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (context, state) {
        final RecordToDoctorUI record =
            state.recordList.firstWhere((element) => element.id == recordId);

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
              title: Text(
                  "${DateFormat.yMMMMd("ru").format(DateFormat("dd/MM/yyyy").parse(record.date)).mmmmyDateFormat()} ${record.date.split(" ")[1]}"),
            ),
            backgroundColor: const Color(0xFFF8F8F8),
            body: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Дата приема"),
                                Text(DateFormat.yMMMMd("ru")
                                    .format(DateFormat("dd/MM/yyyy")
                                        .parse(record.date))
                                    .mmmmyDateFormat())
                              ]),
                          _dashLine(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Время приема"),
                                Text(record.date.split(" ")[1])
                              ]),
                          _dashLine(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Стоимость"),
                                Text(NumberFormat(".00").format(record.services
                                    .map((e) => double.parse(e.price))
                                    .reduce((a, b) => a + b)))
                              ]),
                          _dashLine(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Врач"),
                                Text(record.doctor.name)
                              ]),
                          _dashLine()
                        ],
                      ),
                    ),
                    ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 22.0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: record.services.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ServiceCard(
                                service: record.services[index],
                              ));
                        })
                  ],
                ))),
              ],
            ));
      },
    );
  }

  Widget _dashLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
      }),
    );
  }
}
