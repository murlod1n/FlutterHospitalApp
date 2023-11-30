

import "package:flutter/material.dart";
import "package:loading_indicator/loading_indicator.dart";

class LoadingIndicatorSection extends StatelessWidget {
  LoadingIndicatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          child: LoadingIndicator(
              indicatorType: Indicator.circleStrokeSpin,
              colors: [Theme.of(context).primaryColor],
              strokeWidth: 3,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent
          ),
        ),
        SizedBox(height: 20),
        Text("Загрузка...", style: Theme.of(context).textTheme.labelLarge)
      ],
    );
  }


}