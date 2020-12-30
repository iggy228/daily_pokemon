import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StatIndicator extends StatelessWidget {
  final String imageUrl;
  final Color color;
  final int value;

  StatIndicator({this.imageUrl, this.color, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 32, height: 32, color: color),
          SizedBox(width: 16),
          Expanded(
            child: StepProgressIndicator(
              totalSteps: 255,
              currentStep: value,
              padding: 0,
              size: 24,
              roundedEdges: Radius.circular(99),
              unselectedColor: Colors.white,
              selectedColor: color,
            ),
          ),
        ],
      ),
    );
  }
}
