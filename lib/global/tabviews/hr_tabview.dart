import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// =============== TAB CUSTOM - HR EMP MNGMT =============== //
class HRTab extends StatefulWidget {
  final List<Widget> tabs;

  const HRTab({
    super.key,
    required this.tabs,
  });

  @override
  State<HRTab> createState() => _HRTabState();
}

class _HRTabState extends State<HRTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: constants.hrPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          color: constants.mainTextWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        indicatorColor: constants.mainTextWhite,
        labelColor: constants.mainTextBlack,
        unselectedLabelColor: constants.mainTextWhite,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: constants.mainTextBlack,
              fontSize: 14,
            ),
        tabs: widget.tabs,
      ),
    );
  }
}
