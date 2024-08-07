import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/employee_dashboard/page_one_employee.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/employee_dashboard/page_two_employee.dart';

// =============== EMPLOYEE DASHBOARD SCREEN =============== //
class EmployeeDashboardScreen extends StatefulWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  State<EmployeeDashboardScreen> createState() =>
      _EmployeeDashboardScreenState();
}

class _EmployeeDashboardScreenState extends State<EmployeeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: constants.adminBG,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
          children: const [
            EmployeeDashPage1(),
            EmployeeDashPage2(),
          ],
        ),
      ),
    );
  }
}
