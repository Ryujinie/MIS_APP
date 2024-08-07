import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusApproved extends StatelessWidget {
  const StatusApproved({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusGreen,
        width: 150,
        label: "Approved",
        labelColor: constants.mainTextWhite);
  }
}
