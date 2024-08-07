// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class StatusInReview extends StatelessWidget {
  const StatusInReview({super.key});

  @override
  Widget build(BuildContext context) {
    return const PillContainer(
        color: constants.statusGreen,
        width: 90,
        label: "In Review",
        labelColor: constants.mainTextWhite);
  }
}
