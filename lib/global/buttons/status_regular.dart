import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusRegular extends StatelessWidget {
  const StatusRegular({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusGreen,
        width: 90,
        label: "Regular",
        labelColor: constants.mainTextWhite);
  }
}
