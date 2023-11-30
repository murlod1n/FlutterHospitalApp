import "package:auto_route/annotations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../../service_locator/locator_config.dart";
import "../../../../shared/data/storage/dao/database_dao.dart";
import "../../../../shared/domain/entity/record_entity.dart";
import "../../bloc/record_bloc.dart";
import "../../model/record_to_doctor_ui.dart";

class TestEmpty {
  const TestEmpty({required this.age, required this.name});

  final int age;
  final String name;
}

class _RecordPageState extends State<RecordPage> {
  final DatabaseDao s = locator<DatabaseDao>();
  final Map<String, List<RecordEntity>> recordsList =
      <String, List<RecordEntity>>{};

  @override
  Widget build(BuildContext context) {
    s.getAllRecords().listen((event) {
      event.forEach((element) {
        recordsList.putIfAbsent(element.date, () => []).add(element);
      });
      debugPrint("sort = " + recordsList.toString());
    });
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
              children: <Widget>[Text("Записи на приём")]),
        ),
        backgroundColor: const Color(0xFFF8F8F8),
        body: BlocBuilder<RecordBloc, RecordState>(
            builder: (BuildContext context, RecordState state) {
              final children = <Widget>[];
              for(final String i in state.recordList.keys){
                  children.add(
                    Column(
                      children: [
                        Text(i.toString()),
                        SingleChildScrollView(
                          child: ListView.builder(shrinkWrap: true, itemCount: state.recordList[i]!.length,itemBuilder: (BuildContext context, int index){
                            return Column(
                              children: [
                                Text(state.recordList[i]![index].doctor.name.toString())
                              ],
                            );
                          }),
                        )

                      ],
                    )
                  );
              }
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                child: SingleChildScrollView(
                    child: Column(children: children),
                ),
              ),
            ],
          );
        }));
  }
}

@RoutePage()
class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecordPageState();
}
