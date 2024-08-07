import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusAbsent extends StatelessWidget {
  const StatusAbsent({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusRed,
        width: 90,
        label: "Absent",
        labelColor: constants.mainTextWhite);
  }
}
