import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/admin_dashboard/page_one_admin.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/admin_dashboard/page_two_admin.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// =============== ADMIN DASHBOARD SCREEN =============== //
class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: constants.adminBG,
        child: ListView(
          children: const [
            AdminDashPage1(),
            AdminDashPage2(),
          ],
        ),
      ),
    );
  }
}
