import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusPresent extends StatelessWidget {
  const StatusPresent({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusGreen,
        width: 90,
        label: "Present",
        labelColor: constants.mainTextWhite);
  }
}

class DashStatusPresent extends StatelessWidget {
  const DashStatusPresent({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.label,
    required this.labelColor,
    this.fontSize = 25.0,
    this.child,
  });

  final Color color;
  final double width;
  final double height;
  final String label;
  final Color labelColor;
  final Widget? child;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
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
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: labelColor,
                fontSize: fontSize,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SmallDashStatusPresent extends StatelessWidget {
  const SmallDashStatusPresent({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.label,
    required this.labelColor,
    this.fontSize = 18.0,
    this.child,
  });

  final Color color;
  final double width;
  final double height;
  final String label;
  final Color labelColor;
  final Widget? child;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: labelColor,
                fontSize: fontSize,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
