import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/supervisor_dashboard/page_one_supervisor.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/supervisor_dashboard/page_two_supervisor.dart';

// =============== SUPERVISOR DASHBOARD SCREEN =============== //
class SupervisorDashboardScreen extends StatefulWidget {
  const SupervisorDashboardScreen({super.key});

  @override
  State<SupervisorDashboardScreen> createState() =>
      _SupervisorDashboardScreenState();
}

class _SupervisorDashboardScreenState extends State<SupervisorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: constants.adminBG,
        child: ListView(
          children: const [
            SupervisorDashPage1(),
            SupervisorDashPage2(),
          ],
        ),
      ),
    );
  }
}
