// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/admin_personal_details.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/manager_employee_data.dart';
import 'package:ssi_mis_flutter/global/printing/manager/print_emp_mngmt_manager.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/manager_tabs_emp_management.dart';

// =============== GLOBAL INDEX VARIABLE - BODY NAVIGATION =============== //
late int index;

// =============== INDEX MANAGEMENT - BODY NAVIGATION CLASS =============== //
class _IndexManagerEmpManagement extends State<ManagerEmpManagementScreen> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  final _ManagerEmpManagementScreenState _managerEmpState =
      _ManagerEmpManagementScreenState();
  final _NewEmpManagerEmpManagementScreenState _newEmpManagerState =
      _NewEmpManagerEmpManagementScreenState();

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final currentIndex = indexProvider.currentIndex;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          _managerEmpState.build(context), //provider index 0
          const TabViewManagerEmpManagement(), //provider index 1
          _newEmpManagerState.build(context), //provider index 2
        ],
      ),
    );
  }
  // FOR REFERENCE - STATEFUL INDEX CODE (DISABLED FOR PROVIDER)
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: index == 0
  //         ? _adminEmpState.build(context)
  //         : index == 1
  //             ? _tabViewState.build(context)
  //             : index == 2
  //                 ? _newEmpAdminState.build(context)
  //                 : _adminEmpState.build(context),
  //   );
  // }
}

// =============== ADMIN EMP MNGMT SCREEN =============== //
class ManagerEmpManagementScreen extends StatefulWidget {
  const ManagerEmpManagementScreen({super.key});
  @override
  State<ManagerEmpManagementScreen> createState() =>
      _IndexManagerEmpManagement();
}

class _ManagerEmpManagementScreenState
    extends State<ManagerEmpManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndexProvider(),
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
                          'Manager',
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
        body: Container(
          color: constants.adminBG,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ================ Search Field ================ //
                    Container(
                      height: 33,
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 10),
                      decoration: BoxDecoration(
                        color: constants.adminFilter,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: constants.lightGray,
                                    fontSize: 14,
                                  ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.search,
                              color: constants.lightGray,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),

                    // ================ Add New Employee button ================ //
                    // AddNewEmpPressed(
                    //     onPressed: () {
                    //       final indexProvider = Provider.of<IndexProvider>(
                    //           context,
                    //           listen: false);
                    //       indexProvider.setProfileAdminEmpMngmtIndex(2);
                    //     },
                    //     color: constants.adminPrimary,
                    //     borderRadius: 20,
                    //     label: 'Add Employee'),
                    // const SizedBox(width: 10),

                    // ================ Print button ================ //
                    CustomElevatedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PrintManagerEmpMngmt();
                          }),
                      color: constants.mngrPrimary,
                      borderRadius: 8,
                      label: Row(
                        children: [
                          const Icon(
                            Icons.print,
                            color: Colors.black,
                            size: 18,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Print",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ================ CARD TABLE ================ //
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ================ Data Table ================ //
                          DataTable(
                            // ================ Data Columns ================ //
                            columns: [
                              // ID
                              DataColumn(
                                label: Flexible(
                                  child: Center(
                                    child: Text(
                                      'ID No.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),

                              // Emp Name
                              DataColumn(
                                label: Flexible(
                                  child: Center(
                                    child: Text(
                                      'Employee Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),

                              // Position
                              DataColumn(
                                label: Flexible(
                                  child: Center(
                                    child: Text(
                                      'Position',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),

                              // Department
                              DataColumn(
                                label: Flexible(
                                  child: Center(
                                    child: Text(
                                      'Department',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),

                              // Status DISABLED FOR NOW
                              // DataColumn(
                              //   label: Flexible(
                              //     child: Center(
                              //       child: Text(
                              //         'Status',
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .labelLarge
                              //             ?.copyWith(
                              //               color: constants.mainTextBlack,
                              //               fontSize: 14,
                              //             ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              // Action
                              DataColumn(
                                label: Flexible(
                                  child: Center(
                                    child: Text(
                                      'Action',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],

                            // ================ Data Rows ================ //
                            rows: employeeData.map(
                              (employeeData) {
                                return DataRow(
                                  cells: [
                                    // ID
                                    DataCell(
                                      Center(
                                        child: Text(
                                          employeeData.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ),

                                    // Name
                                    DataCell(
                                      Center(
                                        child: Text(
                                          employeeData.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ),

                                    // Position
                                    DataCell(
                                      Center(
                                        child: Text(
                                          employeeData.position,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ),

                                    // Department
                                    DataCell(
                                      Center(
                                        child: Text(
                                          employeeData.department,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ),

                                    // Status DISABLED FOR NOW
                                    // DataCell(
                                    //   Center(child: employeeData.status),
                                    // ),

                                    // Action Buttons
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ManagerEmpMngmtProfileButtonofileButton(
                                            onPressed: () {
                                              final indexProvider =
                                                  Provider.of<IndexProvider>(
                                                      context,
                                                      listen: false);
                                              indexProvider
                                                  .setProfileAdminEmpMngmtIndex(
                                                      1);
                                            },
                                            icon: const Icon(Icons.visibility),
                                            color: constants.lightGray,
                                          ),
                                          // CustomAlertDialogButton(
                                          //   onPressed: () {},
                                          //   icon: const Icon(Icons.archive),
                                          //   color: constants.lightGray,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
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

// =============== EYE BUTTON  - ADMIN EMP MNGMT =============== //
class ManagerEmpMngmtProfileButtonofileButton extends StatelessWidget {
  const ManagerEmpMngmtProfileButtonofileButton({
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
      // FOR REFERENCE - STATEFUL INDEX CODE (DISABLED FOR PROVIDER)
      // onPressed: () {
      //   context.findAncestorStateOfType<_IndexManagerEmpManagement>()?.setState(
      //     () {
      //       index = 1;
      //     },
      //   );
      onPressed: onPressed,
      icon: const Icon(Icons.visibility),
      color: constants.lightGray,
    );
  }
}

// =============== ADD NEW EMPLOYEE - ADMIN EMP MNGMT =============== //
class _NewEmpManagerEmpManagementScreenState
    extends State<ManagerEmpManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return const NewEmpAdmin();
  }
}

// =============== ADD NEW EMPLOYEE PRESSED  - ADMIN EMP MNGMT =============== //
class AddNewEmpPressed extends StatefulWidget {
  const AddNewEmpPressed({
    super.key,
    required this.onPressed,
    required this.color,
    this.icon,
    this.label,
    required this.borderRadius,
  });

  final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final String? label;
  final double borderRadius;

  @override
  State<AddNewEmpPressed> createState() => _AddNewEmpPressedState();
}

class _AddNewEmpPressedState extends State<AddNewEmpPressed> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.person_add,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 12),
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 14,
              color: constants.mainTextWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
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

// =============== CANCEL BUTTON  - ADMIN EMP MNGMT =============== //
class CancelButtonPressed extends StatelessWidget {
  const CancelButtonPressed({
    super.key,
    required this.color,
    this.label,
  });

  final Color color;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final indexProvider =
            Provider.of<IndexProvider>(context, listen: false);
        indexProvider.setProfileAdminEmpMngmtIndex(0);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(constants.lightGray),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        'Cancel',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: constants.mainTextWhite,
              fontSize: 16,
            ),
      ),
    );
  }
}
