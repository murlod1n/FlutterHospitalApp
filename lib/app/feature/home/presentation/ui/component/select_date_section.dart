import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";

import "../../bloc/record_bloc/record_bloc.dart";

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key});

  @override
  State<StatefulWidget> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  int daysOfMonth = 1;
  int currentMonth = DateTime
      .now()
      .month;
  String selectedTime = "";
  int currentDay = 0;

  final List<String> times = [
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00"
  ];

  void getCurrentDate() {
    final DateTime now = DateTime.now();
    final DateTime dateParse = DateTime(now.year, currentMonth, 0);

    setState(() {
      daysOfMonth = dateParse.day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (BuildContext context, RecordState state) {
        return Stack(
            children: [
              Column(children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: () =>
                            setState(() {
                              if (currentMonth == 1) {
                                currentMonth = 12;
                              } else {
                                currentMonth--;
                              }
                            }),
                        child: Text("-")),
                    Text(DateFormat("MMMM")
                        .format(DateTime(DateTime
                        .now()
                        .year, currentMonth, 0)) +
                        " int = " +
                        daysOfMonth.toString()),
                    OutlinedButton(
                        onPressed: () =>
                            setState(() {
                              if (currentMonth == 12) {
                                currentMonth = 1;
                              } else {
                                currentMonth++;
                              }
                              getCurrentDate();
                            }),
                        child: Text("+")),
                  ],
                ),
                Container(height: 75, child: _dayList(daysOfMonth, (String day) =>
                    context
                        .read<RecordBloc>()
                        .add(SetDate(date: day)))),
                Text("date"),
                Wrap(
                    spacing: 6.0,
                    children: [
                      for(String i in times)
                        ChoiceChip(showCheckmark: false,
                            label: Text(i),
                            selected: i == selectedTime,
                            onSelected: (_) =>
                                setState(() {
                                  selectedTime = i;
                                  context.read<RecordBloc>()
                                      .add(SetTime(time: i));
                                  getCurrentDate();
                                }))
                    ]),
                Positioned(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  child: Row(
                    children: [
                      OutlinedButton(
                          onPressed: () =>
                              context
                                  .read<RecordBloc>()
                                  .add(StepToSelectService(step: 1)),
                          child: Text("-")),
                      OutlinedButton(
                          onPressed: () =>
                              context
                                  .read<RecordBloc>()
                                  .add(PostRecord()),
                          child: Text("Продлжить"))
                    ],
                  ),
                )
              ]),
            ]
        );
      }
    );
  }

  Widget _dayList(int monthLength, Function(String) setDate) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: monthLength,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(width: 10),
        itemBuilder: (BuildContext context, int index) {
          return _dayCard(index, setDate);
        });
  }

  Widget _dayCard(int day, Function(String) setDate) {
    return GestureDetector(onTap: () => setState(() {
      Feedback.forTap(context);
      currentDay = day;
      setDate(day.toString());
    }),
      child: Container(
          width: 55,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: currentDay == day ? Colors.red : Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(DateFormat("EEE")
                  .format(DateTime(DateTime
                  .now()
                  .year, currentMonth-1, day+1)),
                  style: TextStyle(
                    fontSize: 12,
                  )),
              Text(DateFormat("dd.MM")
                  .format(DateTime(DateTime
                  .now()
                  .year, currentMonth-1, day+1)).toString(),
                  style: TextStyle(
                    fontSize: 14,
                  ))
            ],
          )),
    );
  }
}
