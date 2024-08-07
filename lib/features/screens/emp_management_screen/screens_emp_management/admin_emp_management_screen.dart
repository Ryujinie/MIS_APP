// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/admin_personal_details.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/employee_data.dart';
import 'package:ssi_mis_flutter/global/printing/admin/print_emp_mngmt_admin.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/admin_tabs_emp_management.dart';

// =============== GLOBAL INDEX VARIABLE - BODY NAVIGATION =============== //
late int index;

// =============== INDEX MANAGEMENT - BODY NAVIGATION CLASS =============== //
class _IndexAdminEmpManagement extends State<AdminEmpManagementScreen> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  final _AdminEmpManagementScreenState _adminEmpState =
      _AdminEmpManagementScreenState();
  final _NewEmpAdminEmpManagementScreenState _newEmpAdminState =
      _NewEmpAdminEmpManagementScreenState();

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final currentIndex = indexProvider.currentIndex;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          _adminEmpState.build(context), //provider index 0
          const TabViewAdminEmpManagement(), //provider index 1
          _newEmpAdminState.build(context), //provider index 2
        ],
      ),
    );
  }
}

// =============== ADMIN EMP MNGMT SCREEN =============== //
class AdminEmpManagementScreen extends StatefulWidget {
  const AdminEmpManagementScreen({super.key});
  @override
  State<AdminEmpManagementScreen> createState() => _IndexAdminEmpManagement();
}

class _AdminEmpManagementScreenState extends State<AdminEmpManagementScreen> {
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
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ================ Search Field ================ //
                    const CustomSearchBar(
                      hintText: "Search Employee...",
                    ),
                    const Spacer(),

                    // ================ Add New Employee button ================ //
                    AddNewEmpPressed(
                      onPressed: () {
                        final indexProvider =
                            Provider.of<IndexProvider>(context, listen: false);
                        indexProvider.setProfileAdminEmpMngmtIndex(2);
                      },
                      color: constants.adminBtn,
                      borderRadius: 8,
                      label: 'Add Employee',
                    ),
                    const SizedBox(width: 10),

                    // ================ Print button ================ //

                    CustomElevatedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PrintAdminEmpMngmt();
                          }),
                      color: constants.adminBtn,
                      label: Column(
                        children: [
                          const SizedBox(height: 2.5),
                          Row(
                            children: [
                              const Icon(
                                Icons.print,
                                color: constants.mainTextWhite,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                'Print Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: constants.mainTextWhite,
                                      //fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2.5),
                        ],
                      ),
                      borderRadius: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),

              // ================ CARD TABLE ================ //
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, .0, 28.0, 28.0),
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

                                    // Action Buttons
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AdminEmpMngmtProfileButton(
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
class AdminEmpMngmtProfileButton extends StatelessWidget {
  const AdminEmpMngmtProfileButton({
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
      icon: const Icon(Icons.visibility),
      color: constants.lightGray,
    );
  }
}

// =============== ADD NEW EMPLOYEE - ADMIN EMP MNGMT =============== //
class _NewEmpAdminEmpManagementScreenState
    extends State<AdminEmpManagementScreen> {
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
              fontWeight: FontWeight.w400,
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
