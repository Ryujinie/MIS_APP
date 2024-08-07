// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/attendance_screen/admin_attendance_screen.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/admin_dashboard/admin_dashboard_screen.dart';
import 'package:ssi_mis_flutter/features/screens/department_screen/admin_department_screen.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/admin_emp_management_screen.dart';
import 'package:ssi_mis_flutter/features/screens/job_position_screen/job_position_screen.dart';
import 'package:ssi_mis_flutter/features/screens/leave_req_screen/admin_leave_req_screen.dart';
import 'package:ssi_mis_flutter/features/screens/login_screens/login_form_screen.dart';
import 'package:ssi_mis_flutter/features/screens/ot_req_screen/admin_otreq_screen.dart';
import 'package:ssi_mis_flutter/features/screens/role_screen/admin_role_screen.dart';
import 'package:ssi_mis_flutter/features/screens/schedule_screen/admin_schedule_screen.dart';
import 'package:ssi_mis_flutter/features/screens/ticket_screen/admin_ticket_screen.dart';
import 'package:ssi_mis_flutter/features/screens/login_screens/login_screen.dart';
import 'package:ssi_mis_flutter/global/widgets/logout_popmenu.dart';
import 'package:ssi_mis_flutter/global/widgets/bell_notification_popmenu.dart';

// ========================== Sample Profile ==========================
const String profileImagePath = 'assets/images/appbar_profile.png';

class AdminSidebarScreen extends StatefulWidget {
  const AdminSidebarScreen({super.key});

  @override
  State<AdminSidebarScreen> createState() => _AdminSidebarScreenState();
}

