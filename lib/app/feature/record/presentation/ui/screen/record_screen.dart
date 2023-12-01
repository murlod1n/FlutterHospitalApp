import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:intl/intl.dart";

import "../../../../../../core/extension/string_extension.dart";
import "../../../../shared/presentation/components/error_section.dart";
import "../../bloc/record_bloc.dart";

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

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
            bottomRight: Radius.circular(10)
          )
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Записи на приём")]
        ),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocBuilder<RecordBloc, RecordState>(
        builder: (BuildContext context, RecordState state) {
          final List<Widget> children = <Widget>[];
          for (final String i in state.recordSortedList.keys) {
            children.add(
              Column(children: <Widget>[
                Row(children: <Widget>[
                  Text(
                    DateFormat.yMMMMd("ru")
                      .format(DateFormat("dd/MM/yyyy").parse(i))
                      .mmmmyDateFormat(),
                     style: Theme.of(context).textTheme.titleSmall),
                ]),
                SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.recordSortedList[i]!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          context.goNamed("detail", pathParameters: <String, String>{"id": state.recordSortedList[i]![index].id.toString()});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11),
                            child: SizedBox(
                              height: 46,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFF0066),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      shadows: const <BoxShadow>[
                                        BoxShadow(
                                          color: Color(0x63D6DBE1),
                                          blurRadius: 40,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          state.recordSortedList[i]![index].date
                                            .split(" ")[1], style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(color: Colors.white)
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      shadows: const <BoxShadow>[
                                        BoxShadow(color: Color(0x63D6DBE1), blurRadius: 40,)
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width - 104,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          state.recordSortedList[i]![index].doctor.name,
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12)
                                        ),
                                        Text(
                                          state.recordSortedList[i]![index].doctor.dolzhnost,
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11)
                                        )
                                      ]
                                    )  ,
                                  ),
                                ],
                              ),
                            ),
                        ),
                      );
                    }
                  ),
                ),
                const SizedBox(height: 20)
              ])
          );
        }
        return
          state.status.isSuccess ?
            Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      child: Column(children: children),
                    ),
                  ),
                ),
              ],
            )
          : state.status.isError ? ErrorSection(
              onPress: () => context.read<RecordBloc>().add(GetRecordList()),
              error: state.error
          ) : const SizedBox();

      })
    );
  }
}
