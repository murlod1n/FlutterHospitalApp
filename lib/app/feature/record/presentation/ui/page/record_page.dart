import "package:auto_route/annotations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class _RecordPageState extends State<RecordPage> {



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
                  bottomRight: Radius.circular(10))),
          title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Запись на приём")]),
        ),
        backgroundColor: const Color(0xFFF8F8F8),
        body: SizedBox()
      );
  }

}


@RoutePage()
class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecordPageState();

}