import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";
import "package:intl/intl.dart";

import "../../../../../../core/extension/string_extension.dart";
import "../../bloc/home_bloc/home_bloc.dart";

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key});

  @override
  State<StatefulWidget> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  int daysOfMonth = 1;
  int currentMonth = DateTime.now().month;
  String selectedTime = "";
  int currentDay = DateTime.now().day - 1;

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
    "20:00",
  ];

  @override
  void initState() {
    super.initState();
    getCurrentDate();
  }

  void getCurrentDate() {
    final DateTime now = DateTime.now();
    final DateTime dateParse = DateTime(now.year, currentMonth + 1, 0);

    setState(() {
      daysOfMonth = dateParse.day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>
      (builder: (BuildContext context, HomeState state) {
      return Expanded(
        child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 22, right: 22, top: 30),
                      child: Row(
                        children: <Widget>[Text("Выберите дату приема", style: Theme.of(context).textTheme.titleSmall)],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFE8E8E8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                              width: 26,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  side: const BorderSide(color: Color(0xFF7D8186))
                                ),
                                onPressed: () => setState(() {
                                  (currentMonth == 1) ? currentMonth = 12  : currentMonth--;
                                  getCurrentDate();
                                }),
                                child: SvgPicture.asset("assets/images/arrow_l.svg", width: 14, height: 14)
                              ),
                            ),
                            Text(DateFormat.yMMMM("ru")
                              .format(DateTime(DateTime.now().year, currentMonth + 1, 0))
                              .mmmmyDateFormat().capitalize(),
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                            SizedBox(
                              height: 25,
                              width: 26,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  side: const BorderSide(color: Color(0xFF7D8186))
                                ),
                                onPressed: () => setState(() {
                                  currentMonth == 12 ? currentMonth = 1 : currentMonth++;
                                  getCurrentDate();
                                }),
                                child: SvgPicture.asset("assets/images/arrow_r.svg", width: 14, height: 14)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: _dayList(daysOfMonth, (String day) => context.read<HomeBloc>().add(SetDate(date: day)))
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22, right: 22, top: 26),
                      child: Row(
                        children: <Widget>[
                          Text("Выберите время приема",style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(left: 22, right: 22, top: 14, bottom: 120),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 4,
                      childAspectRatio: 1 / .5,
                      children: <Widget>[
                        for (final String time in times)
                          GestureDetector(
                            onTap: () {
                              Feedback.forTap(context);
                              setState(() {
                                selectedTime = time;
                              });
                              context.read<HomeBloc>().add(SetTime(time: time));
                            },
                            child: Container(
                              decoration: ShapeDecoration(
                                color: time == selectedTime
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                shadows: const <BoxShadow>[BoxShadow(color: Color(0x63D6DBE1), blurRadius: 40)],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(time,
                                    style: Theme.of(context)
                                      .textTheme
                                      .labelLarge?.copyWith(
                                        color: time == selectedTime ? Colors.white : Theme.of(context).colorScheme.onBackground
                                    )
                                  ),
                                ],
                              )
                            ),
                          )
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      side: const BorderSide(color: Color(0xFF7D8186))),
                      onPressed: () => context.read<HomeBloc>().add(StepToSelectService(step: 1)),
                      child: const Icon(Icons.arrow_back, size: 30, color: Color(0xFF7D8186))
                    ),
                  ),
                  const SizedBox(width: 14),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 118,
                    child: FilledButton(
                      onPressed: () => context.read<HomeBloc>().add(PostRecord()),
                      child: const Text("Забронировать")
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      );
    });
  }

  Widget _dayList(int monthLength, Function setDate) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: ListView.separated(
        padding: const EdgeInsets.only(right: 22),
        scrollDirection: Axis.horizontal,
        itemCount: monthLength,
        clipBehavior: Clip.none,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
        itemBuilder: (BuildContext context, int index) {
          return _dayCard(index, setDate);
        }
      ),
    );
  }

  Widget _dayCard(int day, Function setDate) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Feedback.forTap(context);
          currentDay = day;
          setDate(day.toString());
        });
        context.read<HomeBloc>().add(
            SetDate(date: DateFormat("dd/MM/yyyy").format(DateTime(DateTime.now().year, currentMonth, day+1))));
      },
      child: Container(
        width: 55,
        height: 75,
        decoration: ShapeDecoration(
          color: day == currentDay
            ? Theme.of(context).primaryColor
            : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          shadows: const <BoxShadow>[
            BoxShadow(color: Color(0x63D6DBE1), blurRadius: 40,)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.E("ru").format(DateTime(DateTime.now().year, currentMonth, day + 1)).toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 12,
                color: day == currentDay
                  ? Colors.white
                  : const Color(0xFFC3C7CC)
              )
            ),
            Text(
              DateFormat("dd.MM").format(DateTime(DateTime.now().year, currentMonth, day + 1)),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: day == currentDay
                  ? Colors.white
                  : Theme.of(context).colorScheme.onBackground
              )
            )
          ],
        )
      ),
    );
  }
}
