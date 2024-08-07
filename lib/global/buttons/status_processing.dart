import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusProcessing extends StatelessWidget {
  const StatusProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusBlue,
        width: 90,
        label: "Processing",
        labelColor: constants.mainTextWhite);
  }
}
