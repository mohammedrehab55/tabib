import 'package:flutter/material.dart';
import 'package:tabib/core/theme/texts_styles.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: List.generate(totalSteps, (index) {
              final isCompleted = index < currentStep;

              return Expanded(
                child: Container(
                  height: 5,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.blue : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 8),
        Text('$currentStep/$totalSteps', style: TextStyles.font14GreyMedium),
      ],
    );
  }
}
