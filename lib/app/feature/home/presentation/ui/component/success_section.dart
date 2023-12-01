import "package:flutter/material.dart";

class SuccessSection extends StatelessWidget {
  const SuccessSection({super.key, required this.onPress});

  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("assets/images/success_icon.png")),
        const Text("Запись успешна добавлена"),
        FilledButton(
          onPressed: onPress,
          child: const Text("Перейти к моим записи")
        )
      ],
    );
  }
}
