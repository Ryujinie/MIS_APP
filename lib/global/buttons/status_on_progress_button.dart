import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusOnProgress extends StatelessWidget {
  const StatusOnProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusOrange,
        width: 90,
        label: "In Progress",
        labelColor: constants.mainTextWhite);
  }
}
