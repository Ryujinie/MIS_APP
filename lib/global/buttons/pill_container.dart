import 'package:flutter/material.dart';

class PillContainer extends StatelessWidget {
  const PillContainer({
    super.key,
    required this.color,
    required this.width,
    required this.label,
    required this.labelColor,
    this.child,
  });

  final Color color;
  final double width;
  final String label;
  final Color labelColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: labelColor,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
