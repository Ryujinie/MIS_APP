import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// =============== TAB CUSTOM - ADMIN EMP MNGMT =============== //
class ManagerTab extends StatefulWidget {
  final List<Widget> tabs;

  const ManagerTab({
    super.key,
    required this.tabs,
  });

  @override
  State<ManagerTab> createState() => _ManagerTabState();
}

class _ManagerTabState extends State<ManagerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: constants.mngrPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        // border: Border.all(color: Colors.transparent),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          color: constants.mainTextBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        indicatorColor: constants.mainTextBlack,
        labelColor: constants.mainTextWhite,
        unselectedLabelColor: constants.mainTextBlack,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: constants.mainTextWhite,
              fontSize: 14,
            ),
        tabs: widget.tabs,
      ),
    );
  }
}
