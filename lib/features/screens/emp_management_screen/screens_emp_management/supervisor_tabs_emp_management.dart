import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/supervisor_emp_attendance.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/supervisor_emp_leave.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/supervisor_emp_overtime.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/supervisor_emp_profile.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/tabviews/supervisor_tabview.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:provider/provider.dart';

// =============== TABVIEWS  - ADMIN EMP MNGMT =============== //
class TabViewSupervisorEmpManagement extends StatefulWidget {
  const TabViewSupervisorEmpManagement({super.key});

  @override
  State<TabViewSupervisorEmpManagement> createState() =>
      _TabViewAdminEmpManagementState();
}

class _TabViewAdminEmpManagementState
    extends State<TabViewSupervisorEmpManagement> {
  final List<Widget> _tabViews = [
    const SupervisorEmpProfile(),
    const SupervisorEmpAttendance(),
    const SupervisorEmpOvertime(),
    const SupervisorEmpLeave(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabViewAdminProvider>(
      create: (context) => TabViewAdminProvider(),
      child: Scaffold(
        // =========================== BreadCrumbs ===========================
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
                          'Supervisor',
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

        //
        body: Container(
          color: constants.adminBG,
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(28, 24, 28, 28),
          child: Column(
            children: [
              // ================= Back Button Row =================
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      final indexProvider =
                          Provider.of<IndexProvider>(context, listen: false);
                      indexProvider.setProfileAdminEmpMngmtIndex(0);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: constants.lightGray,
                    iconSize: 18,
                  ),
                  Text(
                    'Back',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: constants.lightGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ====================== TabBar =======================
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: constants.adminTable,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: DefaultTabController(
                    length: _tabViews.length,
                    child: Column(
                      children: [
                        // ================== Tabs ===================
                        const SupervisorTab(
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

                        // =============== TabBar View ================
                        Expanded(
                          child: TabBarView(children: _tabViews),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
