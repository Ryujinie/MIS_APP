import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class AdminTab extends StatelessWidget {
  final List<Widget> tabs;

  const AdminTab({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: constants.adminBtn,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: RepaintBoundary(
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
          tabs: tabs,
        ),
      ),
    );
  }
}