class _AdminSidebarScreenState extends State<AdminSidebarScreen> {
  late int index;
  String? selectedStatus;

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
          backgroundColor: constants.adminPrimary,

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
                      onPressed: () => adminNotifMenu(context),
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
                            'Admin Name',
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
                            'Administrator',
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
                      onPressed: () => adminShowLogoutMenu(context),
                    ),
                    const SizedBox(width: 0),
                  ],
                ),
              ),
            ],
          ),

          //Breadcrumbs
          automaticallyImplyLeading: true,
          bottom: index == 0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(40.0),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                          child: Row(
                            children: [
                              Text(
                                'Administrator',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 20,
                                    ),
                              ),
                              const SizedBox(width: 10.0),
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
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: DateFormat('h')
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 20,
                                          ),
                                    ),
                                    TextSpan(
                                      text: DateFormat(':mm ')
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 20,
                                          ),
                                    ),
                                    TextSpan(
                                      text: DateFormat('a ')
                                          .format(DateTime.now()),
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
                              //Divider
                              Container(
                                height: 25,
                                width: 1.5,
                                color: constants.mainTextGrey,
                              ),
                              Text(
                                ' PST',
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
                          Positioned.fill(
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Administrator',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 20,
                                        ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    ' >  Role',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 20,
                                        ),
                                  ),
                                  const Spacer(),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: DateFormat('h')
                                              .format(DateTime.now()),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 20,
                                              ),
                                        ),
                                        TextSpan(
                                          text: DateFormat(':mm ')
                                              .format(DateTime.now()),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 20,
                                              ),
                                        ),
                                        TextSpan(
                                          text: DateFormat('a ')
                                              .format(DateTime.now()),
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
                                  //Divider
                                  Container(
                                    height: 25,
                                    width: 1.5,
                                    color: constants.mainTextGrey,
                                  ),
                                  Text(
                                    ' PST',
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
                              Positioned.fill(
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 10, 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Administrator',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: constants.mainTextGrey,
                                              fontSize: 20,
                                            ),
                                      ),
                                      const SizedBox(width: 10.0),
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
                                      const Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: DateFormat('h')
                                                  .format(DateTime.now()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: DateFormat(':mm ')
                                                  .format(DateTime.now()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: DateFormat('a ')
                                                  .format(DateTime.now()),
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
                                      //Divider
                                      Container(
                                        height: 25,
                                        width: 1.5,
                                        color: constants.mainTextGrey,
                                      ),
                                      Text(
                                        ' PST',
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
                                  Positioned.fill(
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 5, 10, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Administrator',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: constants.mainTextGrey,
                                                  fontSize: 20,
                                                ),
                                          ),
                                          const SizedBox(width: 10.0),
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
                                          const Spacer(),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: DateFormat('h')
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 20,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: DateFormat(':mm ')
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 20,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: DateFormat('a ')
                                                      .format(DateTime.now()),
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
                                          //Divider
                                          Container(
                                            height: 25,
                                            width: 1.5,
                                            color: constants.mainTextGrey,
                                          ),
                                          Text(
                                            ' PST',
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
                                  preferredSize: const Size.fromHeight(0.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 10, 0),
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
                                                      fontSize: 0,
                                                    ),
                                              ),
                                              const SizedBox(width: 10.0),
                                              Text(
                                                '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      color: constants
                                                          .mainTextGrey,
                                                      fontSize: 0,
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
                                          Positioned.fill(
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 5, 10, 5),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Administrator',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: constants
                                                              .mainTextGrey,
                                                          fontSize: 20,
                                                        ),
                                                  ),
                                                  const SizedBox(width: 10.0),
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
                                                  const Spacer(),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: DateFormat('h')
                                                              .format(DateTime
                                                                  .now()),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                    color: constants
                                                                        .mainTextGrey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                        ),
                                                        TextSpan(
                                                          text: DateFormat(
                                                                  ':mm ')
                                                              .format(DateTime
                                                                  .now()),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                    color: constants
                                                                        .mainTextGrey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                        ),
                                                        TextSpan(
                                                          text: DateFormat('a ')
                                                              .format(DateTime
                                                                  .now()),
                                                          style:
                                                              Theme.of(context)
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
                                                  //Divider
                                                  Container(
                                                    height: 25,
                                                    width: 1.5,
                                                    color:
                                                        constants.mainTextGrey,
                                                  ),
                                                  Text(
                                                    ' PST',
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
                                  : index == 6
                                      ? PreferredSize(
                                          preferredSize:
                                              const Size.fromHeight(40.0),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 5, 10, 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Administrator',
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
                                                          width: 10.0),
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
                                                      const Spacer(),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: DateFormat(
                                                                      'h')
                                                                  .format(DateTime
                                                                      .now()),
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
                                                            TextSpan(
                                                              text: DateFormat(
                                                                      ':mm ')
                                                                  .format(DateTime
                                                                      .now()),
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
                                                            TextSpan(
                                                              text: DateFormat(
                                                                      'a ')
                                                                  .format(DateTime
                                                                      .now()),
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
                                                      //Divider
                                                      Container(
                                                        height: 25,
                                                        width: 1.5,
                                                        color: constants
                                                            .mainTextGrey,
                                                      ),
                                                      Text(
                                                        ' PST',
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
                                      : index == 7
                                          ? PreferredSize(
                                              preferredSize:
                                                  const Size.fromHeight(40.0),
                                              child: Stack(
                                                children: [
                                                  Positioned.fill(
                                                    child: Container(
                                                      color: Colors.white,
                                                    ),
                                                  ),
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
                                                            'Administrator',
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
                                                              width: 10.0),
                                                          Text(
                                                            ' >  Leave Request',
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
                                                          const Spacer(),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: DateFormat(
                                                                          'h')
                                                                      .format(DateTime
                                                                          .now()),
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
                                                                TextSpan(
                                                                  text: DateFormat(
                                                                          ':mm ')
                                                                      .format(DateTime
                                                                          .now()),
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
                                                                TextSpan(
                                                                  text: DateFormat(
                                                                          'a ')
                                                                      .format(DateTime
                                                                          .now()),
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
                                                          //Divider
                                                          Container(
                                                            height: 25,
                                                            width: 1.5,
                                                            color: constants
                                                                .mainTextGrey,
                                                          ),
                                                          Text(
                                                            ' PST',
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
                                          : index == 8
                                              ? PreferredSize(
                                                  preferredSize:
                                                      const Size.fromHeight(
                                                          40.0),
                                                  child: Stack(
                                                    children: [
                                                      Positioned.fill(
                                                        child: Container(
                                                          color: Colors.white,
                                                        ),
                                                      ),
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
                                                                'Administrator',
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
                                                                  width: 10.0),
                                                              Text(
                                                                ' >  Overtime Request',
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
                                                              const Spacer(),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: DateFormat(
                                                                              'h')
                                                                          .format(
                                                                              DateTime.now()),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall
                                                                          ?.copyWith(
                                                                            color:
                                                                                constants.mainTextGrey,
                                                                            fontSize:
                                                                                20,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: DateFormat(
                                                                              ':mm ')
                                                                          .format(
                                                                              DateTime.now()),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall
                                                                          ?.copyWith(
                                                                            color:
                                                                                constants.mainTextGrey,
                                                                            fontSize:
                                                                                20,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: DateFormat(
                                                                              'a ')
                                                                          .format(
                                                                              DateTime.now()),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall
                                                                          ?.copyWith(
                                                                            color:
                                                                                constants.mainTextGrey,
                                                                            fontSize:
                                                                                20,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              //Divider
                                                              Container(
                                                                height: 25,
                                                                width: 1.5,
                                                                color: constants
                                                                    .mainTextGrey,
                                                              ),
                                                              Text(
                                                                ' PST',
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
                                              : index == 9
                                                  ? PreferredSize(
                                                      preferredSize:
                                                          const Size.fromHeight(
                                                              40.0),
                                                      child: Stack(
                                                        children: [
                                                          Positioned.fill(
                                                            child: Container(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      5,
                                                                      10,
                                                                      5),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'Administrator',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodySmall
                                                                        ?.copyWith(
                                                                          color:
                                                                              constants.mainTextGrey,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          10.0),
                                                                  Text(
                                                                    ' >  Ticket',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall
                                                                        ?.copyWith(
                                                                          color:
                                                                              constants.mainTextGrey,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                  ),
                                                                  const Spacer(),
                                                                  RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              DateFormat('h').format(DateTime.now()),
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall
                                                                              ?.copyWith(
                                                                                color: constants.mainTextGrey,
                                                                                fontSize: 20,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              DateFormat(':mm ').format(DateTime.now()),
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall
                                                                              ?.copyWith(
                                                                                color: constants.mainTextGrey,
                                                                                fontSize: 20,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              DateFormat('a ').format(DateTime.now()),
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
                                                                  //Divider
                                                                  Container(
                                                                    height: 25,
                                                                    width: 1.5,
                                                                    color: constants
                                                                        .mainTextGrey,
                                                                  ),
                                                                  Text(
                                                                    ' PST',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall
                                                                        ?.copyWith(
                                                                          color:
                                                                              constants.mainTextGrey,
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
                                                      preferredSize:
                                                          const Size.fromHeight(
                                                              40.0),
                                                      child: Stack(
                                                        children: [
                                                          Positioned.fill(
                                                            child: Container(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      5,
                                                                      10,
                                                                      5),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    '',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodySmall
                                                                        ?.copyWith(
                                                                          color:
                                                                              constants.mainTextGrey,
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
          backgroundColor: constants.adminPrimary,
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
                    "Welcome Admin",
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
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 0
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
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

              // Role
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 1
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.admin_panel_settings,
                      color: constants.mainTextWhite,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Role",
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

              // Department
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 2
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.business_center,
                      color: constants.mainTextWhite,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Department",
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

              // Job Position
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 3
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.badge,
                      color: constants.mainTextWhite,
                      size: 22,
                    ),

                    const SizedBox(width: 12),

                    //
                    Text(
                      "Job Position",
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

              // Employee
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 4
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
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
                      "Employee",
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

              // Schedule
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 5
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
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
                    index = 5;
                  });
                },
              ),

              // Attendance
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 6
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
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
                    index = 6;
                  });
                },
              ),

              // Leave Request
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 7
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
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
                    index = 7;
                  });
                },
              ),

              // Overtime Request
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 8
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
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
                    index = 8;
                  });
                },
              ),

              // Ticket
              ListTile(
                hoverColor: const Color(0xFF7B2121),
                tileColor: index == 9
                    ? const Color(0xFF7B2121)
                    : constants.adminPrimary,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.confirmation_num,
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
                    index = 9;
                  });
                },
              ),
            ],
          ),
        ),

        // ==================== Body ==================== //

        body: index == 0
            ? const AdminDashboardScreen()
            : index == 1
                ? const AdminRoleScreen()
                : index == 2
                    ? const AdminDepartmentScreen()
                    : index == 3
                        ? const AdminJobPositionScreen()
                        : index == 4
                            ? const AdminEmpManagementScreen()
                            : index == 5
                                ? const AdminScheduleScreen()
                                : index == 6
                                    ? const AdminAttendanceScreen()
                                    : index == 7
                                        ? const AdminLeaveReqScreen()
                                        : index == 8
                                            ? const AdminOTRequestScreen()
                                            : index == 9
                                                ? const AdminTicketScreen()
                                                : const AdminDashboardScreen(),
      ),
    );

    //
  }
}
