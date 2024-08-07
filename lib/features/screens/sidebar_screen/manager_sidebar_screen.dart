import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/attendance_screen/manager_attendance_screen.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/manager_dashboard_screen.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/manager_emp_management_screen.dart';
import 'package:ssi_mis_flutter/features/screens/leave_req_screen/manager_leave_request_screen.dart';
import 'package:ssi_mis_flutter/features/screens/ot_req_screen/manager_otreq_screen.dart';
import 'package:ssi_mis_flutter/features/screens/schedule_screen/manager_sched_screen.dart';
import 'package:ssi_mis_flutter/features/screens/ticket_screen/manager_ticket_screen.dart';
import 'package:ssi_mis_flutter/global/widgets/logout_popmenu.dart';
import 'package:ssi_mis_flutter/global/widgets/bell_notification_popmenu.dart';

// ========================== Sample Profile ==========================
const String profileImagePath = 'assets/images/appbar_profile.png';

class ManagerSidebarScreen extends StatefulWidget {
  const ManagerSidebarScreen({super.key});

  @override
  State<ManagerSidebarScreen> createState() => _ManagerSidebarScreenState();
}

class _ManagerSidebarScreenState extends State<ManagerSidebarScreen> {
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
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        key: scaffoldKey,

        // ==================== App Bar ==================== //
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: constants.mngrPrimary,

