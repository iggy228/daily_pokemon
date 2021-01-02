import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StatIndicator extends StatelessWidget {
  final String imageUrl;
  final Color color;
  final double value;

  StatIndicator({this.imageUrl, this.color, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 32, height: 32, color: color),
          SizedBox(width: 16),
          Expanded(
            child: TweenAnimationBuilder(
              builder: (BuildContext context, time, _) {
                return StepProgressIndicator(
                  totalSteps: 255,
                  currentStep: (value * time).toInt(),
                  padding: 0,
                  size: 24,
                  roundedEdges: Radius.circular(99),
                  unselectedColor: Colors.white,
                  selectedColor: color,
                );
              },
              duration: Duration(milliseconds: 500),
              tween: Tween<double>(begin: 0.0, end: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
