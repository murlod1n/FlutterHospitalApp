import "package:auto_route/annotations.dart";
import "package:flutter/cupertino.dart";

@RoutePage()
class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("records"),
    );
  }
}