import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/manager_emp_attendance.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/manager_emp_leave.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/manager_emp_overtime.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/manager_emp_profile.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/global/tabviews/manager_tabview.dart';

// =============== TABVIEW  - ADMIN EMP MNGMT =============== //
class TabViewManagerEmpManagement extends StatefulWidget {
  const TabViewManagerEmpManagement({super.key});

  @override
  State<TabViewManagerEmpManagement> createState() =>
      _TabViewManagerEmpManagementState();
}

class _TabViewManagerEmpManagementState
    extends State<TabViewManagerEmpManagement> {
  final List<Widget> _tabViews = [
    const ProfileManager(),
    const AttendanceManager(),
    const OvertimeManagerEmp(),
    const LeaveManagerEmp(),
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
                  const ManagerTab(
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


// =============== TAB VIEW ADMIN EMP MANAGEMENT SCREEN =============== //
// class TabViewManagerEmpManagementScreen
//     extends StatelessElement<TabViewManagerEmpManagementScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => IndexProvider(),
//       child: Scaffold(
//         body: DefaultTabController(
//           length: _tabViews.length,
//           child: Container(
//             // Outer container
//             color: constants.adminBG,
//             child: Container(
//               // Inner container with padding
//               padding: const EdgeInsets.fromLTRB(110, 16, 110, 16),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
//                         child: BackButtonPressed(
//                           onPressed: () {
//                             final indexProvider = Provider.of<IndexProvider>(
//                                 context,
//                                 listen: false);
//                             indexProvider.setProfileAdminEmpMngmtIndex(0);
//                           },
//                           icon: const Icon(Icons.arrow_back_rounded),
//                           color: constants.lightGray,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
//                         child: Text(
//                           'Back',
//                           style:
//                               Theme.of(context).textTheme.bodyLarge?.copyWith(
//                                     color: constants.lightGray,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   //Container below tabs
//                   Container(
//                     decoration: const BoxDecoration(
//                       color: constants.adminFilter,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20.0),
//                         topRight: Radius.circular(20.0),
//                         bottomRight: Radius.circular(0),
//                         bottomLeft: Radius.circular(0),
//                       ),
//                     ),
//                     child: TabBar(
//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.grey,
//                       labelStyle:
//                           Theme.of(context).textTheme.labelLarge?.copyWith(
//                                 color: constants.mainTextBlack,
//                                 fontSize: 14,
//                               ),
//                       tabs: const [
//                         Tab(text: 'Profile',),
//                         Tab(text: 'Attendance'),
//                         Tab(text: 'Overtime'),
//                         Tab(text: 'Leave'),
//                       ],

//                     ),
//                   ),
//                   Expanded(
//                     child: TabBarView(children: _tabViews),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // =============== TABVIEWS  - ADMIN EMP MNGMT =============== //
// final List<Widget> _tabViews = [
//   const ProfileAdmin(),
//   const AttendanceAdmin(),
//   const OvertimeAdminEmp(),
//   const LeaveAdminEmp(),
// ];
