import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/hr_dashboard/page_one_hr.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/hr_dashboard/page_two_hr.dart';

// =============== HR DASHBOARD SCREEN =============== //
class HRDashboardScreen extends StatefulWidget {
  const HRDashboardScreen({super.key});

  @override
  State<HRDashboardScreen> createState() => _HRDashboardScreenState();
}

class _HRDashboardScreenState extends State<HRDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: constants.adminBG,
        child: ListView(
          children: const [
            HRDashPage1(),
            HRDashPage2(),
          ],
        ),
      ),
    );
  }
}
