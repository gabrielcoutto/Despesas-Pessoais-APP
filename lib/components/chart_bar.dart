import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.label,
    required this.value,
    required this.percentage,
  });

  final String label;
  final double value;
  final double percentage;

  valueChar() {
    if (value > 999 && value < 1000000) {
      return Text('$value.toStringAsFixed(0)');
    } else {
      return Text('${value.toString().substring(0, 1)}M');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainsts) {
        return Column(
          children: [
            Container(
              height: constrainsts.maxHeight * 0.15,
              child: FittedBox(
                child: value < 1000
                    ? Text(
                        value.round().toStringAsFixed(0),
                      )
                    : valueChar(),
              ),
            ),
            SizedBox(height: constrainsts.maxHeight * 0.05),
            Container(
              height: constrainsts.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constrainsts.maxHeight * 0.05),
            Container(
              height: constrainsts.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  label,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
