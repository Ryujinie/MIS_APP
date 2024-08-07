import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// =============== TAB CUSTOM - Supervisor EMP MNGMT =============== //
class SupervisorTab extends StatefulWidget {
  final List<Widget> tabs;

  const SupervisorTab({
    super.key,
    required this.tabs,
  });

  @override
  State<SupervisorTab> createState() => _SupervisorTabState();
}

class _SupervisorTabState extends State<SupervisorTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: constants.supervisorPrimary,
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
