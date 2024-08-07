import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/admin_emp_attendance.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/admin_emp_leave.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/admin_emp_overtime.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/admin_emp_profile.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/global/tabviews/admin_tabview.dart';

// =============== TABVIEW  - ADMIN EMP MNGMT =============== //
class TabViewAdminEmpManagement extends StatefulWidget {
  const TabViewAdminEmpManagement({super.key});

  @override
  State<TabViewAdminEmpManagement> createState() =>
      _TabViewAdminEmpManagementState();
}

class _TabViewAdminEmpManagementState extends State<TabViewAdminEmpManagement> {
  final List<Widget> _tabViews = [
    const ProfileAdmin(),
    const AttendanceAdmin(),
    const OvertimeAdminEmp(),
    const LeaveAdminEmp(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabViewAdminProvider>(
      create: (context) => TabViewAdminProvider(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          ' >  Employee Management',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          ' >  Selected Employee',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: DateFormat('h').format(DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 20,
                                    ),
                              ),
                              TextSpan(
                                text: DateFormat(':mm ').format(DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 20,
                                    ),
                              ),
                              TextSpan(
                                text: DateFormat('a ').format(DateTime.now()),
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
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
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
          ),
        ),
        body: DefaultTabController(
          length: _tabViews.length,
          child: Container(
            color: constants.adminBG,
            child: Container(
              padding: const EdgeInsets.fromLTRB(28, 24, 28, 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                        child: BackButtonPressed(
                          onPressed: () {
                            final indexProvider = Provider.of<IndexProvider>(
                                context,
                                listen: false);
                            indexProvider.setProfileAdminEmpMngmtIndex(0);
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                          color: constants.lightGray,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                        child: Text(
                          'Back',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: constants.lightGray,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const AdminTab(
                    tabs: [
                      Row(
                        children: [
                          Spacer(),
                          Tab(text: 'Profile'),
                          Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Tab(text: 'Attendance'),
                          Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Tab(text: 'Overtime'),
                          Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Tab(text: 'Leave'),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: _tabViews,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =============== BACK BUTTON  - ADMIN EMP MNGMT =============== //
class BackButtonPressed extends StatelessWidget {
  const BackButtonPressed({
    super.key,
    required this.onPressed,
    required this.color,
    this.icon,
    this.label,
  });

  final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back_rounded),
      color: constants.lightGray,
    );
  }
}
