import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AttributeWidget extends StatelessWidget {
  final String name;
  final dynamic attribute;

  const AttributeWidget({
    super.key,
    required this.attribute,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    double maxValue = 200;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: LinearPercentIndicator(
            width: maxValue,
            lineHeight: 8.0,
            percent: attribute['base_stat'] / maxValue * 0.75,
            animation: true,
            progressColor: Colors.green,
          ),
        )
      ],
    );
  }
}
