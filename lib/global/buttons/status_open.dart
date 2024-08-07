import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusOpen extends StatelessWidget {
  const StatusOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return PillContainer(
        color: constants.lightGray.withOpacity(0.5),
        width: 150,
        label: "Open",
        labelColor: constants.mainTextWhite);
  }
}
