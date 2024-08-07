import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusApproval extends StatelessWidget {
  const StatusApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusBlue,
        width: 150,
        label: "For Approval",
        labelColor: constants.mainTextWhite);
  }
}
