// ignore_for_file: unused_import, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/hr_personal_details.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/hr_tabs_emp_management.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/hr_employee_data.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/supervisor_tabs_emp_management.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/printing/supervisor/print_emp_mngmt_supervisor.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:provider/provider.dart';

// =============== GLOBAL INDEX VARIABLE - BODY NAVIGATION =============== //
late int index;

// =============== INDEX MANAGEMENT - BODY NAVIGATION CLASS =============== //
class _IndexSupervisorEmpManagement
    extends State<SupervisorEmpManagementScreen> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  final _SupervisorEmpManagementScreenState _supervisorEmpState =
      _SupervisorEmpManagementScreenState();

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final currentIndex = indexProvider.currentIndex;

    return IndexedStack(
      index: currentIndex,
      children: [
        _supervisorEmpState.build(context), //provider index 0
        const TabViewSupervisorEmpManagement(), //provider index 1
      ],
    );
  }
}

// ============================ Supervisor EMPLOYEE MANAGEMENT SCREEN ============================ //
class SupervisorEmpManagementScreen extends StatefulWidget {
  const SupervisorEmpManagementScreen({super.key});
  @override
  State<SupervisorEmpManagementScreen> createState() =>
      _IndexSupervisorEmpManagement();
}

class _SupervisorEmpManagementScreenState
    extends State<SupervisorEmpManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndexProvider(),
      child: Scaffold(
        // ======================= Breadcrumbs =======================
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
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
          color: constants.adminBG,
          height: double.infinity,
          child: Column(
            children: [
              // ======================= Search Bar, Date Filter, Add Employee =======================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // =============== Search Employee, Date Filter Row ===============
                  const Row(
                    children: [
                      // Search Employee
                      CustomSearchBar(hintText: 'Search Employee'),

                      SizedBox(width: 5),

                      // Date Filter
                      DateFilter(),
                    ],
                  ),

                  // =============== Add Employee Button ================
                  // ================ Print button ================ //
                  CustomElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PrintSupervisorEmpMngmt();
                        }),
                    color: constants.supervisorBtn,
                    borderRadius: 8,
                    label: Row(
                      children: [
                        const Icon(
                          Icons.print,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Print",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: constants.mainTextWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ============================ CARD TABLE ============================
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ====================== Data Table ======================
                          DataTable(
                            // ================ Data Columns ================
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

                              // Status
                              DataColumn(
                                label: Flexible(
                                  child: Center(
                                    child: Text(
                                      'Status',
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

                            // ================ Data Rows ================
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
                                        child: SizedBox(
                                          child: Text(
                                            employeeData.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack,
                                                  fontSize: 14,
                                                ),
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

                                    // Status
                                    DataCell(
                                      Center(
                                        child: employeeData.status ==
                                                "Probationary"
                                            ? const PillContainer(
                                                color: constants.hrstatusOrange,
                                                label: "Probationary",
                                                labelColor:
                                                    constants.mainTextWhite,
                                                width: 100,
                                              )
                                            : employeeData.status == "Regular"
                                                ? const PillContainer(
                                                    color:
                                                        constants.hrstatusGreen,
                                                    label: "Regular",
                                                    labelColor:
                                                        constants.mainTextWhite,
                                                    width: 100,
                                                  )
                                                : employeeData.status ==
                                                        "Part-Time"
                                                    ? const PillContainer(
                                                        color: constants
                                                            .hrstatusYellow,
                                                        label: "Part-Time",
                                                        labelColor: constants
                                                            .mainTextWhite,
                                                        width: 100,
                                                      )
                                                    : employeeData.status ==
                                                            "Intern"
                                                        ? const PillContainer(
                                                            color: constants
                                                                .hrstatusBlue,
                                                            label: "Intern",
                                                            labelColor: constants
                                                                .mainTextWhite,
                                                            width: 100,
                                                          )
                                                        : employeeData.status ==
                                                                "Contractual"
                                                            ? const PillContainer(
                                                                color: constants
                                                                    .hrstatusGray,
                                                                label:
                                                                    "Contractual",
                                                                labelColor:
                                                                    constants
                                                                        .mainTextWhite,
                                                                width: 100,
                                                              )
                                                            : Container(),
                                      ),
                                    ),

                                    // Action Buttons
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //View Employee
                                          ViewButton(
                                            onPressed: () {
                                              final indexProvider =
                                                  Provider.of<IndexProvider>(
                                                      context,
                                                      listen: false);
                                              indexProvider
                                                  .setProfileAdminEmpMngmtIndex(
                                                      1);
                                            },
                                          ),

                                          //Archive
                                          //const ConfirmArchive(),
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

// =============== BACK BUTTON  - Supervisor EMP MNGMT =============== //
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

// =============== CANCEL BUTTON  - Supervisor EMP MNGMT =============== //
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
