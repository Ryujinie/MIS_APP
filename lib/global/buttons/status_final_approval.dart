import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusFinalApproval extends StatelessWidget {
  const StatusFinalApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusOrange,
        width: 150,
        label: "For Final Approval",
        labelColor: constants.mainTextWhite);
  }
}
