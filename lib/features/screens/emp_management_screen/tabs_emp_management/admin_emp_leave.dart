import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/modals/admin_viewleave_modal.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/printing/admin/print_leave_admin.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

// =============== LEAVE TAB - ADMIN EMP MNGMT =============== //
class LeaveAdminEmp extends StatelessWidget {
  const LeaveAdminEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
      decoration: const BoxDecoration(
        color: constants.hrTable,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 30.0),
                const CustomSearchBarFilter(
                  hintText: "Search Leave...",
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PrintAdminLeave();
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
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2.5),
                    ],
                  ),
                  borderRadius: 8,
                ),
                const SizedBox(width: 50),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Request ID',
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
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Type of Leave',
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
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Start Date',
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
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'End Date',
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
                      rows: leaveRecord.map((leave) {
                        return DataRow(cells: [
                          DataCell(
                            Center(
                              child: Text(
                                leave.empID.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                    ),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(leave.empName),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(leave.type),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                DateFormat('MM/dd/yyyy')
                                    .format(leave.startDate)
                                    .toString(),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                DateFormat('MM/dd/yyyy')
                                    .format(leave.endDate)
                                    .toString(),
                              ),
                            ),
                          ),
                          DataCell(Center(child: leave.status)),
                          const DataCell(
                            Center(
                              child: ViewLeave(),
                            ),
                          ),
                        ]);
                      }).toList(),
                      headingTextStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String selectedValue = "id";

// ========================== Sample Dropdown Data ==========================
List<DropdownMenuItem<String>> get filterDropdown {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "id", child: Text("ID")),
    const DropdownMenuItem(value: "date", child: Text("Date")),
    const DropdownMenuItem(value: "status", child: Text("Status")),
  ];
  return menuItems;
}

class Leave {
  final int empID;
  final String empName;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final Widget status;

  Leave({
    required this.empID,
    required this.empName,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}

//============================== SAMPLE DATA FOR TABLE ==============================
final List<Leave> leaveRecord = [
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 04, 18, 30),
    status: const StatusFinalApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Maternity Leave",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 05, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 01, 8, 30),
    endDate: DateTime(2024, 04, 03, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Administrative Leave",
    startDate: DateTime(2024, 05, 03, 8, 30),
    endDate: DateTime(2024, 05, 04, 18, 30),
    status: const StatusApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 05, 21, 8, 30),
    endDate: DateTime(2024, 05, 23, 18, 30),
    status: const StatusFinalApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Paternity Leave",
    startDate: DateTime(2024, 02, 13, 8, 30),
    endDate: DateTime(2024, 02, 15, 18, 30),
    status: const StatusDeclined(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Vacation Leave",
    startDate: DateTime(2024, 01, 12, 8, 30),
    endDate: DateTime(2024, 01, 14, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 17, 8, 30),
    endDate: DateTime(2024, 04, 18, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Emergency Leave",
    startDate: DateTime(2024, 04, 13, 8, 30),
    endDate: DateTime(2024, 04, 15, 18, 30),
    status: const StatusDeclined(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Vacation Leave",
    startDate: DateTime(2024, 04, 21, 8, 30),
    endDate: DateTime(2024, 04, 23, 18, 30),
    status: const StatusFinalApproval(),
  ),
];
