import "package:flutter/material.dart";

class ErrorSection extends StatelessWidget {
  const ErrorSection({super.key, required this.onPress, required this.error, this.buttomText = "Попробовать ещё раз"});

  final VoidCallback onPress;
  final String error;
  final String buttomText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Image.asset("assets/images/error_icon.png"),
            Text(error, style: Theme
                .of(context)
                .textTheme
                .labelLarge,),
            const SizedBox(height: 10),
            FilledButton(onPressed: onPress, child: Text(buttomText))
          ]
      ),
    );
  }
}
