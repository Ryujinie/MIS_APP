import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusLate extends StatelessWidget {
  const StatusLate({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusOrange,
        width: 90,
        label: "Late",
        labelColor: constants.mainTextWhite);
  }
}