          // Leading
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 28,
            ),
          ),

          // Title
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
                      child: Image.asset('assets/images/mis_logo_manager.png'),
                    ),
                    const Spacer(),
                    //Notification Bell
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      color: constants.mainTextBlack,
                      onPressed: () => managerNotifMenu(context),
                    ),
                    //Divider
                    Container(
                      height: 75,
                      width: 2.5,
                      color: constants.mainTextBlack,
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
                            'Manager Name',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                        //User Position
                        SizedBox(
                          child: Text(
                            'Manager',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: constants.mainTextBlack,
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
                      color: constants.mainTextBlack,
                      onPressed: () => managerShowLogoutMenu(context),
                    ),
                    const SizedBox(width: 0),
                  ],
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: true,
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
                                'Manager',
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
                      preferredSize: const Size.fromHeight(0.0),
                      child: Container(),
                      // child: Stack(
                      //   children: [
                      //     // White background filling the entire bottom
                      //     Positioned.fill(
                      //       child: Container(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     // Row with Text widgets wrapped in Padding
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Padding(
                      //         padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                      //         child: Row(
                      //           children: [
                      //             Text(
                      //               'Manager',
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .bodySmall
                      //                   ?.copyWith(
                      //                     color: constants.mainTextGrey,
                      //                     fontSize: 20,
                      //                   ),
                      //             ),
                      //             const SizedBox(
                      //                 width:
                      //                     10.0), // Add spacing between texts (optional)
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                                        'Manager',
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
                                        ' >  Department',
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
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 5, 10, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Manager',
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
                                            ' >  Job Position',
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
                          // : index == 1
                          //     ? PreferredSize(
                          //         preferredSize: const Size.fromHeight(0.0),
                          //         child: Stack(
                          //           children: [
                          //             Positioned.fill(
                          //               child: Container(
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.fromLTRB(
                          //                     15, 5, 10, 5),
                          //                 child: Row(
                          //                   children: [
                          //                     Text(
                          //                       'Administrator',
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .bodySmall
                          //                           ?.copyWith(
                          //                             color: constants
                          //                                 .mainTextGrey,
                          //                             fontSize: 20,
                          //                           ),
                          //                     ),
                          //                     const SizedBox(width: 10.0),
                          //                     Text(
                          //                       ' >  Employee Management',
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .titleSmall
                          //                           ?.copyWith(
                          //                             color: constants
                          //                                 .mainTextGrey,
                          //                             fontSize: 20,
                          //                           ),
                          //                     ),
                          //                     const Spacer(),
                          //                     // RichText(
                          //                     //   text: TextSpan(
                          //                     //     children: [
                          //                     //       TextSpan(
                          //                     //         text: DateFormat('h')
                          //                     //             .format(DateTime.now()),
                          //                     //         style: Theme.of(context)
                          //                     //             .textTheme
                          //                     //             .bodySmall
                          //                     //             ?.copyWith(
                          //                     //               color: constants.mainTextGrey,
                          //                     //               fontSize: 20,
                          //                     //             ),
                          //                     //       ),
                          //                     //       TextSpan(
                          //                     //         text: DateFormat(':mm ')
                          //                     //             .format(DateTime.now()),
                          //                     //         style: Theme.of(context)
                          //                     //             .textTheme
                          //                     //             .bodySmall
                          //                     //             ?.copyWith(
                          //                     //               color: constants.mainTextGrey,
                          //                     //               fontSize: 20,
                          //                     //             ),
                          //                     //       ),
                          //                     //       TextSpan(
                          //                     //         text: DateFormat('a ')
                          //                     //             .format(DateTime.now()),
                          //                     //         style: Theme.of(context)
                          //                     //             .textTheme
                          //                     //             .titleSmall
                          //                     //             ?.copyWith(
                          //                     //               color: constants.mainTextGrey,
                          //                     //               fontSize: 20,
                          //                     //             ),
                          //                     //       ),
                          //                     //     ],
                          //                     //   ),
                          //                     // ),
                          //                     //Divider
                          //                     Container(
                          //                       height: 25,
                          //                       width: 1.5,
                          //                       color: constants.mainTextGrey,
                          //                     ),
                          //                     Text(
                          //                       ' PST',
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .titleSmall
                          //                           ?.copyWith(
                          //                             color: constants
                          //                                 .mainTextGrey,
                          //                             fontSize: 20,
                          //                           ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       )
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
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 5, 10, 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Manager',
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
                                                ' >  Schedule',
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
                              : index == 3
                                  ? PreferredSize(
                                      preferredSize:
                                          const Size.fromHeight(40.0),
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
                                                  const EdgeInsets.fromLTRB(
                                                      15, 5, 10, 5),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Manager',
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
                                                    ' >  Attendance',
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
                                  : index == 4
                                      ? PreferredSize(
                                          preferredSize:
                                              const Size.fromHeight(40.0),
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
                                                      const EdgeInsets.fromLTRB(
                                                          15, 5, 10, 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Manager',
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
                                                        ' >  Leave Request',
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
                                      : index == 5
                                          ? PreferredSize(
                                              preferredSize:
                                                  const Size.fromHeight(40.0),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          15, 5, 10, 5),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Manager',
                                                            style: Theme.of(
                                                                    context)
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
                                                            ' >  Overtime Request',
                                                            style: Theme.of(
                                                                    context)
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
                                          : index == 6
                                              ? PreferredSize(
                                                  preferredSize:
                                                      const Size.fromHeight(
                                                          40.0),
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 5, 10, 5),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Manager',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                      color: constants
                                                                          .mainTextGrey,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                              ),
                                                              const SizedBox(
                                                                  width:
                                                                      10.0), // Add spacing between texts (optional)
                                                              Text(
                                                                ' >  Ticket',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                      color: constants
                                                                          .mainTextGrey,
                                                                      fontSize:
                                                                          20,
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
                                                  preferredSize: const Size
                                                      .fromHeight(
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 5, 10, 5),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                      color: constants
                                                                          .mainTextGrey,
                                                                      fontSize:
                                                                          20,
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
          backgroundColor: constants.mngrPrimary,
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
                    'assets/images/mis_logo_manager.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Welcome Admin
              ListTile(
                title: Center(
                  child: Text(
                    "Welcome Manager",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: constants.mainTextBlack,
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
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 0
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Dashboard",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
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
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 1
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.people,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Employee",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
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
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 2
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Schedule",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
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
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 3
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.alarm,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Attendance",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
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
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 4
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.manage_accounts,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Leave Request",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
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
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 5
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.event_available,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Overtime Request",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
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

              // Ticket
              ListTile(
                hoverColor: const Color(0xFFFFFFFF),
                tileColor: index == 6
                    ? const Color(0xFFFFFFFF)
                    : constants.mngrPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.confirmation_num,
                      color: constants.mainTextBlack,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Ticket",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    index = 6;
                  });
                },
              ),
            ],
          ),
        ),

        // ==================== Body ==================== //

        body: index == 0
            ? const ManagerDashboardScreen()
            : index == 1
                ? const ManagerEmpManagementScreen()
                : index == 2
                    ? const ManagerScheduleScreen()
                    : index == 3
                        ? const ManagerAttendanceScreen()
                        : index == 4
                            ? const ManagerLeaveReqScreen()
                            : index == 5
                                ? const ManagerOTRequestScreen()
                                : index == 6
                                    ? const ManagerTicketScreen()
                                    : const ManagerDashboardScreen(),
      ),
    );

    //
  }
}
