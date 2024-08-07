import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/attendance_screen/employee_attendance_screen.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/employee_dashboard/employee_dashboard_screen.dart';
import 'package:ssi_mis_flutter/features/screens/leave_req_screen/employee_leave_request_screen.dart';
import 'package:ssi_mis_flutter/features/screens/ot_req_screen/employee_otreq_screen.dart';
import 'package:ssi_mis_flutter/features/screens/schedule_screen/employee_schedule_screen.dart';
import 'package:ssi_mis_flutter/features/screens/ticket_screen/employee_ticket_screen.dart';
import 'package:ssi_mis_flutter/global/widgets/bell_notification_popmenu.dart';
import 'package:ssi_mis_flutter/global/widgets/logout_popmenu.dart';

// ========================== Sample Profile ==========================
const String profileImagePath = 'assets/images/appbar_profile.png';

class EmployeeSidebarScreen extends StatefulWidget {
  const EmployeeSidebarScreen({super.key});

  @override
  State<EmployeeSidebarScreen> createState() => _HRSidebarScreenState();
}

class _HRSidebarScreenState extends State<EmployeeSidebarScreen> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  // Build State
  @override
  Widget build(BuildContext context) {
    //
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    //
    return Scaffold(
      key: scaffoldKey,

      // ==================== App Bar ==================== //
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: constants.empBtn,

        // Leading
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
        ),

        // Title
        title: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 68.47,
                    width: 120,
                    child: Image.asset('assets/images/admin_mis_logo.png'),
                  ),
                  const Spacer(),
                  //Notification Bell
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    color: constants.mainTextWhite,
                    onPressed: () => empNotifMenu(context),
                  ),
                  //Divider
                  Container(
                    height: 75,
                    width: 2.5,
                    color: constants.mainTextWhite,
                  ),
                  const SizedBox(width: 10),
                  //Profile Photo
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(profileImagePath),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      //User Name
                      SizedBox(
                        child: Text(
                          'Employee Username',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                color: constants.mainTextWhite,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                      //User Position
                      SizedBox(
                        child: Text(
                          'Employee',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: constants.mainTextWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  //Logout Dropdown etc
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                    color: constants.mainTextWhite,
                    onPressed: () => empShowLogoutMenu(context),
                  ),
                  const SizedBox(width: 0),
                ],
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
        // ignore: unrelated_type_equality_checks
        bottom: index == 0
            ? PreferredSize(
                preferredSize: const Size.fromHeight(40.0),
                child: Stack(
                  children: [
                    // White background filling the entire bottom
                    Positioned.fill(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    // Row with Text widgets wrapped in Padding
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                        child: Row(
                          children: [
                            Text(
                              'Employee',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(
                                width:
                                    10.0), // Add spacing between texts (optional)
                            Text(
                              ' >  Dashboard',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : index == 1
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(40.0),
                    child: Stack(
                      children: [
                        // White background filling the entire bottom
                        Positioned.fill(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        // Row with Text widgets wrapped in Padding
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                            child: Row(
                              children: [
                                Text(
                                  'Employee',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                      ),
                                ),
                                const SizedBox(
                                    width:
                                        10.0), // Add spacing between texts (optional)
                                Text(
                                  ' >  Attendance',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : index == 2
                    ? PreferredSize(
                        preferredSize: const Size.fromHeight(40.0),
                        child: Stack(
                          children: [
                            // White background filling the entire bottom
                            Positioned.fill(
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            // Row with Text widgets wrapped in Padding
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 10, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Employee',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 20,
                                          ),
                                    ),
                                    const SizedBox(
                                        width:
                                            10.0), // Add spacing between texts (optional)
                                    Text(
                                      ' >  Schedule',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : index == 3
                        ? PreferredSize(
                            preferredSize: const Size.fromHeight(40.0),
                            child: Stack(
                              children: [
                                // White background filling the entire bottom
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                // Row with Text widgets wrapped in Padding
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 10, 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Employee',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 20,
                                              ),
                                        ),
                                        const SizedBox(
                                            width:
                                                10.0), // Add spacing between texts (optional)
                                        Text(
                                          ' >  Leave Request',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 20,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : index == 4
                            ? PreferredSize(
                                preferredSize: const Size.fromHeight(40.0),
                                child: Stack(
                                  children: [
                                    // White background filling the entire bottom
                                    Positioned.fill(
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                    // Row with Text widgets wrapped in Padding
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 10, 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Employee',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                            const SizedBox(
                                                width:
                                                    10.0), // Add spacing between texts (optional)
                                            Text(
                                              ' >  Overtime Request',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : index == 5
                                ? PreferredSize(
                                    preferredSize: const Size.fromHeight(40.0),
                                    child: Stack(
                                      children: [
                                        // White background filling the entire bottom
                                        Positioned.fill(
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        // Row with Text widgets wrapped in Padding
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 5, 10, 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Employee',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 20,
                                                      ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        10.0), // Add spacing between texts (optional)
                                                Text(
                                                  ' >  Ticket',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 20,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : PreferredSize(
                                    preferredSize: const Size.fromHeight(
                                        40.0), // Set desired height of spacer
                                    child: Stack(
                                      children: [
                                        // White background filling the entire bottom
                                        Positioned.fill(
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        // Row with Text widgets wrapped in Padding
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 5, 10, 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 20,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
      ),

      // ==================== Drawer ==================== //
      drawer: Drawer(
        backgroundColor: constants.empBtn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            const SizedBox(height: 9),

            // Logo
            Center(
              child: SizedBox(
                height: 120,
                child: Image.asset(
                  'assets/images/admin_mis_logo.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Welcome Admin
            ListTile(
              title: Center(
                child: Text(
                  "Welcome Employee",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: constants.mainTextWhite,
                        fontSize: 22,
                      ),
                ),
              ),
            ),

            //
            const SizedBox(height: 18),

            // ======================= Items ======================= //
            // Dashboard
            ListTile(
              hoverColor: constants.empPrimary,
              tileColor: index == 0 ? constants.empPrimary : constants.empBtn,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    color: constants.mainTextWhite,
                    size: 22,
                  ),

                  const SizedBox(width: 12),

                  //
                  Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextWhite,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),

            // Employee
            ListTile(
              hoverColor: constants.empPrimary,
              tileColor: index == 1 ? constants.empPrimary : constants.empBtn,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.people,
                    color: constants.mainTextWhite,
                    size: 22,
                  ),

                  const SizedBox(width: 12),

                  //
                  Text(
                    "Attendance",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextWhite,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),

            // Schedule
            ListTile(
              hoverColor: constants.empPrimary,
              tileColor: index == 2 ? constants.empPrimary : constants.empBtn,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: constants.mainTextWhite,
                    size: 22,
                  ),

                  const SizedBox(width: 12),

                  //
                  Text(
                    "Schedule",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextWhite,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
            ),

            // Attendance
            ListTile(
              hoverColor: constants.empPrimary,
              tileColor: index == 3 ? constants.empPrimary : constants.empBtn,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.alarm,
                    color: constants.mainTextWhite,
                    size: 22,
                  ),

                  const SizedBox(width: 12),

                  //
                  Text(
                    "Leave Request",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextWhite,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
            ),

            // Leave Request
            ListTile(
              hoverColor: constants.empPrimary,
              tileColor: index == 4 ? constants.empPrimary : constants.empBtn,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.manage_accounts,
                    color: constants.mainTextWhite,
                    size: 22,
                  ),

                  const SizedBox(width: 12),

                  //
                  Text(
                    "Overtime Request",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextWhite,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  index = 4;
                });
              },
            ),

            // Overtime Request
            ListTile(
              hoverColor: constants.empPrimary,
              tileColor: index == 5 ? constants.empPrimary : constants.empBtn,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.event_available,
                    color: constants.mainTextWhite,
                    size: 22,
                  ),

                  const SizedBox(width: 12),

                  //
                  Text(
                    "Ticket",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextWhite,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  index = 5;
                });
              },
            ),
          ],
        ),
      ),

      // ==================== Body ==================== //

      body: index == 0
          ? const EmployeeDashboardScreen()
          : index == 1
              ? const EmployeeAttendanceScreen()
              : index == 2
                  ? const EmployeeScheduleScreen()
                  : index == 3
                      ? const EmployeeLeaveReqScreen()
                      : index == 4
                          ? const EmployeeOTRequestScreen()
                          : index == 5
                              ? const EmployeeTicketScreen()
                              : const EmployeeDashboardScreen(),
    );

    //
  }
}
