import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
//import 'package:ssi_mis_flutter/global/buttons/status_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusPending extends StatelessWidget {
  const StatusPending({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusOrange,
        width: 100,
        label: "Pending",
        labelColor: constants.mainTextWhite);
  }
}
